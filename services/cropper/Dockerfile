FROM python:3.5.2-slim

WORKDIR /usr/src/app

RUN apt-get update \
    && apt-get install -y netcat libav-tools git-core \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/*

ADD https://api.github.com/repos/cherry-pick-team/cut-music-service/git/refs/heads/master version.json
RUN git clone https://github.com/cherry-pick-team/cut-music-service.git

WORKDIR cut-music-service
ENV PYTHONPATH=/usr/src/app/cut-music-service

RUN pip install --no-cache-dir -r requirements.txt

CMD ./wait.sh && python bin/service.py
