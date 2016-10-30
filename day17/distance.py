"""
FOCS Graph library

This represents a graph

Author : Oliver Steele <oliver.steele@olin.edu>
Date   : 2016-10-27
License: MIT License
"""

from Queue import Queue


class Graph(object):
    """A minimal graph using adjacency lists.

    This implementation includes a utility function to retrieve the node with a given label.
    This makes sense iff nodes are objects with a `label` attribute.
    """

    def __init__(self, nodes=[], edges=[]):
        self.nodes = nodes
        self.adjacency_list = {n: [tail for (head, tail) in edges if head == n] for n in nodes}

    def find_node(self, label):
        """Find a node by its label."""
        return next((node for node in self.nodes if node.label == label), None)

    def successors(self, node):
        """Return a list of successors."""
        return self.adjacency_list[node]

    def predecessor(self, node):
        """Return a list of predecessors."""
        # shown for completeness. If this function is called often, this is the wrong data structure.
        return [head for head in self.nodes if node in self.successors(head)]


class Node(object):
    """A node of a graph. Instances print as their labels. This class can be used to construct nodes
    that can accomodate additional attributes."""

    def __init__(self, label, distance):
        self.label = label
        self.distance = distance

    def __repr__(self):
        return self.label
        return self.distance


def bfs(graph, start):
    remaining_nodes = Queue()
    visited = set()

    def visit(node):
        #print(node)
        visited.add(node)
        for tail in graph.successors(node):
            if tail not in visited:
                remaining_nodes.put(tail)

    remaining_nodes.put(start)
    while not remaining_nodes.empty():
        n = remaining_nodes.get()
        visit(n)


def bfs_distance(graph, start):
    remaining_nodes = Queue()
    visited = set()
    start.distance = 0

    def visit(node):
        #print(node)
        visited.add(node)
        for tail in graph.successors(node):
            if tail not in visited:
                tail.distance = node.distance + 1
                remaining_nodes.put(tail)

    remaining_nodes.put(start)
    while not remaining_nodes.empty():
        n = remaining_nodes.get()
        visit(n)

# node_labels = ['a', 'b', 'c', 'd', 'e']
# edge_labels = [('a', 'b'), ('a', 'c'), ('b', 'd'), ('b', 'e'), ('e', 'a')]

# g = Graph(*node_and_edge_labels_to_objects(node_labels, edge_labels))
#print(g.adjacency_list)
g = ([a, b, c, d, e], [(a, b), (a, c), (b, d), (b, e)])
bfs(g, g.find_node('a'))
spanningtree(g, g.find_node('a'))

print(bfs_distance(g, g.find_node('a')))
