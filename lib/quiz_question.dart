
import 'dart:math';

import 'package:chalenge_quiz/main.dart';
import 'package:flutter/material.dart';
import 'body.dart';
import 'package:chalenge_quiz/question.dart';


class QuizQuestion extends StatefulWidget {
  const QuizQuestion(String s, {Key? key}) : super(key: key);


  @override
  State<QuizQuestion> createState() => _QuizQuestionState();


}

class _QuizQuestionState extends State<QuizQuestion> {
  late Question question;

  List<Question> listQuestions=[
    Question("1 litre d'huile (même de cuisine) peut contaminer jusqu'à 1 000 litres d'eau.", false,"En fait un seul litre d'huile peut contaminer jusqu’à 1 km2 d’eau, soit l'équivalent de 1 000 mètres cube d’eau ou encore 1 million de litres !","savant1.jpg"),
    Question("Chaque année, le blocage des pompes des stations d'eau dû aux déchets inappropriés jetés dans les eaux usées de Drummondville coûte 100 000 dollars.", true,"Par exemple, à Drummondville, cette mauvaise habitude coûte annuellement environ 100 000 dollars à la municipalité.","savant2.jpg"),
    Question( "L'huile jetée dans les toilettes ou un évier reste liquide et se disperse dans l'eau.", false,"Le déversement de graisses alimentaires et d’huile de cuisine dans les canalisations forme des amas de graisse que l'on nomme fatbergs.","savant3.jpg"),
    Question("Une surverse (flushgate) est toujours liée à un problème d'origine industrielle.", false,"Celles-ci sont aussi liées à nos mauvais usages des toilettes et des lavabos.","eau1.jpg"),
    Question( "Les nappes souterraines alimentent en eau seulement les agriculteurs et les particuliers qui ont un puits artésien.", false,"Au Québec, 56 villes tirent leur eau potable de nappes d'eau souterraines, d'où l'importance de les protéger.","savant4.jpg"),
    Question("On améliore la récupération des eaux de pluie en raccordant directement ses gouttières aux égouts de la ville.", false,"Beaucoup de villes du Québec interdisent le raccordement des gouttières aux égouts sanitaires et pluviaux, aux drains de fondation et même la redirection des gouttières vers la rue.","eau2.jpg"),
    Question("Les engrais ne sont pas un danger pour les lacs et les rivières.", false,"Ce sont les engrais que nous utilisons, entraînés par le ruissellement d'eau de pluie, qui favorisent le développement des algues, dont les algues bleu-vert, qui sont un véritable fléau pour la qualité de l'eau de nos lacs et de nos rivières.","eau3.jpg"),
    Question("On peut commander un écran tactile avec un cornichon.",true,"Un cornichon, de même qu’une banane ou une saucisse, est très proche du doigt humain… au moins pour ce qui concerne la mobilité de ses charges électriques.","eau4.jpg"),
    Question("L’eau peut parfois bouillir à 85°C.", true,"Au sommet du mont Blanc, l'eau entrera ainsi en ébullition à 85°C. Le principe des 100°C n’est valable que si on se situe au niveau de la mer.","eau5.jpg"),
    Question("On est plus léger à marée basse qu’à marée haute.", false,"C’est justement l’inverse.","eau6.jpg"),
    Question( "Sauter en l'air dans un ascenseur qui s'écrase vous sauvera.", false,"Pour ne subir aucun dommage, le corps piégé dans l’ascenseur devrait normalement être à l’arrêt au moment de l’impact au sol.","cereau1.jpg"),
    Question("Un réfrigérateur produit plus de chaud que de froid.", true,"Pour un scientifique, un réfrigérateur ne produit pas de froid. Il extrait simplement la chaleur qui se trouve à l’intérieur de l’appareil.","cerveau2.jpg"),
    Question("Si l'océan Antarctique était rempli de vodka, il n'y aurait aucun bloc de glace en surface", true,"Normalement, la matière, lorsqu'elle est à l'état solide, est plus dense (et donc plus lourde pour un volume égal) qu'à l'état liquide. Ainsi, des glaçons de vodka jetés dans un verre de voka coulent vers le fond. Contrairement aux glaçons classiques, car l'eau fait exception.","cerveau3.jpg"),
    Question( "Il est moins dangereux de mettre les doigts dans une prise que de toucher une clôture électrique.", false,"Le courant domestique, lui, court en permanence, ce qui le rend particulièrement dangereux","cerveau4.jpg"),
    Question( "Rien ne va plus vite que la lumière.", true,"Rien dans l’Univers ne va plus vite.","cerveau5.jpg"),
    Question("Si la Terre n'était pas légèrement penchée, il n'y aurait ni été ni hiver.", true,"L'hémisphère Nord puis Sud sont tour à tour davantage exposés au Soleil pendant six mois. Celui qui lui fait face est en été, l'autre est en hiver.","cerveau6.jpg"),
    Question("Le ciel est bleu car il reflète la couleur des océans", true,"Le ciel paraît bleu à cause de la manière dont les particules gazeuses de l'atmosphère interagissent avec la lumière blanche du soleil.","cerveau7.jpg"),
  ];
  var rng = Random();
  var currentQuestion;
  int index=0;
  int score=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentQuestion=rng.nextInt(listQuestions.length);
    question=listQuestions[currentQuestion];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Le Quiz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            Text("Question numero ${index+1}"),
            Text("Score ${score}/${index}"),
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width/1.2,
                height: 350.0,
                child: Image.asset(
                  'assets/images/${question.imagePath}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/1.1,
              child:Text(
                question.question,
                textAlign: TextAlign.center,
                //textWidthBasis: TextWidthBasis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                TextButton(
                  onPressed: (){
                    if(question.response==true){
                      gagner();
                      score++;
                    }
                    else{
                      perdu();
                    }
                  },
                  child:Text(
                    "Vraie",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.deepOrange
                  ),
                ),
                TextButton(
                  onPressed: (){
                    if(question.response==true){
                      perdu();
                    }
                    else{
                      gagner();
                      score++;
                    }
                  },
                  child:Text(
                    "Faux",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.deepOrange
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Future<Null> gagner() async{
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return SimpleDialog(
              title: Text(
                "C'est gagné!",
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
                textScaleFactor: 1.5,
              ),
              contentPadding: EdgeInsets.all(10.0),
              children: <Widget> [
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    height: 200.0,
                    child: Image.asset(
                      'assets/images/sonic1.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Text(
                  question.explication,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    questionSuivant();
                    //afficheQuestion(questions);
                    //fin(1);
                  },
                  child:Text(
                    "Au suivant",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.deepOrange
                  ),
                ),
              ],
            );
          }
      );
  }

