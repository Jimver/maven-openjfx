FROM maven:3.5.3-jdk-8

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        openjfx \
        unzip \
&& rm -f /var/lib/apt/lists/*_dists_*

RUN apt-get update
RUN sudo apt install -y xvfb

ADD xvfb_init /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb
ADD xvfb_daemon_run /usr/bin/xvfb-daemon-run
RUN chmod a+x /usr/bin/xvfb-daemon-run

ENV DISPLAY :99
