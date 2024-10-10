class Node {
  int? value;
  Node? left;
  Node? right;

  Node(this.value);

}

class BST {
  Node? root;

  void insert(int value){
    root = _insert(root, value);
  }
  Node _insert(Node? node,int value){
    if (node == null) {
      return Node(value);
    }
    if (value<node.value!) {
      node.left = _insert(node.left, value);
    }
    else if(value > node.value!){
      node.right = _insert(node.right, value);

    }
    return node;
  }
  bool isPrime(int num){
    if(num<2)return false;
    for (var i = 2; i <= num/2; i++) {
      if (num %i == 0) {
        return false;
      }
    }
    return true;
  }

  void printprime(){
  _printprime(root);
  }
  void _printprime(Node? node){
    if(node == null)return;
    _printprime(node.left);
    if (isPrime(node.value!)) {
      print(node.value);
    }
    _printprime(node.right);
  }
}
void main(){
  BST bst = BST();
  List<int> nums = [1,2,3,6,5,4,7,8,9];
  for (var element in nums) {
    bst.insert(element);
  }
  bst.printprime();
}