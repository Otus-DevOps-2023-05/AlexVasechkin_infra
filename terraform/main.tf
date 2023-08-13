terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}
provider "yandex" {
  token     = "y0_AgAAAABvG2kiAATuwQAAAADoZkNq6mCXHUzqSU2e86Jo2xMjbmbYrz8"
  cloud_id  = "b1geen0om7ntpuqhngbu"
  folder_id = "b1gsdeelkspet09mnfdm"
  zone      = "ru-central1-a"
}
resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  platform_id = "standard-v3"

  resources {
    cores  = 2
    core_fraction = 20
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = "fd8g2uk03fpafrbim0sk"
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/yc.pub")}"
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = "e9bmco4kdh3g7iefnv0h"
    nat       = true
  }

  connection {
    type = "ssh"
    host = yandex_compute_instance.app.network_interface.0.nat_ip_address
    user = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file("~/.ssh/yc")
  }

  provisioner "file" {
    source = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}
