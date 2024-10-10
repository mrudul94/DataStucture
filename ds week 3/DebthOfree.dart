// class TreeNode {
//   int value;
//   TreeNode? left;
//   TreeNode? right;

//   TreeNode(this.value);
// }

// int maxDepth(TreeNode? node) {
//   if (node == null) {
//     return 0;
//   } else {
//     // Recursively find the depth of each subtree
//     int leftDepth = maxDepth(node.left);
//     int rightDepth = maxDepth(node.right);

//     // The maximum depth of the tree is the larger depth between the left and right subtree, plus one for the root
//     return (leftDepth > rightDepth ? leftDepth : rightDepth) + 1;
//   }
// }

// void main() {
//   // Example Binary Tree
//   TreeNode root = TreeNode(1);
//   root.left = TreeNode(2);
//   root.right = TreeNode(3);
//   root.left!.left = TreeNode(4);
//   root.left!.right = TreeNode(5);
//   root.left!.left!.left = TreeNode(6);
  
//   print("Maximum Depth of the Binary Tree: ${maxDepth(root)}");
// }
class node{
  int? value;
  node? left;
  node? right;

  node(this.value);
}
int maxdepth(node? node){
  if (node == null) {
    return 0;
  }
  int leftdepth = maxdepth(node.left);
  int? rightdepth = maxdepth(node.right);


  return (leftdepth> rightdepth ? leftdepth : rightdepth)+1;
}
void main(){
  node root = node(1);
  root.left = node(10);
  root.right = node(5);
  root.left!.left = node(14);
  root.left!.right = node(66);
  print(maxdepth(root));
}