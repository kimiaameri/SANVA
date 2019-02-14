from Bio import SeqIO
import pdb
def main():
    outf = open('/work/biocore/kimia/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/nctc8325.bed', 'w')
    header = """track name=vitVinGenes description="V. vinifera cpdna genes" itemRgb=On\n"""
    outf.write(header)
    for record in SeqIO.parse(open("/work/biocore/kimia/SAEVA_reference_genome/Staphylococcus_aureus_NCTC_8325/NCBI/2006-02-13/c8325.gb", "rU"), "genbank") :
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
