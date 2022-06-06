import 'package:flutter/material.dart';
import 'quiz_question.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: 350.0,
              child: Image.asset(
                'assets/images/accueil.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          TextButton(
            child: Text(
              'Commencez le quizz',
              textScaleFactor: 1.5,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepOrange,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return QuizQuestion("Répondez par vraie ou faux");
              }));
            },
          ),
        ],
      )
    );
  }
}
