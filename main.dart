class Node {
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  // Function to insert a new node at the beginning of the list
  void insertAtBeginning(int data) {
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  // Function to insert a new node after a given node
  void insertAfter(Node? prevNode, int data) {
    if (prevNode == null) {
      print("Previous node cannot be null.");
      return;
    }
    Node newNode = Node(data);
    newNode.next = prevNode.next;
    prevNode.next = newNode;
  }

  // Function to insert a new node at the end of the list
  void insertAtEnd(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      return;
    }
    Node lastNode = head!;
    while (lastNode.next != null) {
      lastNode = lastNode.next!;
    }
    lastNode.next = newNode;
  }

  // Function to print the linked list
  void printList() {
  if (head == null) {
    print("The linked list is empty.");
    return;
  }
  Node? currentNode = head;
  while (currentNode != null) {
    print(currentNode.data);
    currentNode = currentNode.next;
  }
}

}

void main() {
  LinkedList linkedList = LinkedList();

  // Inserting elements into the linked list
  linkedList.insertAtEnd(1);
  linkedList.insertAtBeginning(2);
  linkedList.insertAtBeginning(3);
  linkedList.insertAtEnd(4);

  // Printing the linked list
  linkedList.printList();
}
