read pdb P11018.BL00010003.pdb mdl1.3
read pdb P11018.BL00020005.pdb mdl2.5
read pdb P11018.B99990001.pdb mdl1
read pdb P11018.BL00010011.pdb mdl1.11
read pdb 1meeA.pdb 1mee
read pdb 1sbhA.pdb 1sbh
analyse energy *
winsize * 30
color * mdl1.3 green
color * mdl2.5 cyan
color * mdl1 blue
color * mdl1.11 red
shift * 18
shift mdl1 -18
plot
init zscore
combine type sdev
zscore * z-result


