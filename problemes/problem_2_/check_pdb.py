from modeller import *
env = environ()
model = model(env, file='p9c_domain1')
print(model.residues) # This prints every residue index and name in the PDB
