################################################
#                                              #
#        Ubuntu 20.04 Packer Template          #
#               For vCenter                    #
################################################

source "vsphere-iso" "ubuntu" {
    CPUs                       = var.vm_cpu_num
    RAM                        = var.vm_mem_size
    datastore                  = var.vm_datastore
    RAM_reserve_all            = false
    convert_to_template        = false
    disk_controller_type       = ["lsilogic"]
    guest_os_type              = var.vm_guest_os_type
    http_directory             = var.http_dir
    insecure_connection        = true
    firmware                   = "bios"
    
    network_adapters {
        network               = var.vm_network
        network_card          = "vmxnet3"
    }

    storage {
        disk_size             = var.vm_disk_size
        disk_thin_provisioned = true
    }
    
    ## Template SSH info
    ssh_password              = var.ssh_password
    ssh_username              = var.ssh_username
    ssh_timeout               = "20m"

    ## vcenter config info
    username                  = var.vsphere_user
    password                  = var.vsphere_password
    vcenter_server            = var.vsphere_server
    datacenter                = var.vsphere_datacenter
    vm_name                   = var.vm_name
    cluster                   = var.vsphere_cluster
    resource_pool             = var.vsphere_resource_pool

    iso_url = var.iso_url
    iso_checksum = var.iso_checksum

    boot_wait                 = "5s"
    boot_command              = ["<wait><esc><esc><f6><wait><esc><wait>",
                                "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                                "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                                "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                                "<bs><bs><bs>",
                                "/casper/vmlinuz initrd=/casper/initrd ",
                                "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
                                "<enter>"]
}

build {
    sources = ["source.vsphere-iso.ubuntu"]
}