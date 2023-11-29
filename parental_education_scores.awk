#!/bin/awk -f

BEGIN {
    FS="\",\"";  # Set the field separator to ","
    OFS=",";      # Set the output field separator to ","
}

NR > 1 {
    # Increment the count and accumulate scores for each parental level of education
    count[$3]++;
    total[$3] += ($6 + $7 + $8)/3;
}

END {
    # Print header for the output
    print "Parental Level of Education, Average Test Score";

    # Iterate through the parental levels of education
    for (edu in count) {
        # Calculate the average test score for each level
        avg_score = total[edu] / count[edu];
        
        # Print the results
        print edu, avg_score;
        
    }

}
