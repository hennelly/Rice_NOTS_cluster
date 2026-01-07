#!/bin/bash 
#SBATCH --job-name=combine 
#SBATCH --account=commons 
#SBATCH --partition=commons 
#SBATCH --ntasks=1 
#SBATCH --mem-per-cpu=1G 
#SBATCH --time=00:30:00 
#SBATCH --output=/home/lh106/Rice/logfiles/out3.out
#SBATCH --error=/home/lh106/Rice/logfiles/out3.err

mv Africanwolf_Algeria_MJ109* /storage/hpc/work/lh106/bin/ncftp-3.3.0/bin 

cat /scratch/lh106/rawfiles/V300066577_L2_DKWGS201203039-531_1.fq.gz /scratch/lh106/rawfiles/V300066577_L2_DKWGS201203039-532_1.fq.gz /scratch/lh106/rawfiles/V300074477_L1_DKWGS201203039-531_1.fq.gz /scratch/lh106/rawfiles/V300074477_L1_DKWGS201203039-532_1.fq.gz /scratch/lh106/rawfiles/V300074519_L4_DKWGS201203039-531_1.fq.gz /scratch/lh106/rawfiles/V300074519_L4_DKWGS201203039-532_1.fq.gz > /scratch/lh106/rawfiles/Africanwolf_Algeria_MJ109_1.fq.gz
cat /scratch/lh106/rawfiles/V300066577_L2_DKWGS201203039-531_2.fq.gz /scratch/lh106/rawfiles/V300066577_L2_DKWGS201203039-532_2.fq.gz /scratch/lh106/rawfiles/V300074477_L1_DKWGS201203039-531_2.fq.gz /scratch/lh106/rawfiles/V300074477_L1_DKWGS201203039-532_2.fq.gz /scratch/lh106/rawfiles/V300074519_L4_DKWGS201203039-531_2.fq.gz /scratch/lh106/rawfiles/V300074519_L4_DKWGS201203039-532_2.fq.gz > /scratch/lh106/rawfiles/Africanwolf_Algeria_MJ109_2.fq.gz



cat /scratch/lh106/rawfiles/V300074477_L1_DKWGS201203031-571_1.fq.gz /scratch/lh106/rawfiles/V300074477_L1_DKWGS201203031-572_1.fq.gz /scratch/lh106/rawfiles/V300074519_L4_DKWGS201203031-571_1.fq.gz /scratch/lh106/rawfiles/V300074519_L4_DKWGS201203031-572_1.fq.gz > /scratch/lh106/rawfiles/Africanwolf_Algeria_MJ099_1.fq.gz
cat /scratch/lh106/rawfiles/V300074477_L1_DKWGS201203031-571_2.fq.gz /scratch/lh106/rawfiles/V300074477_L1_DKWGS201203031-572_2.fq.gz /scratch/lh106/rawfiles/V300074519_L4_DKWGS201203031-571_2.fq.gz /scratch/lh106/rawfiles/V300074519_L4_DKWGS201203031-572_2.fq.gz > /scratch/lh106/rawfiles/Africanwolf_Algeria_MJ099_2.fq.gz

/scratch/lh106/rawfiles
