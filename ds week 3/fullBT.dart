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

  bool isFullBinaryTree() {
    return _isFullBinaryTreeHelper(root);
  }

  bool _isFullBinaryTreeHelper(Node? node) {
    if (node == null) {
      return true; // An empty tree is considered a full binary tree
    }

    // Check if node is a leaf
    if (node.left == null && node.right == null) {
      return true;
    }

    // Check if node has two children
    if (node.left != null && node.right != null) {
      return _isFullBinaryTreeHelper(node.left) && _isFullBinaryTreeHelper(node.right);
    }

    // If node has only one child
    return false;
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

  print('Is the tree a full binary tree? ${bt.isFullBinaryTree()}');
}
