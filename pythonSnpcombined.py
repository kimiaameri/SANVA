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
    outFile.write('cp $WORK/SANVA-outputs/bcfoutput/*  $WORK/SANVA-outputs/bcf/ ;\n')
samples = []
allvcf = []
prefix = "$WORK/SANVA-outputs/bcf/"
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
               
               outFile.write('cd $WORK/SANVA-outputs/;\n')
               outFile.write('mkdir bcf;\n')
               outFile.write('cp * ./bcf;\n')
               outFile.write(f'{BCFTools}bcftools merge --force {allStr} -O v -o $WORK/SANVA-outputs/bcf/merged.vfc ;\n')
               outFile.write('sed -i \'s/^chr/Chromosome/\' $WORK/SANVA-outputs/bcf/merged.vcf;\n')

               outFile.write(f'{minicondaBin}java -Xmx4g -jar $WORK/SANVA-softwares/snpEff/snpEff.jar -v -no-downstream -no-upstream Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SANVA-outputs/bcf/merged.vcf > $WORK/SANVA-outputs/bcf/snpEff_merged.ann.vcf \n')
               outFile.write('mv $WORK/SANVA/snpEff_genes.txt $WORK/SANVA-outputs/snpEff-outputs/bcf/snpEff_merged_genes.txt \n')
               outFile.write('mv $WORK/SANVA/snpEff_summary.html $WORK/SANVA-outputs/snpEff-outputs/bcf/snpEff_merged_summary.html \n')
        
               outFile.write('cd $WORK/SANVA_outputs/bcf/ \n')

               outFile.write('cat *.vcf | sort | grep -v \'##\'| grep -v \'#\' >$WORK/SANVA_outputs/bcf/combined.txt;\n')
               outFile.write('cat $WORK/SANVA_outputs/bcf/combined.txt |cut -f -5|uniq -c |sort >$WORK/SANVA_outputs/bcf/countlines.txt \n')
               outFile.write('result=$(cat $WORK/SANVA_outputs/bcf/countlines.txt |grep -w "11"|cut -f2);\n')
               outFile.write('result=$(echo $result | sed \'s/ /|/g\');\n')
               outFile.write('cat $WORK/SANVA_outputs/bcf/combined.txt |egrep -w $result |cut --complement -f6,9,10 | sed \'s/AB=.*;ANN=/ANN=/\' |uniq > $WORK/SANVA_outputs/bcf/results.txt;\n')
            count =count + 1
