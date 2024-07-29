// int fact(int num){
//   if (num<=1) {
//     return 1;
//   }
//   return num*fact(num-1);
// }
void main(){
  int a = fact(5);
  print(a);
}
int fact(int num){
  if (num<=1) {
    return 1;
  }
  return num*fact(num-1);
}