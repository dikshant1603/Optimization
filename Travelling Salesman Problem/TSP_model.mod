reset;

set nodes;
set arcs within nodes cross nodes;
param Dist{arcs};
var X{arcs} binary>=0;
var U {i in 2..card(nodes)} >= 2,<=card(nodes);
minimize total_distance:
 sum{i in nodes, j in nodes} Dist[i,j]*X[i,j];

subject to one_outgoing{k in nodes}:
	sum{i in nodes} X[i,k]= 1;

subject to one_incoming{k in nodes}:
 	sum{j in nodes} X[k,j] = 1;

subject to no_subtour{k in nodes, j in nodes: j > 1 and k > 1}:
 	U[j] - U[k] + card(nodes)*X[j,k] <= card(nodes) - 1;
 
subject to number_ofEdges: 
 	sum{(i,j) in arcs}X[i,j] <=card(nodes);


 
 
 
 
 
 
 