#!/bin/bash

GRAFANA_HOST=${1:?}
curl -s --fail -u "$GRAFANA_AUTH" "https://${GRAFANA_HOST}/api/search?folderIds=1"  > /tmp/$$ || exit 2
let len=$(jq length /tmp/$$)-1
for i in $(seq 0 $len); do
    title=$(jq -r ".[$i].title" /tmp/$$)
    uid=$(jq -r ".[$i].uid" /tmp/$$)
    curl -s --fail -u "$GRAFANA_AUTH" "https://${GRAFANA_HOST}/api/dashboards/uid/${uid}"  > /tmp/${title}.json || exit 4
    jq .dashboard /tmp/${title}.json > ${title}.json || exit 5
done
rm -f /tmp/$$
