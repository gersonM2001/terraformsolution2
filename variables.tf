variable suscription_id {
  type        = string
  description = "Id de la suscripcion de Azure"
}


variable "tags"{
    type = map(string)  
    description = "Tags para los recursos"
    default = {
        environment = "dev"
        date = "2025-28-03"
        owner = "Gerson y Cristopher"
        createdBy = "Terraform"
    }
}

variable "location" {
    type = string
    description = "Ubicacion de los recursos"
    default = "northeurope"
}

variable "projectsolution2" {
    type = string
    description = "Solución a problematica 2"
    default = "solution2"
}

variable "envoirment"{
    type = string
    description = "Entorno de los recursos"
    default = "dev"
}

variable "admin_sql_password"{
    type = string
    description = "Contraseña del administrador de la base de datos"
}