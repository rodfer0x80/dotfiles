#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "tree.cpp"
#include <doctest.h>

TEST_CASE("Tree Height Tests") {
    Tree tree;

    CHECK(tree.height() == -1);

    tree.insert(1);
    CHECK(tree.height() == 0);

    tree.insert(2);
    CHECK(tree.height() == 1); 

    tree.insert(3);
    tree.insert(4);
    tree.insert(2);
    CHECK(tree.height() == 3); 

    Tree tree2;
    tree2.insert(10);
    tree2.insert(5);
    tree2.insert(15);
    tree2.insert(3);
    tree2.insert(7);
    CHECK(tree2.height() == 2); 

    Tree tree3;
    tree3.insert(5);
    tree3.insert(4);
    tree3.insert(3);
    tree3.insert(2);
    CHECK(tree3.height() == 3);

    Tree tree4;
    tree4.insert(1);
    tree4.insert(2);
    tree4.insert(3);
    tree4.insert(4);
    CHECK(tree4.height() == 3); 
}

TEST_CASE("Tree Insertion Tests") {
    Tree tree;

    tree.insert(5);
    tree.insert(3);
    tree.insert(7);
    tree.insert(1);
    tree.insert(4);
    CHECK(tree.height() == 2); 

    tree.insert(3);
    tree.insert(5); 
    CHECK(tree.height() == 3);
}

