class Node<T> {
  T? value;
  Node<T>? next;
  Node(this.value);
}

class Stack<T> {
  Node<T>? _top;

  void push(T value) {
    var newnode = Node<T>(value);
    newnode.next = _top;
    _top = newnode;
  }
  T? pop(){
    if (_top == null) {
      print('error');
    }
    var value = _top!.value;
    _top =_top!.next;
    return value;

  }
  T? peek(){
    if (_top == null) {
      print('errror');
    }
    return _top!.value;
  }
  void display(){
    var current = _top;
    while (current!= null) {
      print(current.value);
      current = current.next;
    }
  }

  T? middle(){
    var slow = _top;
    var fast = _top;
    while (fast!=null && fast.next!=null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }
    return slow?.value;
  }
  void delete(T value){
   
    var current = _top;
    Node<T>? previous;

    while (current != null && current.value !=value) {
      previous = current;
      current = current.next;
    }
    
    previous!.next = current!.next;
  }

}
void main(){
  var stack = Stack<int>();
  stack.push(10);
  stack.push(20);
  stack.push(30);
  stack.push(40);
  stack.push(50);
  stack.display();
  stack.pop();
  print('\n');
  stack.display();
  print('\n');
  stack.peek();
  stack.display();
 print('mid = ${ stack.middle()}');
 stack.delete(10);
 stack.display();
}
