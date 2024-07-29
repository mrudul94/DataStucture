void bubbleSort(List<int> arr){
  for (var i = 0; i < arr.length; i++) {
    for (var j = 1; j < arr.length-i ; j++) {
      if (arr[j]<arr[j-1]) {
        int temp = arr[j];
        arr[j] = arr[j-1];
        arr[j-1] = temp;
      }
    }
    
  }
  print(arr);
}
void main(){
  List<int> arr =[5,9,2,1,7,6];
  bubbleSort(arr);
    
}