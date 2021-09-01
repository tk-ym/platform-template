FROM python:3.8.1

RUN apt-get update
RUN apt-get install -y postgresql-client

RUN pip install --upgrade pip

ADD ./app /opt/app
COPY ./uwsgi.ini /opt
WORKDIR /opt/app

RUN pip install -r requirements/base.txt

COPY docker-entrypoint.sh /user/bin/
ENTRYPOINT ["/user/bin/docker-entrypoint.sh"]