#!/bin/bash
#Backup Criado por: Thiago Henrique Lopes
#GitHub - https://github.com/Th14go/rsync-incremental

#Monta Caminho Backup
mount /mnt/backup

# PEGA DATA ATUAL, DIA,MES,ANO, HORA,MINUTO,SEGUNDOS, PARA ARQUIVOS DE LOG
DATA=`date +%x-%k%M%S`
esp=`df -h /mnt/backup`

# LOCAL PARA ARMAZENAR ARQUIVOS DE LOG
LOG=/var/log/rsync/log-$DATA.txt

#  LOCAL ORIGEM PARA BACKUP
ORIGEM=/home/th14golop35/backup/

# LOCAL DESTINO PARA BACKUP
DESTINO=/mnt/backup/

  echo " " >> $LOG
  echo " " >> $LOG
  echo "| ----------------------------------------------" >> $LOG
  echo " Sincronizacao iniciada em $DATA" >> $LOG

# EXECUTA SCRIPT

rsync --backup --backup-dir=$DATA -ravz  --no-perms --no-owner --no-group $ORIGEM $DESTINO >>$LOG

#rsync  -av --no-perms --no-owner --no-group  $ORIGEM $DESTINO >>$LOG


  echo " Sincronizacao Finalizada em $DATA " >> $LOG
  echo "| -----------------------------------------------" >> $LOG
  echo " " >> $LOG
  echo " " >> $LOG

#Verifica Espaço Disponivel em Destino
echo "-----------------------------------------------------">> $LOG
echo " Espaço em Disco $esp"  >> $LOG
echo "-----------------------------------------------------">> $LOG

# ENVIA LOG LOCAL PARA DESTINO REMOTO  DE LOG
  cp -r /var/log/rsync/ mnt/backup


#Desmonta Caminho Backup
umount /mnt/backup
