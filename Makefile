GRAFANA_HOST ?= beta.pro-bitcoin.io
PERAMALINK = $(shell cat permalink)

export:
	export GRAFANA_AUTH=$$(jq -r .grafana_auth auth.json); ./export-dashboards.sh $(GRAFANA_HOST)

init:
	terraform init

plan:
	terraform plan -state $(GRAFANA_HOST).tfstate -var-file auth.json -var="grafana_url=https://$(GRAFANA_HOST)"

apply:
	terraform apply -state $(GRAFANA_HOST).tfstate  -var-file auth.json -var="grafana_url=https://$(GRAFANA_HOST)"

validate:
	terraform validate

home-dashboard:
	scp home.json $(GRAFANA_HOST):/usr/share/grafana/public/dashboards/home.json

update-permalink:
	sed -i s/$(PERMALINK_OLD)/$(PERAMALINK)/g *.json
