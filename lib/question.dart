

class Question {
  late String question;
  late bool response;
  late String explication;
  late String imagePath;

  Question(String question, bool response, String explication, String imagePath){
    this.question=question;
    this.response=response;
    this.explication=explication;
    this.imagePath=imagePath;
  }
}