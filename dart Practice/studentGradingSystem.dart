double GiveAvg(Map<String,int> ListOfStudent){
  int StudentNum = 0;
  int totalScore = 0;
  for(String eachStudent in ListOfStudent.keys){
    StudentNum+=1;
    totalScore+= ListOfStudent[eachStudent]!;
  }
  return (totalScore/StudentNum);
}

String getGrade(var ListOfStudent, String name){
  String grade = "F";
  int Score = ListOfStudent[name];

  if(Score>=45 && Score<50){
    grade = "D";
  }else if(Score>=50 && Score<55){
    grade = "D+";
  }else if(Score>=55 && Score<60){
    grade = "C-";
  }else if(Score>=60 && Score<65){
    grade = "C";
  }else if(Score>=65 && Score<70){
    grade = "C+";
  }else if(Score>=70 && Score<75){
    grade = "B-";
  }else if(Score>=75 && Score<80){
    grade = "B";
  }else if(Score>=80 && Score<85){
    grade = "B+";
  }else if(Score>=85 && Score<90){
    grade = "A-";
  }else if(Score>=90 && Score<=100){
    grade = "A";
  }
  return grade;
}

void main(){
  Map<String, int> IUB_StudentInfo = {
    "Faysal": 87,
    "Shihab": 60,
    "Fahim": 90,
    "Mukut": 40
  };
  Map<String,int> NSU_StudentInfo = {
    "Rifat": 40,
    "Jamil": 10,
    "Ramen": 89,
    "Anika": 33
  };
  print(getGrade(IUB_StudentInfo,"Fahim"));
  print(GiveAvg(IUB_StudentInfo));

  var itemKeys = IUB_StudentInfo.keys.toList();
  print(itemKeys);
}