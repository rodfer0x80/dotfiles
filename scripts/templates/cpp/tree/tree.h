#ifndef TREE_H
#define TREE_H

#include <cmath>
#include <algorithm>
using namespace std;

class Node {
public:
    int data;
    Node* left;
    Node* right; 
    Node(int d): data(d), left(nullptr), right(nullptr) {};
};

class Tree {
public:
    Node* root;
    
    Tree(): root(nullptr) {}
    
    void insert(int data) {
        root = insertRec(root, data);
    }
    
    int height(){
        return heightRec(root);
    }
    
private:
    Node* insertRec(Node* node, int data) {
        if (node == nullptr) {
            return new Node(data);
        }
        
        if (data <= node->data) {
            node->left = insertRec(node->left, data);
        } else {
            node->right = insertRec(node->right, data);
        }
        return node;
    }
    
    int heightRec(Node* node) {
        if (node == nullptr) {
            return -1;
        }
        return max(heightRec(node->left), heightRec(node->right)) + 1;
    }
};

#endif // TREE_H
