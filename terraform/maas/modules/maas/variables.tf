
# Allgemeine Variablen

# Scripts

data "template_file" "lernmaas" {
  template = templatefile("${path.module}/../../../scripts/lernmaas.tpl", { module = var.module, public_key = var.public_key } )
}

# Public Variablen

variable "module" {
    type    = string
    default = ""
}

variable "public_key" {
    type    = string
    default = ""
}

variable "ports" {
    type    = list(number)
    default = [ 22, 80 ]
}

variable "enabled" {
    type    = bool
    default = false
}


