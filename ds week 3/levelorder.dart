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

  void levelOrderTraversal() {
    if (root == null) return;

    Queue<Node> queue = Queue<Node>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node current = queue.removeFirst();
      print(current.value);

      if (current.left != null) {
        queue.add(current.left!);
      }
      if (current.right != null) {
        queue.add(current.right!);
      }
    }
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

  print('Level Order Traversal:');
  bt.levelOrderTraversal();
}

