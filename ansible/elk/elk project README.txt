# Automated ELK Stack Deployment

_The files in this repository were used to configure the network depicted below._

![](diagrams/diagram2.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the __PLAYBOOK___ file may be used to install only certain pieces of it, such as Filebeat.

- install-elk.yml

- This document contains the following details:
-  Description of the Topoloy
-  Access Policies
-  ELK Configuration
-  Beats in Use
-  Machines Being Monitored
-  How to Use the Ansible Build


## Description of the Topology

- The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

- Load balancing ensures that the application will be highly _____available, in addition to restricting _____ access to the network.
- TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?

- web traffic web security availability ,
- jump box automation , security , network segmentaion , access control

- Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the __data___ and system ___logs__.

-  What does Filebeat watch for?_Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
-  What does Metricbeat record?_Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash

- The configuration details of each machine may be found below.
- Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.7   | Linux            |
| web1     |web server| 10.0.0.8   | linux            |
| web2     |webserver | 10.0.0.9   | linux            |
| web3     |webserver | 10.0.0.11  | linux            |
|greenteam | elk      |10.2.0.4    | linux            |
### Access Policies

- The machines on the internal network are not exposed to the public Internet. 

- Only the jumperbox_provisioners_ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:40.87.111.15
- TODO: Add whitelisted IP addresses

- Machines within the network can only be accessed by _jumpbox provisioners and workstation public ip____.
- TODO: Which machine did you allow to access your ELK VM? What was its IP address?

- A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | my ipv4              |
| web1     | no                  |10.0.0.8              |
| web2     | no                  |10.0.0.9              |
| web 3    |  no                 |10.0.0.11             |
|greenteam | yes                 |10.2.0.4              |


#### Elk Configuration

- Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?
- ansible is used to automate configuration of the elk machine not configuration perfromed manually because ansible is fast and easy to deploy apps
- you will not need to write the code manually you can use playbook and ansible will figure out how to get your system how you want to install them

The playbook implements the following tasks:
- TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc.
- Specify a different group of machines as well as a different remote user
- name: Config elk VM with Docker
-  hosts: elk
-  remote_user: sysadmin
- become: true
-  tasks:
- Install the following services:
- docker.io
- python3-pip
- docker , which is the Docker Python pip module
- Increase System Memory :
- name: Use more memory
- sysctl:
- name: vm.max_map_count
- value: '262144'
- state: present
- reload: yes
- Launching and Exposing the container with these published ports:
- 5601:5601
- 9200:9200
- 5044:5044

- The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![](diagrams/docker ps.png)

##### Target Machines & Beats
- This ELK server is configured to monitor the following machines:
-  List the IP addresses of the machines you are monitoring
- web1 10.0.0.8
- web2 10.0.0.9

- We have installed the following Beats on these machines:
- : Specify which Beats you successfully installed
- filebeat
- metricbeat
- These Beats allow us to collect the following information from each machine:
- TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc.
- Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing
- Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash

###### Using the Playbook

- In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

- SSH into the control node and follow the steps below:
- Copy the __filebeat-playbook.yml and metricbeat-playbook.yml___ file to _/etc/ansible/roles____.
- Update the __/etc/ansible/hosts___ file to include...
- 10.0.0.7 ansible_python_interpreter=/usr/bin/python3
- 10.0.0.8 ansible_python_interpreter=/usr/bin/python3
- 10.0.0.11 ansible_python_interpreter=/usr/bin/python3

#######elk
- 10.2.0.4 ansible_python_inteerpreter=/usr/bin/python3
- Run the playbook, and navigate to __[](http://20.98.233.159:5601/app/kibana#/home)__ to check that the installation worked as expected.

- : Answer the following questions to fill in the blanks:
- Which file is the playbook? Where do you copy it?install-elk.yml,it is in the docker container in /etc/ansible
- Which file do you update to make Ansible run the playbook on a specific machine?/etc/ansible/hosts/
- How do I specify which machine to install the ELK server on versus which to install Filebeat on? /etc/ansible/hosts/ on filebeat.yml you need to add private of the elk server
- Which URL do you navigate to in order to check that the ELK server is running?'[](http://20.98.233.159:5601/app/kibana#/home)'

- As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.
- `ansible playbook /etc/ansible/install-elk.yml`
- `ssh azureusermilad@JumpBox(PrivateIP)`
- `sudo docker container list -a`
- `sudo docker start container nervous_wiles`
- `sudo docker attach container nervous_wiles`
- `cd/etc/ansible/`
- `ansible-playbook elk.yml`
- `cd /etc/ansible/roles/`
- `ansible-playbook filebeat-playbook.yml`
- `[](http://20.98.233.159:5601/app/kibana#/home)`