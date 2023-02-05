output "demoapp_ip" {
  value       = module.demoapp.instance_ips
  description = "The public IP address of pritunl instance"
}

output "moni_ip" {
  value       = module.moni.instance_ips
  description = "The public IP address of pritunl instance"
}