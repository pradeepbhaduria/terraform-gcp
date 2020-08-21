output "load_balancer_ip_address" {
  description = "IP address of the Load Balancer"
  value       = "${google_compute_global_forwarding_rule.default.ip_address}"
}
