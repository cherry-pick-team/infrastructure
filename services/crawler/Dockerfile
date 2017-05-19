FROM debian:jessie

ENV PYTHONPATH=/usr/src/app/crawler

RUN sh -c 'echo "deb http://www.deb-multimedia.org jessie main" > /etc/apt/sources.list.d/deb-multimedia.list'\
    && apt-get update \
    && apt-get install -y --force-yes deb-multimedia-keyring\
    && apt-get install -y --force-yes ffmpeg \
    && apt-get install -y --force-yes espeak espeak-data libespeak1 libespeak-dev \
    && apt-get install -y --force-yes festival* \
    && apt-get install -y --force-yes build-essential \
    && apt-get install -y --force-yes flac libasound2-dev libsndfile1-dev vorbis-tools\
    && apt-get install -y --force-yes libxml2-dev libxslt-dev zlib1g-dev \
    && apt-get install -y --force-yes python-dev python-pip \
    && apt-get install -y --force-yes git \
    && apt-get install -y --force-yes file htop screen vim unzip \
    && pip install pip --upgrade \
    && pip install numpy --upgrade \
    && pip install boto3 requests tgt youtube-dl --upgrade \
    && apt-get install -y --force-yes zlib1g libjpeg-dev \
    && pip install Pillow --upgrade \
    && AENEAS_FORCE_CFW=True pip install aeneas --upgrade \
    && apt-get install -y --force-yes libpq-dev gcc

RUN apt-get install -y python3 python3-pip netcat \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/*

WORKDIR /usr/src/app
RUN git clone https://github.com/cherry-pick-team/database-filler.git
WORKDIR database-filler

RUN pip3 install -r requirements.txt

CMD ./wait.sh && python3 main.py -f lala.txt
