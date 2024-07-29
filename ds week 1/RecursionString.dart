// String rev(String str){
//   if (str.isEmpty) {
//     return str;
//   }
//   return rev(str.substring(1))+str[0];
// }
void main(){
  String input = 'Hellodggasuigdgadgu';
  String ans = rev(input);
  print(ans);
}
String rev(String char){
  if (char.isEmpty) {
    return char;
  }
  return rev(char.substring(1))+char[0];
}