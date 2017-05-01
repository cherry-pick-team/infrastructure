FROM gillbeits/sphinxsearch:2.2.9

RUN mkdir -p /var/data/sphinx/_data

RUN wget http://sphinxsearch.com/files/dicts/ru.pak -P /var/lib/sphinx/_dict
RUN wget http://sphinxsearch.com/files/dicts/en.pak -P /var/lib/sphinx/_dict

COPY ./entrypoint.sh /
COPY ./sphinx.conf /etc/sphinx/
COPY ./crontab /etc

