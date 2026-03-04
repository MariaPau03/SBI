read pdb 1GUA_A.pdb 1gua_a
read pdb p11c.pdb p11c
init zscore
combine type sdev
zscore 1gua_a z-result
sorted_depth = 0
zscore p11c z-result