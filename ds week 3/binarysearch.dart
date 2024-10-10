class Node{
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}


  Node insertion(Node? root,int value){
    if (root == null) {
      return Node(value);
    }
    if (value < root.value) {
      root.left = insertion(root.left, value);
    }
    else if(value > root.value){
      root.right = insertion(root.right, value);
    }
    return root;
  }
  void inOrder(Node? node){
     if (node != null) {
       inOrder(node.left);
       print(node.value);
       inOrder(node.right);
     }
  }
  void preOrder(Node? node){
    if (node != null) {
       print(node.value);
       preOrder(node.left);
       preOrder(node.right);
     }
  }
  void postOrder(Node? node){
    if (node != null) {
       
       postOrder(node.left);
       postOrder(node.right);
       print(node.value);
     }
  }
bool search(Node? node ,int num){
    if (node ==null ) {
      return false;
    }
   if(num == node.value){
      return true;
    }
    else if(num < node.value){
      return search(node.left, num);

    }
    else{
      return search(node.right, num);
    }
  }

void main(){
  Node? root = null;
  

  root = insertion(root, 10);
  root = insertion(root, 11);
  root = insertion(root, 8);
  root = insertion(root, 12);
  root = insertion(root, 7);
  root = insertion(root, 3);
  root = insertion(root, 15);

  print("In-order traversal:");
  inOrder(root);

  print("Pre-order traversal:");
  preOrder(root);

  print("Post-order traversal:");
  postOrder(root);
  print(search(root, 10));
}