# 1. Load all files
read pdb 1bmb_A.pdb temp1
read pdb 1fyr_D.pdb temp2
read pdb 1gri_A.pdb temp3
read pdb p9h_global.pdb global

# 2. Analyze energies
analyse energy *

# 3. Apply individual colors for clarity
color * temp1 magenta
color * temp2 cyan
color * temp3 white
color * global red

# 5. THE SHIFT COMMAND (Crucial Step)
# Format: shift [protein_name] [number_of_residues_to_move]
# If your domain matches the template starting at residue 60, shift the domain by 60
# OR shift the template by -60. 
# Example adjustment based on typical SH2/SH3 positions:

#shift dom1 1
#shift dom2 60
#shift dom3 163


# 4. Use a standard window size for smoothing
winsize * 20
# 6. Graph setup
draw * * 0
draw pair * 1
graph title 1bmb_A 1fyr_D 1gri_A global_structure

# 7. Generate the plot
plot


