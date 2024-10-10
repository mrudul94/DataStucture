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

  bool isBalanced() {
    return _isBalancedHelper(root).isBalanced;
  }

  _BalanceStatus _isBalancedHelper(Node? node) {
    if (node == null) {
      return _BalanceStatus(0, true);
    }

    var leftStatus = _isBalancedHelper(node.left);
    var rightStatus = _isBalancedHelper(node.right);

    int height = 1 + max(leftStatus.height, rightStatus.height);
    bool balanced = leftStatus.isBalanced &&
                     rightStatus.isBalanced &&
                     (leftStatus.height - rightStatus.height).abs() <= 1;

    return _BalanceStatus(height, balanced);
  }

  int max(int a, int b) => a > b ? a : b;
}

class _BalanceStatus {
  final int height;
  final bool isBalanced;

  _BalanceStatus(this.height, this.isBalanced);
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

  print('Is the tree balanced? ${bt.isBalanced()}');
}
