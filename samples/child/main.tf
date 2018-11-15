variable "memory" {}
resource "null_resource" "x"{
  provisioner "local-exec" "le"{
    command="echo 'Doin the Child thang'"
  }
}

output "gotit" {
  value="${var.memory}"
}
