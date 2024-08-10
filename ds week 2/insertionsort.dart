void insertionsort(List<int> arr){
  for (var i = 1; i < arr.length; i++) {
    int key = arr[i];
    int  j = i-1;

    while (j>=0 && arr[j]>key) {
      arr[j+1]=arr[j];
      j = j-1;
    }
    arr[j+1] =key;
  }
}
void main(){
  List<int> arr = [1,8,6,5,4,7,-5];
  insertionsort(arr);
  print(arr);
}
