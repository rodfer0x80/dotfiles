#ifndef TREE_H
#define TREE_H

class Node {
public:
    int data;
    Node* left;
    Node* right; 
    Node(int d);
};

class Tree {
public:
    Node* root;
    
    Tree();
    void insert(int data);
    int height();
    
private:
    Node* insertRec(Node* node, int data);
    int heightRec(Node* node);
};

#endif // TREE_H
