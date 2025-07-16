# ServicosDeRedes

REQUISITOS:

  terraform
  ansible
  aws-cli
  
AWS CLI:   
   copiar e colar em ~/.aws/credentials

em /devops-flask/terraform 

  1$ terraform init
  
  2$ terraform plan
  
  3$ terraform apply
  

quando ele terminar ele envia o ip publico da vm criada

  ex: Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

public_ip = "54.163.145.248"

copie esse ip


   cd ../ansible
   nano hosts.ini
   

[webservers]
<public_ip> ansible_user=ubuntu ansible_ssh_private_key_file=<caminho_da_chave.pem>


e cole o ip onde tem <public_ip> e altere o caminho da chave <caminho_da_chave.pem>

ex:
[webservers]
54.163.145.248 ansible_user=ubuntu ansible_ssh_private_key_file=~/Downloads/labsuser.pem

pronto. salve, feche o arquivo e use o comando
   ansible-playbook -i hosts.ini playbook.yml

demora um pouco, quando terminar voce cola aquele mesmo ip publico no navegador
  http://<public_ip>
