# Rice_NOTS_cluster

Username: lh106
Full Name: Lauren Hennelly
E-mail: Lauren.Hennelly@rice.edu

ssh -Y lh106@nots.rice.edu


/projects/psg/people/crq857/TSHR_Oct2024/03_TSHR_Phylogeny/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final.vcf.recode.vcf

Remove


KU cluster 

ssh crq857@mjolnirgate.unicph.domain

cisco
KUVPN
crq857  
Rangerbuster1!


scp -r crq857@mjolnirgate.unicph.domain:/projects/psg/people/crq857/TSHR_Oct2024/03_TSHR_Phylogeny/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final.vcf.recode.vcf ~/Desktop

/projects/psg/people/crq857/TSHRpaper/TSHRpaper/Ancient_tree/HapsModern_Sept132025/finalset/allhaplotypes_TSHR_Nov22_2025_ANCIENT_linear_final.fasta



scp -r crq857@mjolnirgate.unicph.domain:/projects/psg/people/crq857/TSHR_Oct2024/03_TSHR_Phylogeny/Haps_Oct15_2025/allhaplotypes_TSHR_Nov22_2025_linear_final.fasta ~/Desktop

/projects/psg/people/crq857/TSHR_Oct2024/03_TSHR_Phylogeny/Haps_Oct15_2025/allhaplotypes_TSHR_Oct16_2025_linear_final.fasta


/home/crq857/projects/TSHR_revision/scripts_Oct2025/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final_removeinsertionSNPs.recode.vcf.gz




#!/usr/bin/env bash
#SBATCH --job-name=dxypifst
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Redwolf/slurmout/vcfremoveSNps_Nov22.out
#SBATCH -e /home/crq857/projects/Redwolf/slurmout/vcfremoveSNps_Nov22.err

DIR=/projects/psg/people/crq857/TSHR_Oct2024/03_TSHR_Phylogeny/Haps_Oct15_2025

#cat all fasta files 

