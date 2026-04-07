# Week 3 - Ansible & Application Deployment

## What is this week about?

This week Ansible is used to configure the AWS instances from Week 2 and deploy websites on them.

What was done:
- 4 instances created with Terraform (1 test, 3 production for KlantA)
- Ansible inventory created with groups: testwebserver, productiewebservers, loadbalancer
- Connectivity tested with an ad-hoc ping command
- Playbooks created to deploy WordPress, Joomla, and Apache (httpd) in Docker
- NGINX load balancer deployed on one production server
- Management account `servmanager` created on all servers with sudo rights

---

## Folder structure

klantA/
├── ansible/
│ ├── inventory.ini
│ ├── playbooks/
│ │ ├── deploy_httpd.yml
│ │ ├── deploy_wordpress.yml
│ │ ├── deploy_joomla.yml
│ │ ├── deploy_loadbalancer.yml
│ │ └── create_servmanager.yml
│ └── tasks/
│ ├── install_docker.yml
│ ├── httpd.yml
│ ├── wordpress.yml
│ └── joomla.yml
└── terraform/
├── test/
└── prod/


---

## How to use

**1. Deploy instances**
```bash
cd klantA/terraform/test && terraform init && terraform apply
cd klantA/terraform/prod && terraform init && terraform apply
```

**2. Fill in the IP addresses from the Terraform output in `inventory.ini`**

> The IPs can change after a restart because no Elastic IPs are used.

**3. Test connectivity**
```bash
ansible all -i inventory.ini -m ping
```

**4. Deploy a website**
```bash
# Apache on test server
ansible-playbook -i inventory.ini playbooks/deploy_httpd.yml

# WordPress on production servers
ansible-playbook -i inventory.ini playbooks/deploy_wordpress.yml
```

**5. Deploy load balancer**
```bash
ansible-playbook -i inventory.ini playbooks/deploy_loadbalancer.yml
```

**6. Create management account**
```bash
ansible-playbook -i inventory.ini playbooks/create_servmanager.yml
# You will be asked to enter a password for servmanager
```

---

## Requirements

- Terraform installed
- Ansible installed
- AWS credentials configured
- SSH key (`.pem` file) for the instances

---

## What I learned

This week I learned how to use Ansible playbooks with `include_tasks` to keep code modular,
how to set up a NGINX load balancer in Docker, and how to manage Linux user accounts with Ansible.
