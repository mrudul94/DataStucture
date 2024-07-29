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
    bool search(int data){
      Node? temp = head;

      while (temp!=null) {
        if (temp.data == data) {
          return true;
        }
        temp = temp.next;
      }
      return false;

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
    int length(){
      Node? temp =head;
      int count = 0;
      while (temp !=null) {
        count++;
        temp=temp.next;
      }
      return count;
    }

    List<LinkedList> split(){
      LinkedList firstHalf = LinkedList();
      LinkedList secondHalf = LinkedList();

      Node? Slow = head;
      Node? Fast = head;
      Node? perslow;

      while (Fast != null && Fast.next !=null) {
        perslow = Slow;
        Slow = Slow!.next;
        Fast = Fast.next!.next;
      }
      if (perslow !=null) {
        perslow.next = null;
      }
      firstHalf.head = head;
      secondHalf.head = Slow;
      return[firstHalf,secondHalf];
    }

    int midvalue(){
      Node?  slow = head;
      Node? fast = head;

      while (fast!=null&&fast.next!=null) {
        slow = slow!.next;
        fast = fast.next!.next;
      }
      return slow!.data;
    }

}

void main() {
  LinkedList linkedList = LinkedList();

  // Inserting elements into the linked list
  linkedList.insertAtBeginning(1);
  linkedList.insertAtBeginning(5);
  linkedList.insertAtBeginning(6);
  linkedList.insertAtBeginning(2);
  linkedList.insertAtBeginning(7);
  linkedList.insertAtBeginning(3);
  linkedList.insertAtEnd(4);


  linkedList.printList();
  int fisrvalue = 5;
  int secvalue = 8;

  print('1st value: ${linkedList.search(fisrvalue)}');
  print('1st value: ${linkedList.search(secvalue)}');
  print('----${linkedList.length()}');
  List<LinkedList> splitlist = linkedList.split();
  print('first');
  splitlist[0].printList();
  print('second');
  splitlist[1].printList();

  int midvalue = linkedList.midvalue();

  print('mid = ${midvalue}');
}
