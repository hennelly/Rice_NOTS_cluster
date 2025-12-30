# Move files from remote server to blackblaze 

HennellyLabBackup key: 

KeyID: 35dc2e1b4a6a

Application Key ID: K005MsaYJIrEzjEr5G6QasUObBbXIJE

Scripts for moving files over to backblaze 

rclone sync /home/crq857/projects/Redwolf HennellyLabBackup:HennellyLabBackup/Projects_CPH/Redwolf

Username: laurenmaehennelly@gmail.com
Password: RiceUniversity1


scripts


#!/usr/bin/env bash
#SBATCH --job-name=filet
#SBATCH --partition=filetransfer
#SBATCH --qos=filetransfer
#SBATCH -c 1
#SBATCH --time 11:10:00
#SBATCH --mem 5G
#SBATCH -o move.out
#SBATCH -e move.err

rclone sync /home/crq857/projects/Geneflow_Dogs HennellyLabBackup:HennellyLabBackup/Projects_CPH/Geneflow_Dogs_scripts

/home/crq857/projects/Chapter2
