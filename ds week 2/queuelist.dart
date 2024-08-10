class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data, [this.next]);
}
class LinkedListQueue<T> {
  Node<T>? front;
  Node<T>? rear;

  // Enqueue operation
  void enqueue(T data) {
    var newNode = Node<T>(data);
    if (rear == null) {
      front = rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  // Dequeue operation
  T? dequeue() {
    if (front == null) {
      return null; // Queue is empty
    }
    T? data = front!.data;
    front = front!.next;
    if (front == null) {
      rear = null;
    }
    return data;
  }

  // Check if queue is empty
  bool get isEmpty => front == null;

  // Peek at the front element
  T? peek() {
    return front?.data;
  }
}
void main() {
  LinkedListQueue<int> queue = LinkedListQueue<int>();

  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);

  print(queue.dequeue()); // 1
  print(queue.peek());    // 2
  print(queue.isEmpty);  // false

  queue.enqueue(4);
  print(queue.dequeue()); // 2
  print(queue.dequeue()); // 3
  print(queue.dequeue()); // 4
  print(queue.isEmpty);  // true
}
