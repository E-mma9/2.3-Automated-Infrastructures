# 2.3-Automated-Infrastructures
# Automated Infrastructures Final Project

This repository contains my final project for the **Automated Infrastructures** course.  
The project is based on the Pixel Perfect case and focuses on automating customer environments with **Terraform**, **Ansible**, **Docker**, and **Bicep**. [file:77]

## Project context

Pixel Perfect is a growing web design company that wants to professionalize its infrastructure delivery process.  
Instead of maintaining customer environments with manual scripts and traditional virtual machines, the goal is to manage infrastructure and configuration using Infrastructure as Code and to host the environments in AWS. [file:77]

The assignment is divided into weekly deliverables and covers:
- AWS infrastructure provisioning with Terraform. [file:77]
- Linux server configuration with Ansible. [file:77]
- Containerized application deployment with Docker. [file:77]
- Reusable Ansible roles, templates, and variables. [file:77]
- Windows automation with Ansible and WinRM. [file:77]
- Active Directory automation with Ansible. [file:77]
- Azure proof of concept with Bicep. [file:77]

## Project goal

The goal of this project is to build a reusable and maintainable automation platform for different customer scenarios.  
The solution must support both **test** and **production** environments, multiple website types, and modular Infrastructure as Code that can be reused across customers. [file:77]

## Supported scenarios

Each customer can have a **test** or **production** environment.  
A test environment consists of 1 Amazon Linux instance with Docker, while a production environment consists of 3 Amazon Linux instances, including a load balancer and web servers for higher availability. [file:77]

The hosted website type can be:
- WordPress. [file:77]
- Joomla. [file:77]
- Custom website with a default welcome page. [file:77]

## Technologies used

This project uses the following tools:
- **Terraform** for provisioning AWS infrastructure such as VPCs, subnets, security groups, and EC2 instances. [file:77]
- **Ansible** for configuring Linux and Windows systems. [file:77]
- **Docker** for containerized application deployment. [file:77]
- **Bicep** for a limited Azure proof of concept. [file:77]
