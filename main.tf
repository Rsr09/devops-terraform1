module "infra" {
  source = "./Modules"

  #================================== > Common Resources < ==========================================
  env                  = "prod"
  rg_location          = "Central India"
  rg_name              = "enterprise-rg"
  virtual_network_name = "vnet"
  subnet_name          = "app-sunet"


  #==================================== > Virtual Machine < =========================================
  vm_config = {
    my-windows-vm = "Standard_D2as_v5" # Creates VM named 'my-windows-vm' with size Standard_D2as_v5
    my-linux-vm   = "Standard_D4as_v5"
  }

  source_image_map = {
    my-windows-vm = { # VM name should match with the VM name you provided above
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2022-datacenter-azure-edition"
      version   = "latest"
    }
    my-linux-vm = {           # VM name should match with the VM name you provided above
      publisher = "Canonical" # Publisher: Canonical (for Ubuntu)
      offer     = "UbuntuServer"
      sku       = "20_04-lts"
      version   = "latest"

    }
  }


  #=========================================> Storage-Account <========================================================
  storage_account_name             = "drtfygbhv"
  storage_account_tier             = "Standard"
  storage_account_replication_type = "LRS"
  container_name                   = "mycontainer"
  container_access_type            = "private"

  #================================ > Application Gateway <============================================
  app_gateway_pip      = "application-gateway"
  app_gateway_name     = "my-application-gateway"
  app_gateway_sku_name = "WAF_v2"
  app_gateway_sku_tier = "WAF_v2"

  # Calling WAF Policy module
  waf_name   = "vik-waf-policy"
  blocked_ip = ["192.168.1.1", "203.0.113.5"]
  waf_mode   = "Prevention"


  # Data_disk
  data_disk_replication_type = "Standard_LRS"
  data_disk_size             = 30
  datadisk_name              = "my-datadisk-1"


  #containerapps
  container_appsenv_name = "test1"
  container_apps_name    = "test2"
  containerappscpu       = 1
  containerappsmemory    = "2Gi"

  #acr
  acrname  = "testing"
  acr_tier = "Standard" #Basic, Standard or Premium

}
