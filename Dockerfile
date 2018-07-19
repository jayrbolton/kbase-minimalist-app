FROM python:3.7-stretch

WORKDIR /kb/module
COPY . /kb/module
RUN chmod -R a+rw /kb/module
RUN chmod +x /kb/module/entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
CMD []
