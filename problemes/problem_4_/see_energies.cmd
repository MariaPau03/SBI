# 1. Load all files
read pdb 1z8u_D.pdb 1z8u_D
read pdb 1y01_B.pdb 1y01_B
read pdb 1bz1_C.pdb 1bz1_C
read pdb target.B99990001.pdb model


# 2. Analyze energies
analyse energy *

# 3. Apply individual colors for clarity
color * 1z8u_D green
color * 1y01_B cyan
color * 1bz1_C yellow
color * model magenta

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
graph title 1z8u_D 1y01_B 1bz1_C  target.B99990001.pdb

# 7. Generate the plot
plot


