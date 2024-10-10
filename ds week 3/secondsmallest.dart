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

  int? findSecondSmallest() {
    List<int> result = [];
    _inOrderTraversal(root, result);
    return result.length > 1 ? result[1] : null;
  }

  void _inOrderTraversal(Node? node, List<int> result) {
    if (node == null) return;
    
    _inOrderTraversal(node.left, result);
    result.add(node.value);
    if (result.length > 2) return; // No need to traverse more once we have two elements
    _inOrderTraversal(node.right, result);
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(20);
  bst.insert(8);
  bst.insert(22);
  bst.insert(4);
  bst.insert(12);
  bst.insert(5);

  int? secondSmallest = bst.findSecondSmallest();
  print('The second smallest element is: $secondSmallest');
}
