
#zscore 1gua_a z-result
#sorted_depth = 0
#zscore p11c z-result


# 1. Load your files (already done in your script)
read pdb 1cbj_A.pdb temp1
read pdb 1q0e_A.pdb temp2
read pdb 1cob_A.pdb temp3
read pdb target.B99990002.pdb model

# 2. Analyze the energy (Required before Z-score)
analyse energy *

# 3. Initialize the Z-score reference database
init zscore
combine type sdev

# 4. Calculate Z-scores for your specific proteins
# This will print the numerical value in your terminal/console
zscore temp1 z-result
zscore temp2 z-result
zscore temp3 z-result
zscore model z-result

# This creates a file named p9j_zscores.txt in your folder
write z-result p9j_zscores.txt

set plot p29_zscores.ps

# 5. Optional: Plot the Z-score distribution
# This opens the window showing where your model sits compared to others
plot zscore