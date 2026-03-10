# 1. Load all files
read pdb 8cpa_A.pdb temp1
read pdb 1hee_A.pdb temp2
read pdb 1hdu_E.pdb temp3
read pdb target.pdb unfixed
read pdb target_fixed.pdb fixed


# 2. Analyze energies
analyse energy *

# 3. Apply individual colors for clarity
color * temp1 magenta
color * temp2 red
color * temp3 white
color * unfixed  cyan
color * fixed  green


# 5. THE SHIFT COMMAND (Crucial Step)
# Format: shift [protein_name] [number_of_residues_to_move]
# If your domain matches the template starting at residue 60, shift the domain by 60
# OR shift the template by -60. 
# Example adjustment based on typical SH2/SH3 positions:



# 4. Use a standard window size for smoothing
winsize * 20
# 6. Graph setup
draw * * 0
draw pair * 1
graph title 8cpa_A.pdb 1hee_A.pdb 1hdu_E.pdb unfixed_target fixed_target

# 7. Generate the plot
plot