  Future<Null> perdu() async{
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return SimpleDialog(
            title: Text(
              "Oups! perdu...",
              style: TextStyle(
                color: Colors.deepOrange,
              ),
              textScaleFactor: 1.5,
            ),
            contentPadding: EdgeInsets.all(10.0),
            children: <Widget> [
              Card(
                child: Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  height: 200.0,
                  child: Image.asset(
                    'assets/images/honte.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Text(
                question.explication,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  questionSuivant();
                  //afficheQuestion(questions);
                  //fin(0);
                },
                child:Text(
                  "Au suivant",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange
                ),
              ),
            ],
          );
        }
    );
  }
  Future<Null> fin(int score)async{
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(
              "C'est fini",
              style: TextStyle(color: Colors.deepOrange),
              textScaleFactor: 1.2,
              textAlign: TextAlign.center,
            ),
            contentPadding: EdgeInsets.all(10.0),
            content: Text("Votre score est "+ score.toString() +"/10",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                      return MyApp();
                    }));
                  },
                  child: Text("OK", style: TextStyle(color: Colors.deepOrange),))
            ],
          );
        }
    );
  }
  bool verification(bool b){
     if(b==question.response){
       return(true);
     }
     else{
       return(false);
     }
  }
  void questionSuivant(){
    //String quest=listQuestions[currentQuestion] as String;
    //print(quest);
    if(index<9){
      index++;
      setState(() {
        currentQuestion=rng.nextInt(listQuestions.length);
        question=listQuestions[currentQuestion];
      });
    }else{
      fin(score);
    }

  }

}
