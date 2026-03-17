# 1. Load all files
read pdb 5tou_A.pdb 5t0u_A
read pdb 5yel_B.pdb 5yel_B
read pdb target.B99990001.pdb model

# 2. Analyze energies
analyse energy *

# 3. Apply individual colors for clarity
color * 5t0u_A green
color * 5yel_B cyan
color * model red

# 5. THE SHIFT COMMAND (Crucial Step)
# Format: shift [protein_name] [number_of_residues_to_move]
# If your domain matches the template starting at residue 60, shift the domain by 60
# OR shift the template by -60. 
# Example adjustment based on typical SH2/SH3 positions:

#shift dom1 1
#shift dom2 60
shift 5yel_B 111


# 4. Use a standard window size for smoothing
winsize * 20
# 6. Graph setup
draw * * 0
draw pair * 1
graph title 5t0u_A 5yel_B model

# 7. Generate the plot
plot


