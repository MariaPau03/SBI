from modeller import *

env = environ()
# Load your model
mdl = model(env, file='p11a.pdb')

# This command creates a 'profile' or 'alignment' object from the PDB
aln = alignment(env)
aln.append_model(mdl, align_codes='p11a', atom_files='p11a.pdb')

# Write it out in PIR format (which is very similar to FASTA)
aln.write(file='p11a.fa', alignment_format='PIR')