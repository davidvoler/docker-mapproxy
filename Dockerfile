FROM tiangolo/uwsgi-nginx:python3.6

ADD 71-apt-cacher-ng /etc/apt/apt.conf.d/71-apt-cacher-ng

RUN apt-get -y update
RUN apt-get install -y python-imaging python-yaml libproj0 libfcgi-dev
RUN apt-get install -y libgeos-dev python-lxml libgdal-dev python-shapely
# RUN apt-get install -y \
#     python-imaging \
#     python-yaml \
#     libproj0 \
#     libgeos-dev \
#     python-lxml \
#     libgdal-dev \
#     build-essential \
#     python-dev \
#     libjpeg-dev \
#     zlib1g-dev \
#     libfreetype6-dev \
#     python-virtualenv


ENV UWSGI_INI /app/uwsgi.ini

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /cache_data
VOLUME ["/cache_data"]

COPY ./app /app
WORKDIR /app



