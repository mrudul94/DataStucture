class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinarySearchTree {
  TreeNode? root;

  void insert(int value) {
    root = _insertRecursively(root, value);
  }

  TreeNode _insertRecursively(TreeNode? node, int value) {
    if (node == null) return TreeNode(value);

    if (value < node.value) {
      node.left = _insertRecursively(node.left, value);
    } else {
      node.right = _insertRecursively(node.right, value);
    }
    return node;
  }

  bool contains(int value) {
    return _containsRecursively(root, value);
  }

  bool _containsRecursively(TreeNode? node, int value) {
    if (node == null) return false;
    if (value == node.value) return true;

    return value < node.value
        ? _containsRecursively(node.left, value)
        : _containsRecursively(node.right, value);
  }

  void delete(int value) {
    root = _deleteRecursively(root, value);
  }

  TreeNode? _deleteRecursively(TreeNode? node, int value) {
    if (node == null) return null;

    if (value < node.value) {
      node.left = _deleteRecursively(node.left, value);
    } else if (value > node.value) {
      node.right = _deleteRecursively(node.right, value);
    } else {
      // Node with one child or no child
      if (node.left == null) return node.right;
      if (node.right == null) return node.left;

      // Node with two children: Get the inorder successor (smallest in the right subtree)
      node.value = _minValue(node.right!);
      node.right = _deleteRecursively(node.right, node.value);
    }
    return node;
  }

  int _minValue(TreeNode node) {
    int minValue = node.value;
    while (node.left != null) {
      minValue = node.left!.value;
      node = node.left!;
    }
    return minValue;
  }

  void inorderTraversal() {
    _inorder(root);
  }

  void _inorder(TreeNode? node) {
    if (node != null) {
      _inorder(node.left);
      print(node.value);
      _inorder(node.right);
    }
  }

  void preorderTraversal() {
    _preorder(root);
  }

  void _preorder(TreeNode? node) {
    if (node != null) {
      print(node.value);
      _preorder(node.left);
      _preorder(node.right);
    }
  }

  void postorderTraversal() {
    _postorder(root);
  }

  void _postorder(TreeNode? node) {
    if (node != null) {
      _postorder(node.left);
      _postorder(node.right);
      print(node.value);
    }
  }
}

int findClosestValue(TreeNode? node, int target) {
  int closest = node!.value;
  while (node != null) {
    if ((target - closest).abs() > (target - node.value).abs()) {
      closest = node.value;
    }
    node = target < node.value ? node.left : node.right;
  }
  return closest;
}

bool isValidBST(TreeNode? node, [int? min, int? max]) {
  if (node == null) return true;

  if ((min != null && node.value <= min) || (max != null && node.value >= max)) {
    return false;
  }

  return isValidBST(node.left, min, node.value) && 
         isValidBST(node.right, node.value, max);
}

void main() {
  var bst = BinarySearchTree();
  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(2);
  bst.insert(5);
  bst.insert(13);
  bst.insert(22);
  bst.insert(1);

  print('Inorder Traversal:');
  bst.inorderTraversal(); // Expected output: 1 2 5 5 10 13 15 22

  print('Preorder Traversal:');
  bst.preorderTraversal(); // Expected output: 10 5 2 1 5 15 13 22

  print('Postorder Traversal:');
  bst.postorderTraversal(); // Expected output: 1 2 5 5 13 22 15 10

  print('Contains 15: ${bst.contains(15)}'); // Expected output: true
  print('Contains 100: ${bst.contains(100)}'); // Expected output: false

  print('Closest value to 12: ${findClosestValue(bst.root, 12)}'); // Expected output: 13

  print('Is valid BST: ${isValidBST(bst.root)}'); // Expected output: true
}
