Course Site: https://www.linkedin.com/learning/social-network-analysis-using-r/write-out-a-graph?u=35146660

#1. Load the package from R GUI. pakage: 
#install.packages("igraph")
#install.packages("sna")
library(igraph)
library(sna)

2. setting graph
graph1 = graph_from_data_frame(data, directed = FALSE, vertices = NULL)
plot(graph)

###Make different types of networks
#make_full_graph
g = make_full_graph(number of items, directed = TRUE/False, loops = TRUE/FASLE)

#Make ring graph
g = make_ring(number of items, directed = TRUE/False, circular = TRUE/FASLE)

#Star shape
g = make_full(number of items, center = )

#Randomly set the graph: gnp
sample_gnp(number of items, prob. of link(eg. 0.3), loop = TRUE/FALSE)

#gnm
sample_gnm(number of items, number of address, loop = TRUE/FALSE)
#number of address will determnine the spase level of the network

#Give the weigh to the network model
sample_pa(number of items, power = 1)
#Power will tell the network the weigh of the direction


#Part2
sample_pa(number of items, power =1(same weith between connections), direction )
degree()
betweenness() >>check various betweenness score of vertex
>interpret: Also focus first and the center and check other point will fit in with it by the dregree of betweenness.

#How the connection interconnected with other
ed = edge_density(sample_pa, loops = FALSE)
ed
**if you use sample_pa to create newtworks graph you will always get the different grapg as you previously did
**It also means that you will get the different value of ed_density value
sample_gnp(number of items, prob. of link(eg. 0.3), loop = TRUE/FALSE)

edge_density(sample_pa_loops = FALSE)
#The value you get by using sample_gnp. it wil be the prob. you set in the argument of edge_density


###clique
#The basic idea of the vertices connection
clique_num(graph)
cliques(graph, min = 3)
clique_num(graph, max = 3)
clique_num(grapgh, min, max)
#The higher the prob. you set in the graph function, the more dense the connections you will get.


###The scenario: not all vertix can connect to other 
components(graph)
#See who are in group of others and how large the group (componenet) it is
#We can see how frequent any two or more guys ccontact each othe in the email analysis

###Random walk #See how the path looks like by going through the vertices
#Know how information are transported
random_walk(grapgh, 26, 8, stuck = "return")
#random_walk(grapgh name, central point, the steps of the route, when facing stuck)


###Visualisation
#Plot the graph
plot(graph)

#Control the colours
%>% is used to continue typing your coding

grapgh = sample_gnp(30, 0.08) %>%
set_vertex_attr("color", value = green)>%>
set_edge_attr("cplor", value = blue)

plot(grapgh)


#Write the graph
write.grapgh(grapgh, "file route", format = "edgelist")

#save the graph as pdf file
pdf("grapgh")
plot(grapgh)
dev.off()

#Further resources
#<Watch up and Running with R---Barton Poulson>
#<Read Scoial Network Analysis by John Scott>
