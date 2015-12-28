#!/bin/bash
set -e

owl_module="fe"
fluentd_output="
<match elasticsearch.output>
  type elasticsearch
  hosts $ELASTICSEARCH_IP_PORT
  user $ELASTICSEARCH_USER
  password $ELASTICSEARCH_PASSWORD
  time_key @timestamp
  index_name owl
  type_name $owl_module 
</match>"

fluentd_config="$TDAGENT_DIR/$TDAGENT_CONFIGFILE"

td-agent -c $fluentd_config -i "$fluentd_output"

