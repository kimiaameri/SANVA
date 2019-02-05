module load bcftools/1.8
bcftools isec $WORK/SAEVA-outputs/bcfoutput/HSS12071M1_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/Silverman99624A1_S20_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/Silverman37712B1_S21_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/Silverman99382M1_S15_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/Silverman62129B1_S17_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/Silverman60383B1_S18_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/Silverman79414A1_S23_q5000_dp250.vcf.gz -p $WORK/SAEVA-outputs/high -n=7;

bcftools isec $WORK/SAEVA-outputs/bcfoutput/Silverman93954A1_S19_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/Silverman99624D1_S16_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/Silverman94232M1_S14_q5000_dp250.vcf.gz $WORK/SAEVA-outputs/bcfoutput/Silverman99382B1_S22_q5000_dp250.vcf.gz -p $WORK/SAEVA-outputs/low -n=4;

sed -i 's/^chr/Chromosome/' $WORK/SAEVA-outputs/high/*.vcf;
sed -i 's/^chr/Chromosome/' $WORK/SAEVA-outputs/low/*.vcf;

module load java/1.8

java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/high/0000.vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_high0.ann.vcf
mv $WORK/project1/snpEff-genes.txt $WORK/SAEVA-outputs/snpEff-outputs/update-snpEff-gene/snpEff_high0_genes.txt
mv $WORK/project1/snpEff-summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_high0_summary.html

java -Xmx4g -jar $WORK/SAEVA_softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/high/0001.vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_high1.ann.vcf
mv $WORK/project1/snpEff-genes.txt $WORK/SAEVA-outputs/snpEff-outputs/snpEff-gene/snpEff_high1_genes.txt
mv $WORK/project1/snpEff-summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_high1_summary.html

java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/high/0002.vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_high2.ann.vcf
mv $WORK/project1/snpEff-genes.txt $WORK/SAEVA-outputs/snpEff_outputs/snpEff-gene/snpEff_high2_genes.txt
mv $WORK/project1/snpEff-summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_high2_summary.html

java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/high/0003.vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_high3.ann.vcf
mv $WORK/project1/snpEff-genes.txt $WORK/SAEVA-outputs/snpEff-outputs/snpEff-gene/snpEff_high3_genes.txt
mv $WORK/project1/snpEff-summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_high3_summary.html

java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/high/0004.vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_high4.ann.vcf
mv $WORK/project1/snpEff-genes.txt $WORK/SAEVA-outputs/snpEff-outputs/snpEff-gene/snpEff_high4_genes.txt
mv $WORK/project1/snpEff-summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_high4_summary.html

java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/high/0005.vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_high5.ann.vcf
mv $WORK/project1/snpEff-genes.txt $WORK/SAEVA-outputs/snpEff-outputs/snpEff-gene/snpEff_high5_genes.txt
mv $WORK/project1/snpEff-summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_high5_summary.html

java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/high/0006.vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_high6.ann.vcf
mv $WORK/project1/snpEff-genes.txt $WORK/SAEVA-outputs/snpEff-outputs/snpEff-gene/snpEff_high6_genes.txt
mv $WORK/project1/snpEff-summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_high6_summary.html


java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/low/0000.vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_low0.ann.vcf
mv $WORK/project1/snpEff-genes.txt $WORK/SAEVA-outputs/snpEff-outputs/snpEff-gene/snpEff_low0_genes.txt
mv $WORK/project1/snpEff-summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_low0_summary.html

java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/low/0001.vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_low1.ann.vcf
mv $WORK/project1/snpEff-genes.txt $WORK/SAEVA-outputs/snpEff-outputs/snpEff-gene/snpEff_low1_genes.txt
mv $WORK/project1/snpEff-summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_low1_summary.html

java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/low/0002.vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_low2.ann.vcf
mv $WORK/project1/snpEff-genes.txt $WORK/SAEVA-outputs/snpEff-outputs/snpEff-gene/snpEff_low2_genes.txt
mv $WORK/project1/snpEff-summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_low2_summary.html

java -Xmx4g -jar $WORK/SAEVA-softwares/snpEff/snpEff.jar -v Staphylococcus_aureus_subsp_aureus_nctc_8325 $WORK/SAEVA-outputs/low/0003.vcf > $WORK/SAEVA-outputs/snpEff-outputs/snpEff_low3.ann.vcf
mv $WORK/project1/snpEff-genes.txt $WORK/SAEVA-outputs/snpEff-outputs/snpEff-gene/snpEff_low3_genes.txt
mv $WORK/project1/snpEff-summary.html $WORK/SAEVA-outputs/snpEff-outputs/snpEff-summary/snpEff_low3_summary.html
