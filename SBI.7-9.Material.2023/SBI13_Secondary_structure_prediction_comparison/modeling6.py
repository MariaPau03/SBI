# Homology modeling with multiple templates
from modeller import *              # Load standard Modeller classes
from modeller.automodel import *    # Load the automodel class

log.verbose()    # request verbose output
env = environ()  # create a new MODELLER environment to build this model in

# directories for input atom files
env.io.atom_files_directory = ['.', '../atom_files']

a = loopmodel(env,
              alnfile  = 'alignment6.pir', # alignment filename
              knowns   = ('1scjA', '1sbhA', '1meeA'),     # codes of the templates
              sequence = 'P11018',
              assess_methods = assess.DOPE,
              loop_assess_methods = assess.DOPE
              )               # code of the target
#a.assess_method = assess.DOPE       # Assess with DOPE the model
#a.loop.assess_method = assess.DOPE  # Assess with DOPE the loop conformation
a.md_level = refine.fast            # Use more accurate simulated annealing for the model
a.loop.md_level = refine.fast       # Use more accurate SA for the loops
a.starting_model= 11                 # index of the first model
a.ending_model  = 12                 # index of the last model
                                    # (determines how many models to calculate)
a.loop.starting_model = 1           # index of the first loop-model
a.loop.ending_model = 4             # index of the last loop-model                                     
a.make()                            # do the actual homology modeling

ok_mdl = [x for x in a.outputs if x['failure'] is None]
key='DOPE score'
ok_mdl.sort(key=lambda a:a[key])

for m in ok_mdl:
 print("Model: %s (DOPE score %.3f)"%(m['name'],m[key]))

ok_mdl_loop = [x for x in a.loop.outputs if x['failure'] is None]
key='DOPE score'
ok_mdl_loop.sort(key=lambda a:a[key])

for m in ok_mdl_loop:
 print("Model: %s (DOPE score %.3f)"%(m['name'],m[key]))


