#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/init.sh" ]]; then
  nami_initialize neo4j
  mkdir tmp/bitcopy
  cp -r /bitnami/neo4j/data /tmp/bitcopy
  rm -r /opt/bitnami/neo4j/data
  cp -r /tmp/bitcopy/data /opt/bitnami/neo4j
  chmod -R 777 /opt/bitnami/neo4j/data
  rm -r /tmp/bitcopy
  info "Starting neo4j... "
fi

exec tini -- "$@"
