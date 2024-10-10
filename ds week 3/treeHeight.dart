class node {
  int? value;
  node? left;
  node? right;

  node(this.value);
}
class binarytree {
  node? root;
int height(node? node){
  if (node == null) {
    return -1;
  
  }
  int leftheight = height(node.left);
  int rightheight = height(node.right);

  return 1 + (leftheight > rightheight ? leftheight : rightheight);
}
}
void main(){
  binarytree tree = binarytree();
  tree.root = node(1);
  tree.root?.left = node(5);
  tree.root?.right = node(5);
  tree.root?.left?.left = node(4);
  tree.root?.left?.right = node(5);
  tree.root?.right?.right = node(6);

  print('${tree.height(tree.root)}');
}