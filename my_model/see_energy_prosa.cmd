read pdb P11018.BL00030002.pdb mod1_modif
read pdb model1.pdb mod1
read pdb model2.pdb mod2
read pdb 1sbhA.pdb 1sbh
read pdb 1sbiA.pdb 1sbi
read pdb 1s01A.pdb 1s01
analyse energy *
winsize * 30
color * mod1_modif magenta
color * mod1 blue
color * mod2 cyan
color * 1sbh green
color * 1sbi red
color * 1s01 white
plot
