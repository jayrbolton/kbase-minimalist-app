FROM python:3.7-stretch

WORKDIR /kb/module
COPY . /kb/module
RUN chmod -R a+rw /kb/module
RUN chmod +x /kb/module/entrypoint.sh
ENV KB_SDK_COMPILE_REPORT_FILE=/kb/module/work/compile_report.json
ENTRYPOINT ["./entrypoint.sh"]
CMD []
