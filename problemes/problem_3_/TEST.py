input_file = "p3b.aln"
output_file = "p3b_annotated.aln"

# Biological indices (based on your aa[69] check)
# We will use these as "absolute" positions in the sequence
target_indices = [69, 72, 145, 196, 248, 270]

with open(input_file, "r") as f:
    lines = f.readlines()

annotated_lines = []
global_idx = 0  # This tracks our current position in the total sequence

for line in lines:
    annotated_lines.append(line)
    
    # We only care about lines starting with the sequence name
    if line.startswith("8cpa_A"):
        parts = line.split()
        sequence = parts[1]
        
        # Calculate indentation to match the sequence column exactly
        indent = line.find(sequence)
        
        # Create a list of spaces the length of this specific block
        func_markers = list(" " * len(sequence))
        
        # Check every character in THIS block
        for local_pos in range(len(sequence)):
            # If the current global position is one of our targets
            if global_idx in target_indices:
                func_markers[local_pos] = "@"
            
            # Increment global_idx, but only if it's not a gap/pad 
            # (Remove the 'if' below if your indices include gaps)
            global_idx += 1 

        # Construct the annotation line
        # "#=GC Func" is 9 chars, so we pad the rest with spaces to reach 'indent'
        prefix = "#=GC Func"
        padding = " " * (indent - len(prefix))
        annotated_lines.append(prefix + padding + "".join(func_markers) + "\n")

with open(output_file, "w") as f:
    f.writelines(annotated_lines)

print(f"File saved as {output_file}. Global residues marked: {target_indices}")