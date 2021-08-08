# Automated ELK Stack Deployment

_The files in this repository were used to configure the network depicted below._

![] (diagram\diagram2)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the __PLAYBOOK___ file may be used to install only certain pieces of it, such as Filebeat.

- _install-elk.yml_

- _This document contains the following details:_
- _ Description of the Topoloy_
- _ Access Policies_
- _ ELK Configuration_
- _ Beats in Use_
- _ Machines Being Monitored_
-_ How to Use the Ansible Build_


## Description of the Topology

- _The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application._

- _Load balancing ensures that the application will be highly _____available, in addition to restricting _____ access to the network._
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_

- _web traffic web security availability ,_ 
- _jump box automation , security , network segmentaion , access control_  

- _Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the __data___ and system ___logs__._

- _ What does Filebeat watch for?_Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
- _ What does Metricbeat record?_Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash

- _The configuration details of each machine may be found below._
- _Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.7   | Linux            |
| web1     |web server| 10.0.0.8   | linux            |
| web2     |webserver | 10.0.0.9   | linux            |
| web3     |webserver | 10.0.0.11  | linux            |
|greenteam | elk      |10.2.0.4    | linux            |
### Access Policies

- _The machines on the internal network are not exposed to the public Internet. _

- _Only the jumperbox_provisioners_ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:40.87.111.15_
- _TODO: Add whitelisted IP addresses_

- _Machines within the network can only be accessed by _jumpbox provisioners and workstation public ip____._
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_

- _A summary of the access policies in place can be found in the table below._

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | my ipv4              |
| web1     | no                  |10.0.0.8              |
| web2     | no                  |10.0.0.9              |
| web 3    |  no                 |10.0.0.11             |
|greenteam | yes                 |10.2.0.4              |


#### Elk Configuration

- _Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because..._
- _TODO: What is the main advantage of automating configuration with Ansible?_
- _ansible is used to automate configuration of the elk machine not configuration perfromed manually because ansible is fast and easy to deploy apps_
- _you will not need to write the code manually you can use playbook and ansible will figure out how to get your system how you want to install them_

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- _Specify a different group of machines as well as a different remote user_
- _name: Config elk VM with Docker_
- _ hosts: elk_
- _ remote_user: sysadmin_
- _become: true_
- _ tasks:_
- _Install the following services:_
- _docker.io_
- _python3-pip_
- _docker , which is the Docker Python pip module_
- _Increase System Memory :_
- _name: Use more memory_
- _sysctl:_
- _name: vm.max_map_count_
- _value: '262144'_
- _state: present_
- _reload: yes_
- _Launching and Exposing the container with these published ports:_
- _5601:5601_ 
- _9200:9200_
- _5044:5044_

- _The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance._

- _![](diagrams\docker ps.png)_

##### Target Machines & Beats
- _This ELK server is configured to monitor the following machines:_
- _ List the IP addresses of the machines you are monitoring_
- _web1 10.0.0.8_
- _web2 10.0.0.9_

- _We have installed the following Beats on these machines:_
- _: Specify which Beats you successfully installed_
- _filebeat_
- _metricbeat_
- _These Beats allow us to collect the following information from each machine:_
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
- _Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing_
- _Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash_

###### Using the Playbook

- _In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: _

- _SSH into the control node and follow the steps below:_
- _Copy the __filebeat-playbook.yml and metricbeat-playbook.yml___ file to _/etc/ansible/roles____._
- _Update the __/etc/ansible/hosts___ file to include..._
- _10.0.0.7 ansible_python_interpreter=/usr/bin/python3_
- _10.0.0.8 ansible_python_interpreter=/usr/bin/python3_
- _10.0.0.11 ansible_python_interpreter=/usr/bin/python3_

#######elk
- _10.2.0.4 ansible_python_inteerpreter=/usr/bin/python3_
- _Run the playbook, and navigate to __[](http://20.98.233.159:5601/app/kibana#/home)__ to check that the installation worked as expected._

- _: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?install-elk.yml,it is in the docker container in /etc/ansible_
- _Which file do you update to make Ansible run the playbook on a specific machine?/etc/ansible/hosts/_
- _How do I specify which machine to install the ELK server on versus which to install Filebeat on? /etc/ansible/hosts/ on filebeat.yml you need to add private of the elk server_
- _Which URL do you navigate to in order to check that the ELK server is running?'[](http://20.98.233.159:5601/app/kibana#/home)'_

- _As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
- _`ansible playbook /etc/ansible/install-elk.yml`_
- _`ssh azureusermilad@JumpBox(PrivateIP)`_
- _`sudo docker container list -a`_
- _`sudo docker start container nervous_wiles`_
- _`sudo docker attach container nervous_wiles`_
- _`cd/etc/ansible/`_
- _`ansible-playbook elk.yml`_
- _`cd /etc/ansible/roles/`_
- _`ansible-playbook filebeat-playbook.yml`_
- _`[](http://20.98.233.159:5601/app/kibana#/home)`_