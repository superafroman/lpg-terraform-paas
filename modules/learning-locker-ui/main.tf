###### learning-locker-ui ######

resource "azurerm_template_deployment" "learning-locker-ui-app-service" {
  name                = "${var.learning_locker_ui_name}"
  resource_group_name = "${var.rg_name}"

  template_body = <<DEPLOY
  {
      "$schema":"http://schema.management.azure.com/schemas/2014-04-01-preview/deploymentTemplate.json#",
      "contentVersion":"1.0.0.0",
      "parameters":{
          "siteName":{
              "type":"string",
              "defaultvalue":"${var.learning_locker_ui_name}",
              "metadata":{
                  "description":"Name of azure web app"
              }
          }
      },
      "variables":{
          "hostingPlanName":"[concat(parameters('siteName'), 'serviceplan')]"
      },
      "resources":[
          {
              "type":"Microsoft.Web/sites",
              "name":"[parameters('siteName')]",
              "properties":{
                  "siteConfig":{
                      "appSettings":[
                          {
                              "name":"WEBSITES_ENABLE_APP_SERVICE_STORAGE",
                              "value":"false"
                          },
                          {
                              "name":"MONGODB_PATH",
                              "value":"${var.mongodb_path}"
                          },
                          {
                              "name":"API_HOST",
                              "value":"${var.api_host}"
                          },
                          {
                              "name":"API_PORT",
                              "value":"${var.api_port}"
                          },
                          {
                              "name":"WEBSITES_PORT",
                              "value":"${var.websites_port}"
                          },
                          {
                              "name":"HAMMER_LOGSTASH_HOST",
                              "value":"${var.hammer_logstash_host}"
                          },
                          {
                              "name":"HAMMER_LOGSTASH_PORT",
                              "value":"${var.hammer_logstash_port}"
                          },
                          {
                              "name":"ENV_PROFILE",
                              "value":"${var.env_profile}"
                          },
                          {
                              "name":"TESTING",
                              "value":"${var.testing}"
                          },
                          {
                              "name":"UI_HOST",
                              "value":"${var.ui_host}"
                          },
                          {
                              "name":"UI_PORT",
                              "value":"${var.ui_port}"
                          },
                          {
                              "name":"DOCKER_ENABLE_CI",
                              "value":"true"
                          },
                          {
                              "name": "DOCKER_REGISTRY_SERVER_URL",
                              "value": "https://${var.docker_registry_server_url}"
                          },
                          {
                              "name": "DOCKER_REGISTRY_SERVER_USERNAME",
                              "value": "${var.docker_registry_server_username}"
                          },
                          {
                              "name": "DOCKER_REGISTRY_SERVER_PASSWORD",
                              "value": "${var.docker_registry_server_password}"
                          }
                      ]
                  },
                  "name":"[parameters('siteName')]",
                  "serverFarmId":"[variables('hostingPlanName')]",
                  "hostingEnvironment":""
              },
              "apiVersion":"2016-03-01",
              "location":"[resourceGroup().location]",
              "tags":{
                  "environment":"${var.env_profile}"
              },
              "dependsOn":[
                  "[variables('hostingPlanName')]"
              ]
          },
          {
              "apiVersion":"2016-09-01",
              "name":"[variables('hostingPlanName')]",
              "type":"Microsoft.Web/serverfarms",
              "location":"[resourceGroup().location]",
              "properties":{
                  "name":"[variables('hostingPlanName')]",
                  "workerSizeId":"1",
                  "reserved":true,
                  "numberOfWorkers":"1",
                  "hostingEnvironment":""
              },
              "sku":{
                  "Tier":"${var.webapp_sku_tier}",
                  "Name":"${var.webapp_sku_name}"
              },
              "kind":"linux"
          },
          {
              "type":"Microsoft.Web/sites/config",
              "name":"[concat(parameters('siteName'), '/web')]",
              "apiVersion":"2016-08-01",
              "location":"UK South",
              "scale":null,
              "properties":{
                  "httpLoggingEnabled":true,
                  "logsDirectorySizeLimit":35,
                  "detailedErrorLoggingEnabled":true,
                  "alwaysOn":true,
                  "appCommandLine":"/bin/hammer /opt/learning-locker/run-ui.sh",
                  "linuxFxVersion":"DOCKER|${var.docker_registry_server_url}/${var.docker_image}:${var.docker_tag}",
                  "minTlsVersion":"1.0",
                  "ftpsState":"Disabled"
              },
              "dependsOn":[
                  "[resourceId('Microsoft.Web/sites', parameters('siteName'))]"
              ]
          }
      ]
  }
  DEPLOY

  deployment_mode = "Incremental"
}
