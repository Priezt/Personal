#!/usr/bin/bash

scp zhqi@bastion1.sfo.ironport.com:.rule_pack.gz /cygdrive/c/scripts/rule_pack.gz
scp zhqi@bastion1.sfo.ironport.com:.score_pack.gz /cygdrive/c/scripts/score_pack.gz
scp zhqi@bastion1.sfo.ironport.com:.freq_pack.gz /cygdrive/c/scripts/freq_pack.gz
rm /cygdrive/c/scripts/rule_pack
rm /cygdrive/c/scripts/score_pack
rm /cygdrive/c/scripts/freq_pack
gunzip /cygdrive/c/scripts/rule_pack.gz
gunzip /cygdrive/c/scripts/score_pack.gz
gunzip /cygdrive/c/scripts/freq_pack.gz


