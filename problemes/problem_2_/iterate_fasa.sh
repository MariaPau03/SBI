for file in 1gri_A.fa 1fyr_D.fa 1bmb_A.fa; do
    echo "--- Opening $file ---"
    total_chars=0  # Reset the counter for each new file

    while read -r line; do
        # Count characters in the current line
        # We use echo -n to avoid counting the newline character at the end
        count=$(echo -n "$line" | wc -m)
        
        # Add the count to our total
        (( total_chars += count ))

    done < "$file"
    
    echo "Final character count for $file: $total_chars"
    echo "------------------------"
done
