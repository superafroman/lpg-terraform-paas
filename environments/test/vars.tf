### Gen vars ###
variable "rg_name" {
  type 		= "string"
  default 	= "testlab"
}
variable "rg_prefix" {
  type    = "string"
  default = "lpg"
}
variable "rg_location" {
  type    = "string"
  default = "UK South"
}
variable "environment_tag" {
  type = "string"
  default = "test"
}

### postgres ###
variable "postgres_name" {
  default = "postgres"
}
variable "postgres_sku_name" {
  default = "PGSQLB50"
}
variable "postgres_sku_capacity" {
  default = 50
}
variable "postgres_sku_tier" {
  default = "Basic"
}

### cosmos ###
variable "cosmos_name" {
  default = "cosmos"
}
variable "cosmos_offer_type" {
  default = "Standard"
}
variable "cosmos_consistency_policy_level" {
  default = "Strong"
}
variable "cosmos_failover_policy_location" {
  default = "West Europe"
}

### wso2 ###
variable "wso2_name" {
  default = "wso2"
}
variable "lpg_ui_url" {
  default = "lpq_ui_url"
}
variable "app_service_sku" {
  default = "Standard"
}
variable "app_service_sku_code" {
  default = "S1"
}
variable "app_service_worker_size" {
  default = "1"
}
variable "wso2_docker_image" {
  default = "cshr/lpg-wso2-is"
}
variable "wso2_docker_tag" {
  default = "1b21c10238616ef442b86c36364f28791d97d550"
}

### mailhog ###
variable "mailhog_name" {
  default = "mailhog"
}

### lpg-learner-record ###
variable "lpg_learner_record_name" {
  default = "lpg-learner-record"
}
variable "lpg_learner_record_docker_tag" {
  default = "latest"
}
variable "lpg_learner_record_auth_user" {
  default = "user"
}
variable "lpg_learner_record_auth_password" {
  default = "password"
}
variable "xapi_url" {
  default = "xapi_url"
}

### azmssql ###
variable "sql_serv_name" {
  default = "sqlserver"
}
variable "sql_db_name" {
  default = "sqldb"
}
variable "sql_admin" {
  default = "sqladmin"
}
variable "sql_pass" {
  default = "replaceme!@18"
}
variable "sql_rule_name" {
  default = "firewall-rule-"
}

### learning-locker-general ###
variable "ll_docker_tag" {
  default = "5c6cea37123f575c211ddfb87cc7ce0bfc9f51a2114e277f95c6726688ce6bd6"
}
### learning-locker-xapi ###
variable "lpg_learning_locker_xapi_name" {
  default = "xapi"
}

### learning-locker-worker ###
variable "lpg_learning_locker_worker_name" {
  default = "api-worker"
}

### learning-locker-setup ###
variable "lpg_learning_locker_setup_name" {
  default = "setup"
}