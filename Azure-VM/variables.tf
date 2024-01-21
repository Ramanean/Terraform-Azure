variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "prefix" {
  type        = string
  default     = "win-vm-iis"
  description = "Prefix of the resource name"
}

//Not used
variable "admin_username" {
  type        = string
  default     = "adminuser"
  description = "Admin username of the VM"
}

//Not Used
variable "admin_password" {
  type        = string
  default     = "P@ssw0rd1234!"
  description = "Admin password of the VM"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B2s"
  description = "Size of the VM"
}

variable "subnet_name" {
  type        = string
  default     = "default"
  description = "Name of the subnet"
}

variable "vnet_name" {
  type        = string
  default     = "default"
  description = "Name of the virtual network"
}

variable "vnet_address_space" {
  type        = list(string)
  default     = [""]
}

variable "subnet_prefixes" {
  type        = list(string)
  default     = [""]
}

variable "public_ip_address_allocation" {
  type        = string
  default     = "Dynamic"
  description = "Type of public IP address allocation"
}

variable "sku" {
    type        = string
    default     = "Basic"
    description = "SKU of the Image"
}

variable "os_storage"{
    type        = string
    default     = "Standard_LRS"
    description = "Storage type of the OS disk"
}

variable "vm_os_name"{
    type        = string
    default     = "WindowsServer"
    description = "Name of the OS"
}