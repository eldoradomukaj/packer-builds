variable "vsphere_server" {
    description = "vCenter Server IP or FQDN"
    type = string
}

variable "vsphere_user" {
    description = "vCenter login username"
}

variable "vsphere_password" {
    description = "vCenter password"
    sensitive = true
}

variable "vsphere_datacenter" {
    description = "vCenter Datacenter"
}

variable "vsphere_cluster" {
    description = "vCenter Cluster"
}

variable "vsphere_resource_pool" {
    description = "vCenter Resource Pool"
}

variable "vm_network" {
    description = "VM network"
}

variable "vm_datastore" {
    description = "VM datastore name"
}

variable "vm_name" {
    description = "VM name"
}

variable "vm_guest_os_type" {
    description = "VM guest OS type"
}

variable "vm_cpu_num" {
    description = "VM CPUs"
}

variable "vm_mem_size" {
    description = "VM memory size"
}

variable "vm_disk_size" {
    description = "VM disk size"
}

variable "iso_url" {
    description = "ISO path url"
    type = string
}

variable "iso_checksum" {
    description = "ISO checksum string"
    type = string
}

variable "http_dir" {
    description = "http directory"
    default = "http"
}

variable "ssh_username" {
    description = "VM SSH user"
    type = string
}

variable "ssh_password" {
    description = "VM SSH user password"
    type = string
    sensitive = true
}