from modeller import *
from modeller.scripts import complete_pdb

log.verbose()
env = environ()

# 1. Load the "rules" for building atoms
# These libraries contain the standard bond lengths and angles for amino acids [cite: 106, 147]
env.libs.topology.read(file='$(LIB)/top_heav.lib')
env.libs.parameters.read(file='$(LIB)/par.lib')

# 2. Build the full-atom model
# complete_pdb() reads your CA-only file and automatically fills in 
# the missing backbone (N, C, O) and all side-chains 
mdl = complete_pdb(env, "ca_trace.pdb")

# 3. Save the result as p11a.pdb
mdl.write(file='p11a.pdb')