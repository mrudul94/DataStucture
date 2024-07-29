class Node {
  int? data;
  Node? next;

Node(this.data,[this.next]);
}

class LinkedList {
  Node? head;
  Node? tail;

  void first(int data){
    Node newnode = Node(data);
    newnode.next = head;
    head = newnode;
    if (tail == null) {
      tail = head;
    }
  }
  void last(int data){
    Node newnode = Node(data);
    if (tail!=null) {
      tail!.next = newnode;
    }else{
      tail = head = newnode;
    }

  }
  void btw(int data , int index){
    Node? temp = head;
    for (var i = 0; i < index; i++) {
      temp = temp!.next;
    }
    Node newnode = Node(data);
    newnode.next =  temp!.next;
    temp.next = newnode;
    if (newnode.next ==null) {
      tail = newnode;
    }
  }
  void display(){
    Node? temp = head;
    while (temp!=null) {
      print(temp.data);
      temp =temp.next;
    }
  }
}
void main(){
  LinkedList linkedList= LinkedList();
  linkedList.first(10);
  linkedList.first(56);
  linkedList.first(85);
  linkedList.last(100);
  linkedList.btw(564, 2);
  linkedList.display();
}