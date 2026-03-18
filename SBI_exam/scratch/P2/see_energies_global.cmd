# 1. Load all files
read pdb 1rc2_A.pdb temp1
read pdb 2abm_H.pdb temp2
read pdb 2o9g_A.pdb temp3
read pdb p42f1.pdb model

# 2. Analyze energies
analyse energy *

# 3. Apply individual colors for clarity
color * temp1 green
color * temp2 cyan
color * temp3 blue
color * model red


# 5. THE SHIFT COMMAND (Crucial Step)
# Format: shift [protein_name] [number_of_residues_to_move]
# If your domain matches the template starting at residue 60, shift the domain by 60
# OR shift the template by -60. 
# Example adjustment based on typical SH2/SH3 positions:

#shift dom1 1
#shift dom2 60
#shift 5yel_B 111


# 4. Use a standard window size for smoothing
winsize * 20
# 6. Graph setup
draw * * 0
draw pair * 1
graph title templ1 temp2 temp32 model

# 7. Generate the plot
plot


