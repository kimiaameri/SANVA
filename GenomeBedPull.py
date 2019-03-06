from Bio import SeqIO
from Bio import Entrez
import pdb
import sys
import csv

path = sys.argv[1]

accession = "CP000253"

Entrez.email="hameri@unomaha.edu"
handle = Entrez.esearch(db="nucleotide", term=accession)
records = Entrez.read(handle)
f = open(accession+".gb",'w')
for id in records["IdList"]:
    print(id)
    handle = Entrez.efetch(db="nucleotide",id=id,rettype="gb",retmode="text")
    rec = handle.read()
    #print(rec)
    f.write(rec)

f.close()

def main():
    outf = open(path + '/nctc8325.csv', 'w')
    header = """track name=vitVinGenes description="V. vinifera cpdna genes" itemRgb=On\n"""
    outf.write(header)
    for record in SeqIO.parse(open(accession+".gb", "rU"), "genbank") :
        for feature in record.features:
            if feature.type == 'gene':
                start = feature.location.start.position
                stop = feature.location.end.position
                try:
                    name = feature.qualifiers['gene'][0]
                except:
                    # some features only have a locus tag
                    name = feature.qualifiers['locus_tag'][0]
                if feature.strand < 0:
                    strand = "-"
                else:
                    strand = "+"
                bed_line = "cpdna\t{0}\t{1}\t{2}\t1000\t{3}\t{0}\t{1}\t65,105,225\n".format(start, stop, name, strand)
                outf.write(bed_line)
    outf.close()
if __name__ == '__main__':
    main()
    
outputFile = "nctc8325.bed"
with open(outputFile,'w') as outFile:
    count=0
    with open(path + '/nctc8325.csv','r') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            if count !=0 :
               for line in csv_reader:
                  csv_reader.write(line)
            
            count =count +1
 
    
