#!/bin/bash

# Docker container entry point script
# When you run docker run my-app xyz, then this script will get run

# Persistent server mode (aka "dynamic service"):
# This is run when there are no arguments
if [ $# -eq 0 ] ; then
  echo "Running in persistent server mode"
  echo "nothing to do."
  # sh ./start_server.sh

# Test mode
elif [ "${1}" = "test" ] ; then
  echo "Running tests..."
  echo "nothing to do."
  # make test

# Job Mode:
# KBase uses the word "async" for this command, which makes no sense. This is for a one-off job.
elif [ "${1}" = "async" ] ; then
  echo "Running a one-off job..."
  python /kb/module/main.py /kb/module/work/input.json /kb/module/work/output.json
  # sh ./run_async.sh

# Initialize?
elif [ "${1}" = "init" ] ; then
  echo "Initialize module"
  echo "nothing to do."

# Simply provide a bash cli into the docker container.
elif [ "${1}" = "bash" ] ; then
  echo "Launching a bash shell in the docker container."
  bash

# This is for registering the module on the KBase catalog
elif [ "${1}" = "report" ] ; then
  echo "Generating report..."
  cp /kb/module/compile_report.json /kb/module/work/compile_report.json
  # make compile

# Unknown command.
else
  echo "Unknown command. Valid commands are: test, async, init, bash, or report"
fi
