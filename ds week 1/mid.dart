class Node{
  int? data;
  Node?  next;
  
  Node(this.data);
}
class LinkedList{
  Node? head;

  void insertAtBeginning(int data){
    Node newNode = Node(data);
    newNode.next =head;
    head = newNode;
  }
  void insertAfter(Node prevNode, int data){
    // ignore: unnecessary_null_comparison
    if(prevNode==null){
      print("Previous node cannot be null.");
      return;
    }
    Node newNode = Node(data);
    newNode.next=prevNode.next;
    prevNode.next=newNode;
  }
  void insertAtEnd(int data){
    Node newNode = Node(data);
    if(head == null){
      head = newNode;
      return;
    }
    Node lastNode = head!;
    while (lastNode.next!=null) {
      lastNode = lastNode.next!;
    }
    lastNode.next = newNode;
  }
  Node? midinList(){
    
    Node? slow = head;
    Node? fast = head;

    while (fast !=null && fast.next!=null) {
      slow =slow!.next;
      fast =fast.next!.next;
    }
    return slow;
  }
  void printList(){
    if(head == null){
       print("The linked list is empty.");
    return;
    }
    Node? currentNode = head;
    while (currentNode !=null) {
      print(currentNode.data);
      currentNode= currentNode.next;
    }
  }
}
void main(){
  LinkedList linkedList = LinkedList();
  linkedList.insertAtBeginning(5);
  linkedList.insertAtBeginning(6);
  linkedList.insertAtBeginning(7);
  linkedList.insertAtBeginning(100);
  linkedList.insertAtEnd(55);
  linkedList.printList();
  Node? mid = linkedList.midinList();
  print('Mid: ${mid!.data}');
}