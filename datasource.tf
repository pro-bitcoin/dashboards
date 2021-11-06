resource "grafana_data_source" "prometheus" {
  type = "prometheus"
  name = "Prometheus"
  url  = "http://prometheus:9090"
  access_mode = "proxy"
  is_default = true

  json_data {
    http_method     = "POST"
  }
}
