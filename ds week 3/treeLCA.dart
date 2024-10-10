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

  Node? findLCA(int n1, int n2) {
    return _findLCAHelper(root, n1, n2);
  }

  Node? _findLCAHelper(Node? node, int n1, int n2) {
    if (node == null) {
      return null;
    }

    // If either n1 or n2 matches the node's value, return the node
    if (node.value == n1 || node.value == n2) {
      return node;
    }

    // Look for LCA in the left and right subtrees
    Node? leftLCA = _findLCAHelper(node.left, n1, n2);
    Node? rightLCA = _findLCAHelper(node.right, n1, n2);

    // If both left and right subtrees return non-null, this node is the LCA
    if (leftLCA != null && rightLCA != null) {
      return node;
    }

    // Otherwise return the non-null child
    return leftLCA ?? rightLCA;
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

  int n1 = 10;
  int n2 = 14;
  Node? lca = bt.findLCA(n1, n2);

  if (lca != null) {
    print('The LCA of $n1 and $n2 is ${lca.value}');
  } else {
    print('LCA not found.');
  }
}
