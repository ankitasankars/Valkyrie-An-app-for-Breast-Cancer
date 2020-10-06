import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './quiz1.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


void main(){
  runApp(
      new MaterialApp(
        home: new Quiz(),
      )
  );
}


class Quiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new QuizState();
  }
}

class QuizState extends State<Quiz>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xffB3365B),
      appBar: new AppBar(
        title: new Text(""),
        toolbarHeight: 0,
        backgroundColor: Color(0xffB3365B),
      ),


        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/back.jpg"),
                fit: BoxFit.cover,
              ),
            ),

        margin: const EdgeInsets.all(1.0),
        child: new Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RawMaterialButton(
              elevation: 10,
              fillColor: Color(0xff031C32),
              splashColor: Color(0xffB3365B),
              child: Padding(
                padding:const EdgeInsets.all(25),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.healing,
                      color: Color(0xffB3365B),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Self Examination",
                      maxLines: 1,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              onPressed: _launchURL4,
              shape: StadiumBorder(
                  side: BorderSide(color: Color(0xffB3365B))
              ),
            ),


        RawMaterialButton(

        fillColor: Color(0xff031C32),
          splashColor: Color(0xffB3365B),
          child: Padding(
            padding: EdgeInsets.only(top: 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Icon(
                  Icons.face,
                  color: Color(0xffB3365B),
                ),
                SizedBox(
                  height: 70.0,
                ),
                Text(
                  "Check your risk level",
                  maxLines: 1,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          onPressed: startQuiz,
          shape:  StadiumBorder(
            side: BorderSide(color: Color(0xffB3365B)),
          ),

        ),
            RawMaterialButton(
              fillColor: Color(0xff031C32),
              splashColor: Color(0xffB3365B),
              child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Color(0xffB3365B),
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                    Text(
                      "Reminder Alerts",
                      maxLines: 1,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              onPressed: (){},
              shape:  StadiumBorder(
                side: BorderSide(color: Color(0xffB3365B)),
              ),

            ),

          RawMaterialButton(
            fillColor: Color(0xff031C32),
            splashColor: Color(0xffB3365B),
            child: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(
                    Icons.navigation,
                    color: Color(0xffB3365B),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    "Nearby Oncologists",
                    maxLines: 1,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            onPressed: _launchURL1,
            shape:  StadiumBorder(
              side: BorderSide(color: Color(0xffB3365B)),
            ),

          ),
          RawMaterialButton(
            elevation: 10,
            fillColor: Color(0xff031C32),
            splashColor: Color(0xffB3365B),
            child: Padding(
              padding:const EdgeInsets.all(25),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(
                    Icons.healing,
                    color: Color(0xffB3365B),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Self help suggestions",
                    maxLines: 1,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            onPressed: _launchURL2,
            shape: StadiumBorder(
                side: BorderSide(color: Color(0xffB3365B))
            ),
          ),
          RawMaterialButton(
            fillColor: Color(0xff031C32),
            splashColor: Color(0xffB3365B),
            child: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(
                    Icons.query_builder,
                    color: Color(0xffB3365B),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Text(
                    "What next?",
                    maxLines: 1,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            onPressed: _launchURL,
            shape:  StadiumBorder(
              side: BorderSide(color: Color(0xffB3365B)),
            ),

          ),
            RawMaterialButton(
              elevation: 10,
              fillColor: Color(0xff031C32),
              splashColor: Color(0xffB3365B),
              child: Padding(
                padding:const EdgeInsets.all(25),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.question_answer,
                      color: Color(0xffB3365B),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Blogs",
                      maxLines: 1,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              onPressed: _launchURL3,
              shape: StadiumBorder(
                  side: BorderSide(color: Color(0xffB3365B))
              ),
            )
          ],
        ),
      ),

    );
  }
  _launchURL() async {
    const url = 'https://www.nationalbreastcancer.org/our-programs/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL1() async {
    const url = 'https://www.google.com/search?client=opera-gx&q=oncologist+nearby&sourceid=opera&ie=UTF-8&oe=UTF-8';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL2() async {
    const url = 'https://www.google.com/search?client=opera-gx&q=therapists+near+me&sourceid=opera&ie=UTF-8&oe=UTF-8';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL3() async {
    const url = 'http://www.lbbc.org/blog/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL4() async {
    const url = 'https://youtu.be/LrfE6JUwIms';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  void startQuiz(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
    });
  }
}