read pdb P11018.BL00040001.pdb mod1_modif
read pdb model1.pdb mod1
read pdb model2.pdb mod2
read pdb 1sbhA.pdb 1sbh
read pdb 1yjaA.pdb 1yja
read pdb 1yjbA.pdb 1yjb
analyse energy *
winsize * 30
color * mod1_modif magenta
color * mod1 blue
color * mod2 cyan
color * 1sbh green
color * 1yja red
color * 1yjb white
plot
