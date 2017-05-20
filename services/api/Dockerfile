FROM python:3.5.2-slim

WORKDIR /usr/src/app

RUN apt-get update \
     && apt-get install -y netcat libpq-dev gcc git-core \
     && sh -c 'echo "deb http://www.deb-multimedia.org jessie main" > /etc/apt/sources.list.d/deb-multimedia.list' \
     && apt-get update \
     && apt-get install -y --force-yes deb-multimedia-keyring \
     && apt-get update \
     && apt-get install -y --force-yes ffmpeg swig libpulse-dev

RUN git clone https://github.com/cherry-pick-team/api.git

WORKDIR api
ENV PYTHONPATH=/usr/src/app/api

RUN pip install --no-cache-dir -r requirements.txt

CMD ./wait.sh && python cherry-pick-api.py

