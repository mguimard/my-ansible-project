---------------------------------
Bienvenue sur {{ ansible_ssh_host }}
OS: {{ ansible_os_family }} {{ ansible_distribution }}

Interfaces:
{% for intf in ansible_interfaces %}
  - {{ intf }}: {{ ansible_facts[intf].ipv4.adddress }}
{% endfor %}

Disks:
{% for device,device_details in ansible_devices.items() %}
{% for partition,partition_details in device_details.partitions.items() %}
  {{ partition }}: {{ partition_details.size %}
{% endfor %}
{% endfor %}
---------------------------------