cat ${DIR}/*final.fasta > ${DIR}/allhaplotypes_TSHR_Nov22_2025.fasta

# linearize the combine fasta file 
#1.) Linearize multiline fasta

cat  ${DIR}/allhaplotypes_TSHR_Nov22_2025.fasta | awk '/^>/{if(N>0) printf("\n"); ++N; printf("%s\t",$0);next;} {printf("%s",$0);}END{printf("\n");}' >  ${DIR}/allhaplotypes_TSHR_Nov22_2025_2.fasta

awk 'BEGIN{RS=">"}NR>1{sub("\n","\t"); gsub("\n",""); print RS$0}' ${DIR}/allhaplotypes_TSHR_Nov22_2025_2.fasta > ${DIR}/allhaplotypes_TSHR_Nov22_2025_linear.fasta

#2.) Create each tab as a new line: 
  
sed -e 'y/\t/\n/'  ${DIR}/allhaplotypes_TSHR_Nov22_2025_linear.fasta >  ${DIR}/allhaplotypes_TSHR_Nov22_2025_linear2.fasta

#3.) Remove empty lines: 
  
sed '/^$/d'   ${DIR}/allhaplotypes_TSHR_Nov22_2025_linear2.fasta >   ${DIR}/allhaplotypes_TSHR_Nov22_2025_linear_final.fasta







#!/usr/bin/env bash
#SBATCH --job-name=IQtree
#SBATCH -c 1
#SBATCH --time 00:01:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /projects/psg/people/crq857/TSHRpaper/TSHRpaper/Ancient_tree/slurmout/IQtree_Nov22.out
#SBATCH -e /projects/psg/people/crq857/TSHRpaper/TSHRpaper/Ancient_tree/slurmout/IQtree_Nov22.err

#cat all fasta files 

cat *final.fasta > allhaplotypes_ancient_TSHR_Nov22_2025.fasta

# linearize the combine fasta file 
#1.) Linearize multiline fasta

cat  allhaplotypes_ancient_TSHR_Nov22_2025.fasta | awk '/^>/{if(N>0) printf("\n"); ++N; printf("%s\t",$0);next;} {printf("%s",$0);}END{printf("\n");}' >  allhaplotypes_ancient_TSHR_Nov22_2025_2.fasta

awk 'BEGIN{RS=">"}NR>1{sub("\n","\t"); gsub("\n",""); print RS$0}' allhaplotypes_ancient_TSHR_Nov22_2025_2.fasta > allhaplotypes_ancient_TSHR_Nov22_2025_linear.fasta

#2.) Create each tab as a new line: 
  
sed -e 'y/\t/\n/'  allhaplotypes_ancient_TSHR_Nov22_2025_linear.fasta >  allhaplotypes_ancient_TSHR_Nov22_2025_linear2.fasta

#3.) Remove empty lines: 
  
sed '/^$/d'   allhaplotypes_ancient_TSHR_Nov22_2025_linear2.fasta >   allhaplotypes_ancient_TSHR_Nov22_2025_linear_final.fasta





#!/usr/bin/env bash
#SBATCH --job-name=IQtree
#SBATCH -c 1
#SBATCH --time 00:01:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /projects/psg/people/crq857/TSHRpaper/TSHRpaper/Ancient_tree/slurmout/IQtree_Nov22.out
#SBATCH -e /projects/psg/people/crq857/TSHRpaper/TSHRpaper/Ancient_tree/slurmout/IQtree_Nov22.err

DIR=/projects/psg/people/crq857/TSHRpaper/TSHRpaper/Ancient_tree/HapsModern_Sept132025/finalset

#cat all fasta files 

cat ${DIR}/*final.fasta > ${DIR}/allhaplotypes_TSHR_Nov22_2025.fasta

# linearize the combine fasta file 
#1.) Linearize multiline fasta

cat  ${DIR}/allhaplotypes_TSHR_Nov22_2025.fasta | awk '/^>/{if(N>0) printf("\n"); ++N; printf("%s\t",$0);next;} {printf("%s",$0);}END{printf("\n");}' >  ${DIR}/allhaplotypes_TSHR_Nov22_2025_2.fasta

awk 'BEGIN{RS=">"}NR>1{sub("\n","\t"); gsub("\n",""); print RS$0}' ${DIR}/allhaplotypes_TSHR_Nov22_2025_2.fasta > ${DIR}/allhaplotypes_TSHR_Nov22_2025_linear.fasta

#2.) Create each tab as a new line: 
  
sed -e 'y/\t/\n/'  ${DIR}/allhaplotypes_TSHR_Nov22_2025_linear.fasta >  ${DIR}/allhaplotypes_TSHR_Nov22_2025_linear2.fasta

#3.) Remove empty lines: 
  
sed '/^$/d'   ${DIR}/allhaplotypes_TSHR_Nov22_2025_linear2.fasta >   ${DIR}/allhaplotypes_TSHR_Nov22_2025_linear_final.fasta


/projects/psg/people/crq857/TSHR_Oct2024/03_TSHR_Phylogeny/Haps_Oct15_2025/








/projects/psg/people/crq857/TSHRpaper/TSHRpaper/Ancient_tree/HapsModern_Sept132025/finalset/allhaplotypes_TSHR_Nov22_2025_ANCIENT_linear_final.fasta





#!/usr/bin/env bash
#SBATCH --job-name=dxypifst
#SBATCH -c 1
#SBATCH --time 1-4:00:00
#SBATCH --mem-per-cpu 10G
#SBATCH -o /home/crq857/projects/Redwolf/slurmout/vcfremoveSNps_%A_%a.out
#SBATCH -e /home/crq857/projects/Redwolf/slurmout/vcfremoveSNps_%A_%a.err
#SBATCH --array=1-20%20

#Add names to each haplotype fasta file

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
NAMES=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/crq857/projects/TSHRpaper/files_Oct2024/dingo.txt)


module load perl
module load gsl/2.5
module load bcftools 
module load samtools 

REF=/projects/psg/people/crq857/Chapter2/ref/canFam31.fasta
VCF=//projects/psg/people/crq857/TSHR_Oct2024/03_TSHR_Phylogeny/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final_removeinsertionSNPs.recode.vcf.gz
OUT=/projects/psg/people/crq857/TSHR_Oct2024/03_TSHR_Phylogeny/Haps_Nov22_2025

samtools faidx ${REF} -r /home/crq857/projects/TSHRpaper/scripts_Oct2024/region.bed | bcftools consensus -H 1 ${VCF} --sample ${NAMES} > ${OUT}/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final_removeinsertionSNPs_H1_${NAMES}.fasta
samtools faidx ${REF} -r /home/crq857/projects/TSHRpaper/scripts_Oct2024/region.bed | bcftools consensus -H 2 ${VCF} --sample ${NAMES} > ${OUT}/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final_removeinsertionSNPs_H2_${NAMES}.fasta



Dingo02_34694
Dingo03_35294
Dingo04_35295
Dingo05_35296
Dingo06_35297
Dingo07_35298
Dingo08_35299
Dingo09_35300
Dingo10_35301
Dingo12_35303
Dingo13_35304
Dingo14_35305
Dingo15_35306
Dingo16_35307
Dingo17_35308
Dingo18_35309
Dingo19_35310
Dingo20_35311
Dingo21_35312
Dingo22_35313




#!/usr/bin/env bash
#SBATCH --job-name=dxypifst
#SBATCH -c 1
#SBATCH --time 00:10:00
#SBATCH --mem-per-cpu 1G
#SBATCH -o /home/crq857/projects/Redwolf/slurmout/vcfremoveSNps_%A_%a.out
#SBATCH -e /home/crq857/projects/Redwolf/slurmout/vcfremoveSNps_%A_%a.err
#SBATCH --array=1-20%20

#Add names to each haplotype fasta file

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
NAMES=$(sed "${SLURM_ARRAY_TASK_ID}q;d"  /home/crq857/projects/TSHRpaper/files_Oct2024/dingo.txt)

DIR=/projects/psg/people/crq857/TSHR_Oct2024/03_TSHR_Phylogeny/Haps_Oct15_2025

sed "1s/^/>${NAMES}_H1\n/" ${DIR}/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final_removeinsertionSNPs_H1_${NAMES}.fasta > ${DIR}/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final_removeinsertionSNPs_H1_${NAMES}_header.fasta
sed "1s/^/>${NAMES}_H2_\n/" ${DIR}/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final_removeinsertionSNPs_H2_${NAMES}.fasta > ${DIR}/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final_removeinsertionSNPs_H2_${NAMES}_header.fasta


# grep out the chromosome names labels
grep -v "chr" ${DIR}/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final_removeinsertionSNPs_H1_${NAMES}_header.fasta > ${DIR}/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final_removeinsertionSNPs_H1_${NAMES}_final.fasta
grep -v "chr" ${DIR}/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final_removeinsertionSNPs_H2_${NAMES}_header.fasta > ${DIR}/chr8_Canis_modern_v9_TSHRgene_phased_haplotype_final_removeinsertionSNPs_H2_${NAMES}_final.fasta




