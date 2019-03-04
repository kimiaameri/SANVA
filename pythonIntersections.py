import csv
import sys

if len(sys.argv) < 3:
    sys.stderr.write('No Input CSV file and genomebed\n')
    sys.exit(0)
    
inputFile = sys.argv[1]
genomeBedpath = sys.argv[2]

outputFile = "mapVCF-to-Bed.sh"
with open(outputFile,'w') as outFile:
    count=0
    with open(inputFile) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            if count !=0:
                sed -i 's/^cpdna/chr/' {genomeBedpath}/nctc8325.bed;
                outFile.write(f'$WORK/bedtools2/bin/bedtools intersect –a {row[0]}.vcf.bed -b {genomeBedpath}/nctc8325.bed > $WORK/SAEVA-outputs/intersections/{row[0]}.bed \n')
            count =count + 1

