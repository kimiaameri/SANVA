import csv
f = open("InputFiles.csv",'r')
csv_reader = csv.reader(csv_file, delimiter=',')
    
with open('InputFiles.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    for row in csv_reader:
            print(f'\t trimmomatic PE -threads 4 -phred33 -trimlog $WORK/SAEVA-outputs/trimmomatic/trimlog/{row[0]}.trimlog {row[1]} {row[2]} $WORK/trimmomatic/{row[0]}-R1.paired.fq $WORK/trimmomatic/{row[0]}-R1.unpaired.fq $WORK/trimmomatic/{row[0]}-R2.paired.fq $WORK/trimmomatic/{row[0]}-R2.unpaired.fq')

                  
with open ("InputFiles.csv", "r") as myfile:
    data = myfile.read()
    for line in data:
        line.rstrip()

print data
