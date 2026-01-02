# Move files from remote server to blackblaze 

HennellyLabBackup key: 

KeyID: 35dc2e1b4a6a

Application Key ID: K005MsaYJIrEzjEr5G6QasUObBbXIJE

Scripts for moving files over to backblaze 

Data/fastqfiles

#!/usr/bin/env bash
#SBATCH --job-name=filet
#SBATCH --partition=filetransfer
#SBATCH --qos=filetransfer
#SBATCH -c 1
#SBATCH --time 11:10:00
#SBATCH --mem 5G
#SBATCH -o move.out
#SBATCH -e move.err

rclone sync /projects/psg/people/crq857/TSHRpaper/TSHRpaper HennellyLabBackup:HennellyLabBackup/Data/TSHRpaper_copy

Username: laurenmaehennelly@gmail.com
Password: RiceUniversity1
