# Save this as annotate_aln.py
input_file = "p3b.aln"
output_file = "p3b_annotated.aln"

# Define your indices (0-indexed based on the sequence string)
# 69=h, 72=e, 145=R, 196=H, 248=Y, 270=E
important_indices = [69, 72, 145, 196, 248, 270]

with open(input_file, "r") as f:
    lines = f.readlines()

annotated_lines = []
for line in lines:
    annotated_lines.append(line)
    
    # Check if the line starts with our sequence name
    if line.startswith("8cpa_A"):
        parts = line.split()
        if len(parts) < 2: continue
        
        name = parts[0]
        sequence = parts[1]
        
        # Create a matching @ line
        # We find where the sequence starts in the original line to match indentation
        indent = line.find(sequence)
        func_markers = list(" " * len(sequence))
        
        # We need a way to track global index if the file is split into blocks
        # This script assumes you are matching the string indices to the visible characters
        # If the file is split, we manually check which indices fall into this block
        
        # For simplicity, if this is the FIRST block (contains index 69):
        if "yhtlde" in sequence: # Block 1
            for idx in [69, 72, 145, 196]:
                # We need to calculate the local index within this specific block
                # This is easiest done by string matching the landmark
                if idx == 69: pos = sequence.find("h")
                if idx == 72: pos = sequence.find("e")
                if idx == 145: pos = sequence.find("R")
                if idx == 196: pos = sequence.rfind("H") # last H in block 1
                if pos != -1: func_markers[pos] = "@"
        
        # If this is the SECOND block (contains index 248):
        if "GTSY" in sequence: # Block 2
            for idx in [248, 270]:
                if idx == 248: pos = sequence.find("Y")
                if idx == 270: pos = sequence.find("E")
                if pos != -1: func_markers[pos] = "@"

        annotated_lines.append("#=GC Func" + " " * (indent - 9) + "".join(func_markers) + "\n")

with open(output_file, "w") as f:
    f.writelines(annotated_lines)

print(f"File saved as {output_file}")