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
    samples = []
    allStr = []
    prefix = "$WORK/SAEVA-outputs/bcf/"
    with open(inputFile) as csv_file:
       csv_reader = csv.reader(csv_file, delimiter=',')
       for row in csv_reader:
            samples.append(row[0])
       for sample in samples:
            allvcf.append(prefix + sample + ".vcf.gz")
       allStr  = ' '.join(allvcf)    
       count=0    
       for row in csv_reader:
            if count !=0:
               
               outFile.write('cd $WORK/SAEVA-outputs/;\n')
               outFile.write('mkdir bcf;\n')
               outFile.write(f'{BCFTools}bcftools merge --merge-force {allStr} $WORK/SAEVA-outputs/bcfoutput/bcf/*.gz -O v -o $WORK/SAEVA-outputs/bcf/mergrd.vfc ;\n')
               outFile.write('cp * ./bcf;\n')
               outFile.write('sed -i \'s/^chr/Chromosome/\' $WORK/SAEVA-outputs/bcf/*.vcf;\n')

               outFile.write(f'{minicondaBin}java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/bcf/{row[0]}.vcf > $WORK/SAEVA-outputs/bcf/snpEff_{row[0]}.ann.vcf \n')
               outFile.write('mv $WORK/SAEVA/snpEff_genes.txt $WORK/SAEVA-outputs/snpEff-outputs/bcf/snpEff_All{row[0]}_genes.txt \n')
               outFile.write('mv $WORK/SAEVA/snpEff_summary.html $WORK/SAEVA-outputs/snpEff-outputs/bcf/snpEff_All_{row[0]}summary.html \n')
        
               outFile.write('cd $WORK/SAEVA_outputs/bcf/ \n')

               outFile.write('cat *.vcf | sort | grep -v \'##\'| grep -v \'#\' >$WORK/SAEVA_outputs/bcf/combined.txt;\n')
               outFile.write('cat $WORK/SAEVA_outputs/bcf/combined.txt |cut -f -5|uniq -c |sort >$WORK/SAEVA_outputs/bcf/countlines.txt \n')
               outFile.write('result=$(cat $WORK/SAEVA_outputs/bcf/countlines.txt |grep -w "11"|cut -f2);\n')
               outFile.write('result=$(echo $result | sed \'s/ /|/g\');\n')
               outFile.write('cat $WORK/SAEVA_outputs/bcf/combined.txt |egrep -w $result |cut --complement -f6,9,10 | sed \'s/AB=.*;ANN=/ANN=/\' |uniq > $WORK/SAEVA_outputs/bcf/results.txt;\n')
            count =count + 1
