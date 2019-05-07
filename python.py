import csv
import sys

if len(sys.argv) < 4:
    sys.stderr.write('No Input CSV file and BCFTools and java\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
BCFTools = sys.argv[2]
minicondaBin = sys.argv[3]
cpath = sys.argv[4]
outputFile = "snpEff.sh"

outFile.write('cp $WORK/SAEVA-outputs/bcfoutputs/* $WORK/SAEVA-outputs/All/')

with open(outputFile,'w') as outFile:
        outFile.write(f'{BCFTools}bcftools isec $WORK/SAEVA-outputs/bcfoutput/*.gz -p $WORK/SAEVA-outputs/All -n={length};\n')
        prefix = "$WORK/SAEVA-outputs/bcfoutput/"
        allHigh = []
        for sample in highSamples :
            allHigh.append(prefix + sample + ".vcf.gz")
        allHighStr  = ' '.join(allHigh)         
        outFile.write(f'{BCFTools}bcftools isec {allHighStr} -p $WORK/SAEVA-outputs/high -n={high};\n')




bcftools isec $WORK/SAEVA-outputs/bcfoutput/1/HSS12071M1_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/1/Silverman79414A1_S23_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/1/Silverman37712B1_S21_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/1/Silverman99624A1_S20_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/1/Silverman60383B1_S18_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/1/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/1/Silverman99382M1_S15_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/1/Silverman99382B1_S22_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/1/Silverman99624D1_S16_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/1/Silverman94232M1_S14_q5000_dp250.vcf.gz -p $WORK/SAEVA-outputs/result -n=10;
 with open(inputFile) as csv_file:
   outFile.write(f'{BCFTools}bcftools isec {allLowStr} -p $WORK/SAEVA-outputs/low -n={low};\n')
   outFile.write('sed -i \'s/^chr/Chromosome/\' $WORK/SAEVA-outputs/All/*.vcf;\n')
