import csv
import sys

if len(sys.argv) < 4:
    sys.stderr.write('No Input CSV file and BCFTools and java\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
BCFTools = sys.argv[2]
minicondaBin = sys.argv[3]
cpath = sys.argv[4]
outputFile = "snpEffAll.sh"
with open(outputFile,'w') as outFile:
    outFile.write('cp $WORK/SAEVA-outputs/bcfoutput/*  $WORK/SAEVA-outputs/bcf/ ;\n')
    count=0    
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            if count !=0:
        outFile.write('sed -i \'s/^chr/Chromosome/\' $WORK/SAEVA-outputs/bcf/*.vcf;\n')

        outFile.write(f'{minicondaBin}java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/bcf/0000.vcf > $WORK/SAEVA-outputs/bcf/snpEff_All.ann.vcf \n')
        outFile.write('mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA-outputs/snpEff-outputs/bcf/snpEff_All_genes.txt \n')
        outFile.write('mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA-outputs/snpEff-outputs/bcf/snpEff_All_summary.html \n')
        
        outFile.write('cd $WORK/SAEVA_outputs/bcf/ \n')

        outFile.write('cat *.vcf | sort | grep -v \'##\'| grep -v \'#\' >$WORK/SAEVA_outputs/bcf/combined.txt;\n')
        outFile.write('cat $WORK/SAEVA_outputs/bcf/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/bcf/countlines.txt \n')
        outFile.write('result=$(cat $WORK/SAEVA_outputs/bcf/countlines.txt |grep -w "11"|cut -f2);\n')
        outFile.write('result=$(echo $result | sed \'s/ /|/g\');\n')
        outFile.write('cat $WORK/SAEVA_outputs/bcf/combined.txt |egrep -w $result |cut --complement -f6,9,10 | sed \'s/AB=.*;ANN=/ANN=/\' |uniq > $WORK/SAEVA_outputs/bcf/results.txt;\n')
