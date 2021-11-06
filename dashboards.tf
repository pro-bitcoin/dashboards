resource "grafana_dashboard" "blocks" {
  folder      = grafana_folder.collection.id
  config_json = file("blocks.json")
}

resource "grafana_dashboard" "configuration" {
  folder      = grafana_folder.collection.id
  config_json = file("configuration.json")
}

resource "grafana_dashboard" "net" {
  folder      = grafana_folder.collection.id
  config_json = file("net.json")
}
resource "grafana_dashboard" "peers" {
  folder      = grafana_folder.collection.id
  config_json = file("peers.json")
}

resource "grafana_dashboard" "mempool" {
  folder      = grafana_folder.collection.id
  config_json = file("mempool.json")
}


