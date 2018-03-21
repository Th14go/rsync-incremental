![rsync](https://user-images.githubusercontent.com/12428027/37691640-0de9d256-2c92-11e8-9adf-19e4203dc0d3.png)

# rsync-incremental backup remoto
<i>Thiago Lopes</br>
Backup utilizando a ferramenta de linha de comando rsync, com destino de backup remoto.</i><br>
<p align="justify">O rsync utiliza o protocolo remote-update, o que aumenta assustadoramente sua velocidade e diminui a quantidade de dados transferidos, pois são trocados entre os servidores somente as diferenças entre dois grupos de arquivos.
Existem dois metodos para executar o backup rsync, uma forma segura no destino no fstab ou inseguro,
apresentarei as duas formas.</p>


<b>#Dependencias#</b>

apt - get install cifs - utils --- para suporte ao cifs

<b>Verificar suporte montagem cifs >  cat /proc/filesystems | grep cifs</b><br>
$ nodev	cifs  #Resultado se conter suporte<br>

<b>#Criar Diretório#</b><br>
mkdir /mnt/backup

<b>#Editar FSTAB#</b><br>
nano /etc/fstab

<b>#Forma insegura#</b><br>
//10.9.1.100.backup /mnt/backup cifs username=user,password=senha,user,dir_mode=0777,file_mode=0777 0 0

Desta forma fica visivel no fstab sua senha do computador da rede de destino do backup;

<b>#Forma Segura#</b><br>
Criar arquivo em / nano .pwdrsync.txt
chmod 600 .pwdrsync.txt 
username=usuario
password=suasenha

//10.9.1.100/backup /mnt/backup cifs credentials=/.pwdrsync.txt,user,dir_mode=0777,file_mode=0777 0 0

Para confirmar se deu tudo certo !

Montar as unidades.

<b>mount -a </b> -- montar todas unidades..
Devera aparecer a unidade montada com o destino remoto

Execução do script, lembrando em alterar as variaveis !

#<b>./rsync-incremental</b>
# Git Clone - https://github.com/Th14go/rsync-incremental
