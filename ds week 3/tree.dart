class Node {
  int? value;
  Node? left;
  Node? right;

  Node(this.value, [this.left, this.right]);
}

class BinaryTree {
  Node? root;
  int index = -1;
  BinaryTree();

  void inorder(Node? node) {
    if (node != null) {
      inorder(node.left);
      print(node.value);
      inorder(node.right);
    }
  }

  Node? build(List<int> nodes) {
    index++;
    if (index >= nodes.length || nodes[index] == -1) {
      return null;
    }
    Node node = Node(nodes[index]);
    node.left = build(nodes);
    node.right = build(nodes);
    return node;
  }

  // Function to delete duplicates
  Node? deleteDuplicates(Node? node, Set<int> seenValues) {
    if (node == null) {
      return null;
    }
    // If the value is already seen, return null to delete the node
    if (seenValues.contains(node.value)) {
      return null;
    }
    // Add the value to the seen set
    seenValues.add(node.value!);

    // Recurse for the left and right children
    node.left = deleteDuplicates(node.left, seenValues);
    node.right = deleteDuplicates(node.right, seenValues);

    return node;
  }
}

void main() {
  List<int> nodes = [1, 2, 4, -1, -1, 5, -1, -1, 3, 2, 6, -1, -1];

  BinaryTree tree = BinaryTree();
  tree.root = tree.build(nodes);
  print('Inorder Traversal before deleting duplicates');
  tree.inorder(tree.root);

  // Delete duplicates
  tree.root = tree.deleteDuplicates(tree.root, <int>{});

  print('Inorder Traversal after deleting duplicates');
  tree.inorder(tree.root);
}
