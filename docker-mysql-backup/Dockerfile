# Use an official Ansible base image
FROM ansible/ansible:latest

# Copy the Ansible playbook into the container
COPY my_ansible_playbook.yml /ansible/playbooks/my_ansible_playbook.yml

# Set the working directory
WORKDIR /ansible/playbooks

# Run the playbook when the container starts
CMD ["ansible-playbook", "my_ansible_playbook.yml"]