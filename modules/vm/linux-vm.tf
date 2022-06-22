# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "linuxvm2" {
  name = var.vm_name
  computer_name = var.compute_name  # Hostname of the VM
  resource_group_name = data.azurerm_resource_group.dg_rg.name
  location = data.azurerm_resource_group.dg_rg.location
  size = var.vm_size
  
  admin_username = "azureuser"
  
  network_interface_ids = [ azurerm_network_interface.dg-vmnics.id ]
  
  admin_ssh_key {
    username = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  
  os_disk {
    name = "osdisk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer = "rhel-raw"
    sku = "8_6"
    version = "8.6.2022052401"
  }
  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}
