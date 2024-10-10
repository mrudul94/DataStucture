import 'dart:collection';

class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  void insert(int value) {
    root = _insertHelper(root, value);
  }

  Node _insertHelper(Node? node, int value) {
    if (node == null) {
      return Node(value);
    }

    if (value < node.value) {
      node.left = _insertHelper(node.left, value);
    } else {
      node.right = _insertHelper(node.right, value);
    }

    return node;
  }

  bool isComplete() {
    if (root == null) return true;

    Queue<Node?> queue = Queue<Node?>();
    queue.add(root);

    bool end = false;

    while (queue.isNotEmpty) {
      Node? current = queue.removeFirst();

      if (current == null) {
        end = true;
      } else {
        if (end) {
          return false;
        }
        queue.add(current.left);
        queue.add(current.right);
      }
    }

    return true;
  }
}

void main() {
  BinaryTree bt = BinaryTree();
  bt.insert(20);
  bt.insert(8);
  bt.insert(22);
  bt.insert(4);
  bt.insert(12);
  bt.insert(10);
  bt.insert(14);

  print('Is the tree a complete binary tree? ${bt.isComplete()}');
}
