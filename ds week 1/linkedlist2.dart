class Node {
  int? value;
  Node? next;

  Node(this.value, [this.next]);
}

class LinkedList {
  Node? head;
  Node? tail;

  void insertFirst(int data) {
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
    if (tail == null) {
      tail = head;
    }
  }

  void insertLast(int data) {
    Node node = Node(data);
    if (tail != null) {
      tail?.next = node;
    } else {
      head = node;
    }
    tail = node;
  }

  void insert(int value, int index) {
   

    Node? temp = head;

    // Traverse to the node just before the insertion point
    for (var i = 1; i < index ; i++) {
      temp = temp!.next;
    }

  
    Node node = Node(value);
    node.next = temp!.next;
    temp.next = node;
    tail = node;
    
   
  }

  void display() {
    Node? temp = head;

    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}

void main() {
  LinkedList linkedList = LinkedList();
  linkedList.insertFirst(10);
  linkedList.insertFirst(11);
  linkedList.insertFirst(12);
  linkedList.insertFirst(13);
  linkedList.insertFirst(14);
  linkedList.insertLast(15);
  linkedList.insert(5, 3);
  linkedList.insert(20, 6);
  linkedList.display();
}
