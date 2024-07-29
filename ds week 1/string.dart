String replace (String word){

  String res ='';
  for (var i = 0; i < word.length; i++) {
    if (word[i].contains('o')) {
      res+='n';
    }
    else{
      res +=word[i];
    }
  }
  return res;
}
String vowels(String word){
  const vowels = 'aeiou';
  StringBuffer res = StringBuffer();

  for (var i = 0; i < word.length; i++) {
    if (!vowels.contains(word[i])) {
      res.write(word[i]);
    }
  }
  return res.toString();
}
void main(){
  String word = 'wood nook kook l';
  print(replace(word));
  print(vowels(word));
}