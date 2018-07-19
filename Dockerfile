FROM python:3.7-stretch

WORKDIR /kb/module
COPY . /kb/module
RUN mkdir -p /kb/module/work
RUN chmod -R a+rw /kb/module
ENTRYPOINT ["./entrypoint.sh"]
CMD []
