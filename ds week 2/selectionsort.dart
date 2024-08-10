void main(){
  List<int> arr = [8,6,5,99,4,1,-98];
  selection(arr);
  print(arr);
}
void selection(List<int> arr){
  for (var i = 0; i < arr.length-1; i++) {
    int min = i;
    for (var j = i+1; j < arr.length; j++) {
      if (arr[j]<arr[min]) {
        min=j;
      }

    }
    int temp = arr[min];
    arr[min] = arr[i];
    arr[i] =temp;
  }
}