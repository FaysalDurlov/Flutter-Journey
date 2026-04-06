String LargeWord(String Sentence){
  dynamic MaxWordLen = 0;
  dynamic Word = "";
  List<String>words = Sentence.split(" ");
  for(String eachWord in words){
    dynamic wordLen = eachWord.length;
    if(MaxWordLen<wordLen){
      Word = eachWord;
      MaxWordLen = wordLen;
    }
  }
  return Word;
}

void main(){
  print(LargeWord("Dart is My New Code Mate"));
  print(LargeWord("Dart is My New For Meeeeee"));
}