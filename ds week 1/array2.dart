void main(){
  List<int> array =[1,2,1,3,4,2,5];

  Set<int> unique = Set();
  

  for (var element in array) {
    if (!unique.add(element)) {
      
    }
  }
  print(unique);
}