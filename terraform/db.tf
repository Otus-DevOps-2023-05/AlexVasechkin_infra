resource "yandex_compute_instance" "db" {
  name = "reddit-db"

  labels = {
    tags = "reddit-db"
  }

  platform_id = "standard-v3"

  resources {
    cores         = 2
    core_fraction = 20
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.app-subnet.id
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  depends_on = [yandex_vpc_network.app-network]
}
