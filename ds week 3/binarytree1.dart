import 'DebthOfree.dart';

class Node {
  int? value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinaryTree {
  Node? root;
  void insert(int? value) {
    root = _insert(root, value!);
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

  void inOrder(Node? node) {
    if (node == null) return;
    inOrder(node.left);
    print(node.value);
    inOrder(node.right);
  }

  void preOrder(Node? node) {
    if (node == null) return;
    print(node.value);
    preOrder(node.left);
    preOrder(node.right);
  }

  void postOrder(Node? node) {
    if (node == null) return;
    postOrder(node.left);
    postOrder(node.right);
    print(node.value);
  }
  int maxdepth(Node? node){
  if (node == null) {
    return 0;
  }
  int leftdepth = maxdepth(node.left);
  int? rightdepth = maxdepth(node.right);


  return (leftdepth> rightdepth ? leftdepth : rightdepth)+1;
}
}

void main() {
  BinaryTree bt = BinaryTree();
  List<int> nums = [1, 2, 5, 6, 3, 9, 8, 4];
  for (var element in nums) {
    bt.insert(element);
  }

  print('inOrder');
  bt.inOrder(bt.root);

  print('postOrder');
  bt.postOrder(bt.root);
  
  print('preOrder');
  bt.preOrder(bt.root);
  print('hi${bt.maxdepth(bt.root)}');
}
