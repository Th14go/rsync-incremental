![rsync](https://user-images.githubusercontent.com/12428027/37691640-0de9d256-2c92-11e8-9adf-19e4203dc0d3.png)

# rsync-incremental backup remoto#
#Thiago Lopes#
#Backup utilizando a ferramenta de linha de comando rsync, com destino de backup remoto.
O rsync utiliza o protocolo remote-update, o que aumenta assustadoramente sua velocidade e diminui a quantidade de dados transferidos, pois são trocados entre os servidores somente as diferenças entre dois grupos de arquivos;

Existem dois metodos para executar o backup rsync, uma forma segura no destino no fstab ou inseguro,
apresentarei as duas formas.


#Dependencias#

apt - get install cifs - utils --- para suporte ao cifs

Verificar suporte montagem cifs >  cat /proc/filesystems | grep cifs
$ nodev	cifs  #Resultado se conter suporte

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
