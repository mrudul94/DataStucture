class Stack<T> {
  List<T> stack = [];
  void push(T value) {
    stack.add(value);
  }

  T pop() {
    if (stack.isEmpty) {
      print('errro');
    }
    return stack.removeLast();
  }

  T peek() {
    if (stack.isEmpty) {
      print('error');
    }
    return stack.last;
  }

  void display() {
    for (var i = stack.length - 1; i >= 0; i--) {
      print(stack[i]);
    }
  }
}

void main() {
  var stack = Stack<int>();

  stack.push(10);
  stack.push(107);
  stack.push(110);
  stack.push(102);
  stack.push(1020);
  stack.push(120);

  stack.display();

  print('\n');

  stack.pop();
  stack.display();
  print('\n');
  stack.display();
  stack.peek();
}
