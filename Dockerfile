FROM debian:stretch

RUN apt update && \
    apt install -y git sqlite3 python2.7 python-virtualenv python3.5 python-pip python3-pip python3-virtualenv ffmpeg nginx bash telnet && \
    mkdir -p /srv/taiko-web

RUN mkdir -p /srv/taiko-web && virtualenv -p /usr/bin/python2 .venv2 && \
    pip install Flask ffmpy gunicorn && \
    virtualenv -p /usr/bin/python3 .venv3 && \
    pip3 install websockets

RUN git clone https://git.taiko.zone/bui/taiko-web.git /srv/taiko-web && \
    service nginx restart && \
    cd /srv/taiko-web

RUN cd /srv/taiko-web && mkdir -p public/songs

ENV PATH "/usr/bin:/usr/sbin:/bin:/usr/local/bin"
ADD launch.sh /opt

RUN chmod +x /opt/launch.sh

RUN rm -rf /var/lib/apt/lists/*
CMD [ "/opt/launch.sh" ]
