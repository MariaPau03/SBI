# 1. Load all files
read pdb 1a93_A.pdb template1_p38b1
read pdb 1nkp_A.pdb template2_p38b1
read pdb 1nlw_B.pdb template1_p38b2
read pdb 1an2_A.pdb template2_p38b2
read pdb p38b1.pdb p38b1
read pdb p38b2.pdb p38b2

# 2. Analyze energies
analyse energy *

# 3. Apply individual colors for clarity
color * template1_p38b1 green
color * template2_p38b1 cyan
color * template1_p38b2 blue
color * template2_p38b2 yellow

color * p38b1 red
color * p38b2 magenta

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
graph title template1_p38b1 template2_p38b1 template1_p38b2 template2_p38b2 p38b1 p38b2

# 7. Generate the plot
plot


