#include <libnotify/notify.h>
#include <fstream>
#include <string>
#include <stdio.h>
#include <sys/un.h>
#include <unistd.h>

int Daemon();
int main(int argc, char* argv[])
{
#ifdef DAEMON
    pid_t parpid = fork();
    if ( parpid != 0 ) {
        printf("\ncan't fork or alredy exist");
        exit(1);
    }
    setsid();
#endif
    return Daemon();
}

int Daemon() {
    int temp, last_temp = 0;
    std::string hot;
    std::ifstream input("/sys/class/thermal/thermal_zone0/temp");
    while ( true ) {
        input >> temp;
        input.clear();
        input.seekg(0);
        if ( temp > 70000 ) {
            if( last_temp && temp >= last_temp ||  temp > 90000  ) {
                char buff[80]{"Your computer is too hot: "};
                hot = std::to_string(temp/1000);
                strcat(buff, (hot + " °C").c_str());
                notify_init("fanWatch");
                NotifyNotification *n = notify_notification_new(
                                                        "OVERHEAT",
                                                                buff,
                                                           "/home/vuniverse/Pictures/icons/");
                notify_notification_set_timeout(n, 20000); // 20 s
                if (!notify_notification_show(n, 0)) {
                    printf("\nNOTIFICATION FAILED");
                    return -1;
                }
            } else
                last_temp = temp;
        }
        sleep(60);
    }
    return 0;
}
