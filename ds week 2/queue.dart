class Queue<T> {
  List<T> _queue = [];

  void enqueue(T value) {
    _queue.add(value);
  }

  T dequeue() {
    if (_queue.isEmpty) {
      print('empty');
    }
    return _queue.removeAt(0);
  }

  T peek() {
    if (_queue.isEmpty) {
      print('empty');
    }
    return _queue.first;
  }

  void display() {
    for (var i = 0; i < _queue.length; i++) {
      print(_queue[i]);
    }
  }
}

void main() {
  var queue = Queue<int>();

  queue.enqueue(10);
  queue.enqueue(11);
  queue.enqueue(12);
  queue.enqueue(13);
  queue.enqueue(14);
  queue.display();
  print('-----------------------');
  queue.dequeue();
  queue.display();
  print('-----------------------');
  queue.peek();
  queue.display();
}
