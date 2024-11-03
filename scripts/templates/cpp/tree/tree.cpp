using namespace std
#include "tree.h"
#include <algorithm>

Node::Node(int d): data(d), left(nullptr), right(nullptr) {}

Tree::Tree(): root(nullptr) {}

void Tree::insert(int data) {
    root = insertRec(root, data);
}

int Tree::height() {
    return heightRec(root);
}

Node* Tree::insertRec(Node* node, int data) {
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

int Tree::heightRec(Node* node) {
    if (node == nullptr) {
        return -1;
    }
    return max(heightRec(node->left), heightRec(node->right)) + 1;
}
