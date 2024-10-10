class Node {
  int? value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BST {
  Node? root;

  void insert(int value) {
    root = _insert(root, value);
  }

  Node? _insert(Node? node, int value) {
    if (node == null) {
      return Node(value);
    }
    if (value < node.value!) {
      node.left = _insert(node.left, value);
    } else {
      node.right = _insert(node.right, value);
    }
    return node;
  }

  bool isContains(Node? node, int value) {
    if (node == null) {
      return false;
    }
    if (value == node.value) {
      return true;
    } else if (value < node.value!) {
      return isContains(node.left, value);
    } else {
      return isContains(node.right, value);
    }
  }

  int minvalue(Node? node) {
    while (node!.left != null) {
      node = node.left;
    }
    return node.value!;
  }

  int maxvalue(Node? node) {
    while (node!.right != null) {
      node = node.right;
    }
    return node.value!;
  }

  bool isValidBST(Node? node, int? min, int? max) {
    if (node == null) return true;

    if ((min != null && node.value! <= min) ||
        (max != null && node.value! >= max)) {
      return false;
    }

    return isValidBST(node.left, min, node.value) &&
        isValidBST(node.right, node.value, max);
  }

  void inOrder(Node? node) {
    if (node != null) {
      inOrder(node.left);
      print(node.value);
      inOrder(node.right);
    }
  }
}

void main() {
  BST tree = BST();
  List<int> nums = [1, 2, 5, 9, 6, 3, 4, 75];
  for (var element in nums) {
    tree.insert(element);
  }
  tree.inOrder(tree.root);
  print('${tree.isContains(tree.root, 75)}');

  print('\n');

  print('${tree.maxvalue(tree.root)}');
  print('\n');
  print('${tree.minvalue(tree.root)}');
}
