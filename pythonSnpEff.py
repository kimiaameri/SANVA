import csv
import sys

if len(sys.argv) < 3:
    sys.stderr.write('No Input CSV file and miniconda path\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
minicondaBin = sys.argv[2]
outputFile = "SnpEff.sh"

with open(inputFile) as csv_file:

    csv_reader = csv.reader(csv_file, delimiter=',')
    highSamples = []
    lowSamples = []
    for row in csv_reader:
        if row[1].lower() == 'high': highSamples.append(row[0])
        if row[1].lower() == 'low': lowSamples.append(row[0])
    print(highSamples)
    print(lowSamples)
    high = len(highSamples)
    low = len(lowSamples)
    length = high + low
    with open(outputFile,'w') as outFile:
         #with open(inputFile) as csv_file:
        outFile.write(f'{minicondaBin}bcftools isec $WORK/SAEVA-outputs/bcfoutput/*.gz -p $WORK/SAEVA-outputs/All -n={length};\n')
        prefix = "$WORK/SAEVA-outputs/bcfoutput/"
        allHigh = []
        for sample in highSamples :
            allHigh.append(prefix + sample + "_q_db.vcf.gz")
        allHighStr  = ' '.join(allHigh)         
        outFile.write(f'{minicondaBin}bcftools isec {allHighStr} -p $WORK/SAEVA-outputs/high -n={high};\n')
        allLow = []
        for sample in lowSamples :
            allLow.append(prefix + sample + "_q_db.vcf.gz")
        
        allLowStr  = ' '.join(allLow)         

        outFile.write(f'{minicondaBin}bcftools isec {allLowStr} -p $WORK/SAEVA-outputs/low -n={low};\n')
         #    for samples in lowSamples :
         #        outFile.write(f'{minicondaBin}bcftools isec $WORK/SAEVA-outputs/bcfoutput/{samples}.vcf.gz -p $WORK/SAEVA-outputs/low -n={low};\n')


          #   outFile.write('sed -i \'s/^chr/Chromosome/\' $WORK/SAEVA-outputs/All/*.vcf;\n')
          #   outFile.write('sed -i \'s/^chr/Chromosome/\' $WORK/SAEVA-outputs/high/*.vcf;\n')
           #  outFile.write('sed -i \'s/^chr/Chromosome/\' $WORK/SAEVA-outputs/low/*.vcf;\n')

            # for i in highSamples:
              #   outFile.write(f'{minicondaBin}java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/high/{highIndex.index}.vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_high_{index}.ann.vcf \n')
              #   outfile.write(f'mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA-outputs/snpEff-outputs/update-snpEff-gene/snpEff_high_{index}_genes.txt \n')
              #   outfile.write(f'mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_high_{index}_summary.html \n')
           #  for i in lowSamples:
            #     outFile.write(f'{minicondaBin}java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/low/{%i} .vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_low_{index}.ann.vcf \n')
             #    outfile.write(f'mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA-outputs/snpEff-outputs/update-snpEff-gene/snpEff_low_{index}_genes.txt \n')
             #    outfile.write(f'mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_low_{index}_summary.html \n')




