echo ">p9c_domain1" > target_sh3_sequence2.fa
cat 1gri_A.fa | grep -v ">" | tr -d '\n' | cut -c 150-200 >> target_sh3_sequence2.fa
echo ">target" >> target_sh3_sequence2.fa
cat target.fa | grep -v ">" | tr -d '\n' | cut -c 163-215 >> target_sh3_sequence2.fa
clustalw target_sh3_sequence2.fa
aconvertMod2.pl -in c -out p < target_sh3_sequence2.aln > target_sh3_sequence2.fa.pir