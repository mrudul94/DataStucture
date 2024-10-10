class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinarySearchTree {
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

  int? findKthSmallest(int k) {
    List<int> result = [];
    _inOrderTraversal(root, result, k);
    return result.length >= k ? result[k - 1] : null;
  }

  void _inOrderTraversal(Node? node, List<int> result, int k) {
    if (node == null || result.length >= k) return;

    _inOrderTraversal(node.left, result, k);
    result.add(node.value);
    if (result.length >= k) return;  // Stop early if we've found the K-th element
    _inOrderTraversal(node.right, result, k);
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(20);
  bst.insert(8);
  bst.insert(22);
  bst.insert(4);
  bst.insert(12);
  bst.insert(10);
  bst.insert(14);

  int k = 3; // Find the 3rd smallest element
  int? kthSmallest = bst.findKthSmallest(k);
  print('The $k-th smallest element is: $kthSmallest');
}
