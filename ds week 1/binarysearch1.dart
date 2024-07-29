int binary( List<int> arr ,int target){
 int start = 0;
 int end = arr.length-1;

  while (start<=end) {
    int mid = (start+end)~/2;
    if (target<arr[mid]) {
      end = mid-1;
    }
    else if(target>arr[mid]){
      start = mid+1;
    }
    else{
      return mid;
    }
   
  }
 return -1;

}
void main(){
  List<int> arr = [1,2,3,4,5,6,7,8,9];
  int target = 5;
  int ans = binary(arr, target);
  print('at the inde $ans');
}