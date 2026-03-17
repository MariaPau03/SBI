# 1. Load all files
read pdb 6tim_A.pdb 6tim_A
read pdb 2v5l_A.pdb 2v5l_A
read pdb target.B99990002.pdb model

# 2. Analyze energies
analyse energy *

# 3. Apply individual colors for clarity
color * 6tim_A green
color * 2v5l_A cyan
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
graph title 6im_A 2v5l_A model

# 7. Generate the plot
plot


