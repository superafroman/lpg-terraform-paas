variable "learning_locker_worker_name" {
  default = "name"
}

variable "rg_name" {
  default = "holder"
}

variable "rg_prefix" {
  default = "rgpref"
}

variable "rg_location" {
  default = "location"
}

variable "webapp_sku_tier" {
  default = "Basic"
}

variable "webapp_sku_name" {
  default = "B1"
}

variable "docker_tag" {
  default = "latest"
}

variable "docker_image" {
  default = "lpg-learning-locker"
}

variable "mongo_url" {
  default = "mongo_url"
}

variable "mongodb_path" {
  default = "mongo_host"
}

variable "redis_host" {
  default = "hostname"
}

variable "redis_port" {
  default = "6380"
}

variable "redis_db" {
  default = "0"
}

variable "redis_prefix" {
  default = "learninglocker"
}

variable "redis_password" {
  default = "password"
}

variable "hammer_http_server_port" {
  default = "8080"
}

variable "hammer_logstash_host" {
  default = "54e2fb5d-be7a-47c2-b3cf-6f72f42b5dfb-ls.logit.io"
}

variable "hammer_logstash_port" {
  default = "16690"
}

variable "env_profile" {
  default = "test"
}

variable "redis_use_tls" {
  default = "1"
}

variable "hammer_working_directory" {
  default = "/opt/learning-locker"
}

variable "queue_provider" {
  default = "REDIS"
}

variable "queue_namespace" {
  default = "learninglocker"
}

variable "websites_port" {
  default = "8080"
}

variable "testing" {
  default = "1"
}

variable "custom_emails" {
  default = ""
}

variable "scaling_enabled" {
  default = ""
}

variable "docker_registry_server_url" {
  default = ""
}

variable "docker_registry_server_username" {
  default = ""
}

variable "docker_registry_server_password" {
  default = ""
}
