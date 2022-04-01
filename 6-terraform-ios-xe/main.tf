terraform {
    required_providers {
        iosxe = {
        source  = "CiscoDevNet/iosxe"
        }
    }
}

provider "iosxe" {
    host = "https://<my-router-ip>"
    device_username = "cisco123"
    device_password = "cisco123"
    request_timeout = 30
    insecure = true
}

resource "iosxe_rest" "loopback" {
    method = "POST"
    path = "/data/ietf-interfaces:interfaces"
    payload = jsonencode(
        {
        "ietf-interfaces:interface": {
            "name": "Loopback<number>",
            "description": "Configured by Terraform",
            "type": "iana-if-type:softwareLoopback",
            "enabled": true,
            "ietf-ip:ipv4": {
                "address": [
                    {
                        "ip": "<private-IP>",
                        "netmask": "255.255.255.0"
                    }
                ]
            }
        }
        }
    )
}