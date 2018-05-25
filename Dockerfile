FROM maven:3.5.3-jdk-8

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        openjfx \
        unzip \
&& rm -f /var/lib/apt/lists/*_dists_*

RUN apt-get update
RUN sudo apt-get  install -y xvfb x11vnc x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps

ADD xvfb_init /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb
ADD xvfb_daemon_run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run

ENV DISPLAY :99
