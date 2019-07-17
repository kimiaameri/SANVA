import csv
import sys

if len(sys.argv) < 4:
    sys.stderr.write('No Input CSV file and miniconda path GITHUB_PATH\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
minicondaBin = sys.argv[2]
githubPath = sys.argv[3]
outputFile = "trimmomatic.sh"  
with open(outputFile,'w') as outFile:
    outFile.write('#!/bin/sh \n')
    outFile.write('#SBATCH --time=100:00:00   # Run time in hh:mm:ss  \n')
    outFile.write('#SBATCH --mem-per-cpu=64gb  \n')
    # Maximum memory required per CPU (in megabytes')
    outFile.write('#SBATCH --job-name=Trim \n')
    outFile.write('#SBATCH --error=Trim.%J.err \n')
    outFile.write('#SBATCH --output=Trim.%J.out \n')  
    count=0
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        
        for row in csv_reader:
            if count !=0:
               outFile.write(f'{minicondaBin}trimmomatic PE -threads 4 -phred33 -trimlog $WORK/SANVA-outputs/trimmomatic/trimlog/{row[0]}.trimlog $WORK/SANVA/SANVA-data/{row[0]}_1.fastq $WORK/SANVA/SANVA-data/{row[0]}_2.fastq $WORK/SANVA-outputs/trimmomatic/{row[0]}-R1.paired.fq $WORK/SANVA-outputs/trimmomatic/{row[0]}-R1.unpaired.fq $WORK/SANVA-outputs/trimmomatic/{row[0]}-R2.paired.fq $WORK/SANVA-outputs/trimmomatic/{row[0]}-R2.unpaired.fq SLIDINGWINDOW:4:15 MAXINFO:50:0.5 LEADING:3 TRAILING:3 MINLEN:100\n')
               #outFile.write(f'{minicondaBin}trimmomatic PE -threads 4 -phred33 -trimlog $WORK/SAEVA-outputs/trimmomatic/trimlog/{row[0]}.trimlog {row[2]} {row[3]} $WORK/SAEVA-outputs/trimmomatic/{row[0]}-R1.paired.fq $WORK/SAEVA-outputs/trimmomatic/{row[0]}-R1.unpaired.fq $WORK/SAEVA-outputs/trimmomatic/{row[0]}-R2.paired.fq $WORK/SAEVA-outputs/trimmomatic/{row[0]}-R2.unpaired.fq SLIDINGWINDOW:4:15 MAXINFO:50:0.5 LEADING:3 TRAILING:3 MINLEN:100\n')
            count =count + 1
 
