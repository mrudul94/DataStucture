class Node {
  int? value;
  Node? left;
  Node? right;

  Node(this.value);
}
class BinaryTree {
  Node? root;

  void insert(int? value){
    root = _insert(root, value!);
  }
  Node? _insert(Node? node,int value){
    if (node == null) {
      return Node(value);
    }
    if (value < node.value!) {
      node.left = _insert(node.left, value);

    }
    else{
      node.right = _insert(node.right, value);
    }
    return node;
  }

  bool isContains(int value){
   return _contains(root, value);
  }

  bool _contains(Node? node, int value){
    if (node == null) {
      return false;
    }
    if (value == node.value) {
      return true;
    }
    else if(value < node.value!){
      return _contains(node.left, value);

    }
    else{
      return _contains(node.right, value);
    }
  }

}
void main(){
  BinaryTree tree = BinaryTree();
  List<int> nums = [1,2,2,5,8,8,9,5];

  for (var element in nums) {
    tree.insert(element);
  }

  print('${tree.isContains(2)}');
}