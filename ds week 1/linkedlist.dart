class Node{
  int? data;
  Node? next;

  Node(this.data,[this.next]);
}

class LinkedList {
  Node? head;
  Node? tail;

  void first(int data){
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
    if (tail == null) {
      tail = head;
    } 
  }

  void second (int data,int index){
    if (index == 0) {
      first(data);
       return;
    }
    Node? temp = head;
    for (var i = 1; i < index; i++) {
      if (temp!.next == null) break;
        
      
      temp = temp.next;
    }
    Node newNode = Node(data);
    newNode.next = temp!.next;
    temp.next = newNode;
    if (newNode.next == null) {
      tail =newNode;
    }
  }

  void last(int data){
    
    Node newnode = Node(data);
    if (tail!=null) {
      tail!.next = newnode;
    }
    else{
      head = tail = newnode;
    }
  }

  bool search(int value){
    Node? temp = head;
    while (temp!=null) {
      if (temp.data == value) {
        return true;
      }
      temp = temp.next;
    }
    return false;
  }

  int length(){
    Node? temp =head;
    int count=0;
    while (temp!=null) {
      count++;
      temp=temp.next;
    }
    return count;
  }

  void display(){
    Node? temp = head;
    while (temp!=null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}

void main(){
  LinkedList linkedList = LinkedList();
  linkedList.first(11);
  linkedList.first(25);
  linkedList.first(96);
  linkedList.first(63);
  linkedList.first(178);
  linkedList.first(35);
  linkedList.first(159);
  linkedList.second(56, 5);
  linkedList.second(26, 2);
  linkedList.second(6, 1);
  linkedList.last(895);
  int ser = 63;
  print('search valu = ${linkedList.search(ser)}');
  print('length=  ${linkedList.length()}');

  linkedList.display();


}