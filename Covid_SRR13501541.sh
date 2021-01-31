## download fastq
fastq-dump -I --split-files SRR13501541

## download reference sequence NC_045512.2 on my PC
# found here  https://www.ncbi.nlm.nih.gov/nuccore/NC_045512.2?report=graph&log$=seqview

## rename it (not needed )
#mv NC_045512.2\[1..29903\].fa  NC_045512.2.fa 
 
##indexing the reference
bwa index -p NC_045512.2 NC_045512.2.fa
 
## bwa-mem alignment 
bwa mem -M -t 8 NC_045512.2 SRR13501541_1.fastq SRR13501541_1.fastq > SRR13501541.sam

## samtools
samtools fixmate -O bam SRR13501541.sam SRR13501541.sam
