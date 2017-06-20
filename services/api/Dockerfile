FROM python:3.5.2-slim

WORKDIR /usr/src/app

RUN sh -c 'echo "deb http://www.deb-multimedia.org jessie main" > /etc/apt/sources.list.d/deb-multimedia.list' \
     && apt-get update \
     && apt-get install -y --force-yes netcat libpq-dev gcc git-core \
     && apt-get install -y --force-yes deb-multimedia-keyring \
     && apt-get install -y --force-yes ffmpeg swig libpulse-dev

ADD https://api.github.com/repos/cherry-pick-team/api/git/refs/heads/master version.json
RUN git clone -b master https://github.com/cherry-pick-team/api.git

WORKDIR api
ENV PYTHONPATH=/usr/src/app/api

RUN pip install --no-cache-dir -r requirements.txt

CMD ./wait.sh && gunicorn --log-level debug --workers 4 --bind 0.0.0.0:5000 wsgi

