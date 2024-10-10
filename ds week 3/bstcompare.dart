class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

bool areIdentical(TreeNode? tree1, TreeNode? tree2) {
  // Base case: If both trees are null, they are identical
  if (tree1 == null && tree2 == null) return true;

  // If one of the trees is null but the other is not, they are not identical
  if (tree1 == null || tree2 == null) return false;

  // Check if the current nodes have the same value and the left and right subtrees are identical
  return (tree1.value == tree2.value) &&
      areIdentical(tree1.left, tree2.left) &&
      areIdentical(tree1.right, tree2.right);
}

void main() {
  // Creating two sample trees
  TreeNode tree1 = TreeNode(5);
  tree1.left = TreeNode(3);
  tree1.right = TreeNode(7);
  
  TreeNode tree2 = TreeNode(5);
  tree2.left = TreeNode(3);
  tree2.right = TreeNode(7);
  
  bool result = areIdentical(tree1, tree2);
  print(result ? 'Trees are identical' : 'Trees are not identical');
}
