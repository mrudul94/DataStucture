void quick(List<int> arr,int low,int high){
if (low< high) {
 int pi  = partition(arr, low, high);
 quick(arr, low, pi-1);
 quick(arr, pi+1, high);
}
}
int partition(List<int> arr , int low , int high){
  int pivot = arr[high];
  int i =(low-1);

  for (var j = low; j < high; j++) {
    if (arr[j]<=pivot) {
      i++;
      swap(arr, i, j);
    }
  }
  swap(arr, i+1, high);                 
  return i+1;
  
}
void swap(List<int> arr , int i , int j){
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
  
}
void main(){
  List<int> arr = [8,6,5,99,4,1,-98];
  quick(arr,0,arr.length-1);
  print(arr);
}
