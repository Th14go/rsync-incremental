#!/bin/bash
#Backup Criado por: Thiago Lopes
#GitHub  - https://github.com/Th14go/rsync-incremental
# PEGA DATA ATUAL, DIA,MES,ANO, HORA,MINUTO,SEGUNDOS, PARA ARQUIVOS DE LOG
  INICIO=`date +%d/%m/%Y-%H:%M:%S`
# LOCAL PARA ARMAZENAR ARQUIVOS DE LOG
  LOG=/var/log/rsync/`date +%Y-%m-%d-%H:%M:%S`log-rsync.txt

#  LOCAL ORIGEM PARA BACKUP
  ORIGEM=/mnt/Dados/ARQUIVOS/ 

# LOCAL DESTINO PARA BACKUP
  DESTINO=/mnt/backup/INCREMENTAL/

  echo " " >> $LOG
  echo " " >> $LOG
  echo "| ------ ------ ------ ------ ------ ------ -----------" >> $LOG
  echo " Sincronizacao iniciada em $INICIO" >> $LOG
  
# EXECUTA SCRIPT 
  rsync --backup --backup-dir=`date +%d-%m-%Y-%R` -Cravzp  $ORIGEM $DESTINO >>$LOG
  FINAL=`date +%d/%m/%Y-%H:%M:%S`
 
  
  echo " Sincronizacao Finalizada em $FINAL" >> $LOG
  echo "| ------ ------ ------ ------ ------ ------ -----------" >> $LOG
  echo " " >> $LOG
  echo " " >> $LOG
# ENVIA LOG LOCAL PARA DESTINO REMOTO  DE LOG
  cp -r /var/log/rsync/ /mnt/backup/LOG
