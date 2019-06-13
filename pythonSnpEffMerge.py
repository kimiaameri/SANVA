import csv
import sys

if len(sys.argv) < 4:
    sys.stderr.write('No Input CSV file and BCFTools and java\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
#BCFTools = sys.argv[2]
minicondaBin = sys.argv[2]
cpath = sys.argv[3]
outputFile = "snpEffMerge.sh"
prefix = "$WORK/SANVA-outputs/bcfoutput/"
count=0
with open(inputFile) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    allSamples=[]
    for row in csv_reader:
        if count !=0 :
          allSamples.append(row[0])
        count =count +1
    listAll=[]
    for sample in allSamples :
        listAll.append(prefix + sample + ".vcf.gz")
        
    allStr  = ' '.join(listAll) 
    with open (cpath +"/allSamples.txt",'w') as of:
         of.write(str(allSamples))
    length=len(allSamples)
with open(outputFile,'w') as outFile:
        outFile.write(f'{minicondaBin}bcftools merge --force {allStr} -O v -o $WORK/SANVA-outputs/mergefile.vcf;\n')
        outFile.write('sed -i \'s/^chr/Chromosome/\' $WORK/SANVA-outputs/mergefile.vcf;\n')
        outFile.write(f'{minicondaBin}java -Xmx4g -jar {minicondaBin}snpEff -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SANVA-outputs/mergefile.vcf > $WORK/SANVA-outputs/snpEff.ann.vcf \n')
        outFile.write('mv $WORK/SANVA/snpEff_genes.txt $WORK/SANVA-outputs/snpEff.txt \n')
        outFile.write('mv $WORK/SANVA/snpEff_summary.html $WORK/SANVA-outputs/snpEff_summary.html \n')

