# rsync-incremental backup remoto# PT
#Thiago Lopes#
#Backup utilizando a ferramenta de linha de comando rsync, juntamente com um backup remoto.
Existem dois metodos para executar o backup rsync, uma forma segura no destino no fstab ou inseguro,
apresentarei as duas formas.


#Dependencias#

apt - get install cifs - utils --- para suporte ao cifs

Verificar suporte montagem cifs >  cat /proc/filesystems | grep cifs

#Criar Diretório#
mkdir /mnt/backup

#Editar FSTAB#
nano /etc/fstab

#Forma insegura#
//10.9.1.100.backup /mnt/backup cifs username=user,password=senha,user,dir_mode=0777,file_mode=0777 0 0

Desta forma fica visivel no fstab sua senha do computador da rede de destino do backup;

#Forma Segura#
Criar arquivo em / nano .pwdrsync.txt
chmod 600 .pwdrsync.txt 
username=usuario
password=suasenha

//10.9.1.100/backup /mnt/backup cifs credentials=/.pwdrsync.txt,user,dir_mode=0777,file_mode=0777 0 0

Para confirmar se deu tudo certo !

Montar as unidades.

mount -a  -- montar todas unidades..
Devera aparecer a unidade montada com o destino remoto

Então sim executar o script

./rsync-incremental
