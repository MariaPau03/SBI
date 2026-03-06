awk '
BEGIN { split("A D C", chains); c=1 }
/^ATOM/ || /^HETATM/ {
    # Replace character at position 22 (index 22 in 1-based)
    line = $0;
    if (length(line) < 22) line = sprintf("%-22s", line);
    $0 = substr(line, 1, 21) chains[c] substr(line, 23);
    print $0;
    next
}
/^TER/ || /^ENDMDL/ {
    print $0;
    c++; # Move to next chain letter
    next
}
{ print $0 }
' p9c_domain2.pdb > p9c_domain2_with_chains.pdb
