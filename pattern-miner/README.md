Pattern Miner attempts to solve the problem of finding frequent patterns in the AtomSpace.
The algorithm mimics the typical algorithms of the subtree mininig literature.

terminology

- *Data tree*: a tree (or hypergraph) that is part of the database to be mined.
- *Database*: a collection of data trees. Atom space in our case or a `.metta` file that contains collection of patterns.
- *Pattern tree*: a tree representing a pattern.
- *Frequency*: number of data trees matching a given pattern divided by database size.
- *Support*: number of data trees matching a given pattern.
- *Minimum support*: parameter of the mining algorithm to discard patterns with support below that value.
- *A priori property*: 


**Algorithmic Description**

The pattern miner searches the space for patterns. 

Start searching for patterns trees, 
    
1. starting from the most abstract pattern, the one that encompasses all the data trees, 
    
2. construct specialiations of it

3. retain those that have enough support ... and recursively specialize those ... so on


Graph Concepts

A lebeled graph `G = (V, E, ⅀, L)` consists of a vertex set `V`, an edge set `E`, an alphabet `⅀` for vertex and edge labels and labeling function `L: V U E -> ⅀` that assigns labels to vertices and edges. 

- ***directed graph***: if each edge is an ordered pair of vertices.
- ***undirected graph***: if each edge is an unordered pair of vertices.
- ***path***: list of vertices of the graph such that each pair of neighbouring vertices in the list is an edge of the graph. Length of path is defined by the number of edges in the path
- ***cycle***: 