terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
    }
  }
}

variable "grafana_auth" {
 type=string
}
variable "grafana_url" {
 type=string
}
provider "grafana" {
  url  = var.grafana_url
  auth = var.grafana_auth
}
