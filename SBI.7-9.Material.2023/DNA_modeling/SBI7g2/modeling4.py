# Homology modeling with multiple templates
from modeller import *              # Load standard Modeller classes
from modeller.automodel import *    # Load the automodel class

log.verbose()    # request verbose output
env = environ()  # create a new MODELLER environment to build this model in

# directories for input atom files
env.io.atom_files_directory = ['.', '../atom_files']

class MyModel(loopmodel):
      def select_loop_atoms(self):
          return selection(self.residue_range('249:','275:'))
      def special_restraints(self,aln):
          rsr = self.restraints
          at  = self.atoms
          rsr.add(secondary_structure.alpha(self.residue_range('250:','272:')))

a = MyModel(env,
              alnfile  = 'alignment2.pir', # alignment filename
              knowns   = ('1scjA', '1sbhA', '1meeA'),     # codes of the templates
              sequence = 'P11018',                        # code of the target
              assess_methods = assess.DOPE,               # assessment DOPE for models
              loop_assess_methods = assess.DOPE           # assessment of loop conformations with DOPE
              )              
a.md_level = refine.fast            # Use more accurate simulated annealing for the model
a.loop.md_level = refine.fast       # Use more accurate SA for the loops
a.starting_model= 7                 # index of the first model
a.ending_model  = 8                 # index of the last model
                                    # (determines how many models to calculate)
a.loop.starting_model = 1           # index of the first loop-model
a.loop.ending_model = 2             # index of the last loop-model                                     
a.make()                            # do the actual homology modeling

ok_mdl = [x for x in a.outputs if x['failure'] is None]
k='DOPE score'
ok_mdl.sort(key=lambda a:a[k])
for m in ok_mdl:
    print("Model: %s (DOPE score %.3f)"%(m['name'],m[k]))

ok_mdl = [x for x in a.loop.outputs if x['failure'] is None]
k='DOPE score'
ok_mdl.sort(key=lambda a:a[k])
for m in ok_mdl:
    print("Model: %s (DOPE score %.3f)"%(m['name'],m[k]))


    
    

