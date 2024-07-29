void main(){
  String word = 'hello word';
  print(reve(word));
}
String reve(String word){
  String rev = '';
  for (var i = word.length-1; i >=0; i--) {
    rev = rev+=word[i];
  }
  return rev;
}