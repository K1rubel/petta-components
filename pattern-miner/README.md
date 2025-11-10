Pattern Miner attempts to solve the problem of finding frequent patterns in the AtomSpace.
The algorithm mimics the typical algorithms of the subtree mininig literature.

terminology

[x] *Data tree*: a tree (or hypergraph) that is part of the database to be mined.

[x] *Database*: a collection of data trees. Atom space in our case or a `.metta` file that contains collection of patterns.

[x] *Pattern tree*: a tree representing a pattern.

[x] *Frequency*: number of data trees matching a given pattern divided by database size.

[x] *Support*: number of data trees matching a given pattern.

[x] *Minimum support*: parameter of the mining algorithm to discard patterns with support below that value.

[x] *A priori property*: 


**Algorithmic Description**

The pattern miner searches the space for patterns. 

Start searching for patterns trees, 
    
    starting from the most abstract pattern, the one that encompasses all the data trees, 
    
    construct specialiations of it

    retain those that have enough support ... and recursively specialize those ... so on