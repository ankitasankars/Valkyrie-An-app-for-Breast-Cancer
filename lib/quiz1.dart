import 'package:flutter/material.dart';


var finalScore = 0;
var questionNumber = 0;
var quiz = new AQuiz();

class AQuiz{
  var images = [
    "1","2","3","4","5","6","7","a", "b", "c", "d",
  ];


  var questions = [
  "Has any member of your family been diagnosed of breast cancer?",
  "Are you currently pregnant?",
  "Did you breastfeed any of your children?",
  "Have you ever used oral contraceptives for two months or more for any reason (contraception, acne, menstrual irregularity, etc.)?",
  "Have you used any female hormones for two months or more such as Premarin or other estrogens for hot flashes or other menopausal symptoms?",
  "Have you ever had a mammogram?",
  "Have you ever had any of the following breast procedures: an aspiration or needle biopsy, a breast biopsy, removal of a lump, or total removal of a breast?",
  "Can you feel a lump on your chest?",
  "Have you ever experienced nipple discharge?",
  "Do you see a dimpling like the above?",
  "Are you sensing any kind of pain in your breast or nipple?",
  ];


  var choices = [
   ["Yes", "No"],
   ["Yes", "No"],
    ["Yes", "No"],
    [ "Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
    [ "Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
    ["Yes", "No"],
  ];


  var correctAnswers = [
     "Yes","Yes","Yes","Yes", "Yes", "Yes", "Yes","Yes","Yes", "Yes","Yes",
  ];
}

class Quiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      new Text("Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style: new TextStyle(
                            fontSize: 22.0
                        ),),

                      new Text("Score: $finalScore",
                        style: new TextStyle(
                            fontSize: 22.0
                        ),)
                    ],
                  ),
                ),


                //image
                new Padding(padding: EdgeInsets.all(10.0)),

                new Image.asset(
                  "images/${quiz.images[questionNumber]}.jpg",
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Text(quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 1
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.pinkAccent,
                      onPressed: (){
                        if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          finalScore+=10;
                        }else{
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                    //button 2
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.pinkAccent,
                      onPressed: (){

                        if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct");
                          finalScore+=10;
                        }else{
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),



                new Padding(padding: EdgeInsets.all(15.0)),

                new Container(
                    alignment: Alignment.bottomCenter,
                    child:  new MaterialButton(
                        minWidth: 240.0,
                        height: 30.0,
                        color: Colors.red,
                        onPressed: resetQuiz,
                        child: new Text("Quit",
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.white
                          ),)
                    )
                ),




              ],
            ),
          ),

        )
    );
  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }



  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
}


class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Text("Final Score: $score",
                style: new TextStyle(
                    fontSize: 35.0
                ),),
             if(score>50)
                new Text("Get a check up done as soon as possible!",style: new TextStyle(fontSize: 50,color: Colors.black,backgroundColor: Colors.red))
              else
                new Text("You are fine!",style: new TextStyle(fontSize: 50,fontWeight:FontWeight.bold ,color: Colors.black,backgroundColor: Colors.green,decorationColor: Colors.black26)),

              new Padding(padding: EdgeInsets.all(30.0)),

              new MaterialButton(
                color: Colors.pink,
                onPressed: (){
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: new Text("Reset Quiz",
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),),)

            ],
          ),
        ),


      ),
    );
  }


}