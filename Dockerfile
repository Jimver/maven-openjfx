FROM maven:3.5.3-jdk-8

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        openjfx \
        unzip \
&& rm -f /var/lib/apt/lists/*_dists_*
