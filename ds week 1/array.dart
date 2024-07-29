void main(){
  List<int> nums = [1,2,6,1,3,5,2];
 print(removeduplicate(nums));


}
List<int> removeduplicate(List <int> nums){
   Set <int> unique = nums.toSet();
   return unique.toList();
}