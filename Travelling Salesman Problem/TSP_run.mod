model TSP_model.mod;
data TSP_data.mod;
# Solve
option solver cplex;
solve;

# Display solution
printf "X :=";
printf "\n";
printf "     ";
for {j in nodes} printf "%5d", j;
printf "\n";
for {i in nodes}{
    printf "%5d", i;
    for {j in nodes}{
        printf "%5g", X[i,j];
    }
    printf "\n";
}
display U,total_distance;


