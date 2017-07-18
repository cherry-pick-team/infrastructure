FROM python:3.5.2-slim

WORKDIR /usr/src/app

RUN apt-get update \
    && apt-get install -y git-core

RUN sh -c 'echo "deb http://www.deb-multimedia.org jessie main" > /etc/apt/sources.list.d/deb-multimedia.list'\
    && apt-get update \
    && apt-get install -y --force-yes deb-multimedia-keyring\
    && apt-get update \
    && apt-get install -y --force-yes ffmpeg \
    && apt-get install -y espeak espeak-data libespeak1 libespeak-dev \
    && apt-get install -y festival*

RUN apt-get install -y build-essential \
    && apt-get install -y flac libasound2-dev libsndfile1-dev vorbis-tools\
    && apt-get install -y libxml2-dev libxslt-dev zlib1g-dev \
    && apt-get install -y python-dev python-pip \
    && apt-get install -y file htop screen vim unzip \
    && pip install pip --upgrade \
    && pip install numpy --upgrade \
    && pip install boto3 requests tgt youtube-dl --upgrade \
    && apt-get install -y zlib1g libjpeg-dev \
    && pip install Pillow --upgrade \
    && AENEAS_FORCE_CFW=True pip install aeneas --upgrade \
    && apt-get install -y libpq-dev gcc

RUN apt-get install -y python3 python3-pip netcat \
    && apt-get install -y libpq-dev gcc 

COPY cookies.sqlite .

ADD https://api.github.com/repos/cherry-pick-team/music-downloader/git/refs/heads/master version.json
RUN git clone https://github.com/cherry-pick-team/music-downloader.git
WORKDIR music-downloader
ENV PYTHONPATH=/usr/src/app/music-downloader

RUN pip install --no-cache-dir -r requirements.txt

CMD ./wait.sh && python main_handles.py
