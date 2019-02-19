import csv
import sys

if len(sys.argv) < 4:
    sys.stderr.write('No Input CSV file and miniconda path  and depth \n')
    sys.exit(0)
    
inputFile = sys.argv[1]
minicondaBin = sys.argv[2]
depth= sys.argv[3]
outputFile = "BCF_VCF.sh"
with open(outputFile,'w') as outFile:
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            outFile.write(f'$WORK/SAEVA-softwares/freebayes/vcflib/bin/vcffilter -f "QUAL > 5000" $WORK/SAEVA-outputs/freebayesoutput/{row[0]}.vcf >$WORK/SAEVA-outputs/vcffilterq5000/{row[0]}.vcf\n')
            outFile.write(f'WORK/SAEVA-softwares/freebayes/vcflib/bin/vcffilter -f "DP > {depth}" $WORK/SAEVA-outputs/vcffilterq5000/{row[0]}.vcf > $WORK/SAEVA-outputs/vcffilterq5000-dp250/{row[0]}.vcf\n')
            outFile.write(f'{minicondaBin}bcftools view -Ob $WORK/SAEVA-outputs/vcffilterq5000-dp250/{row[0]}.vcf > $WORK/SAEVA-outputs/bcfoutput/{row[0]}.vcf.gz\n')
            outFile.write(f'{minicondaBin}bcftools index $WORK/SAEVA-outputs/bcfoutput/{row[0]}.vcf.gz\n')
