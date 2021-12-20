import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectation/result_page.dart';
import 'package:life_expectation/user_data.dart';

import 'custom_widgets.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? pickedGender;
  double smokedCigg = 15;
  double gym = 3.5;
  int height = 190;
  int weight = 70;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Life Expactation',
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlinedButton(height, 'Height'),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlinedButton(weight, 'Weight'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'How many days a week do you exercise?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${gym.round()}',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      value: gym,
                      onChanged: (double newValue) {
                        setState(() {
                          gym = newValue;
                        });
                      },
                      min: 0,
                      max: 7,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'How many cigarette do you smoke per day?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${smokedCigg.round()}',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      value: smokedCigg,
                      onChanged: (double newValue) {
                        setState(() {
                          smokedCigg = newValue;
                        });
                      },
                      min: 0,
                      max: 30,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      onPressed: () {
                        setState(() {
                          pickedGender = 'Male';
                        });
                      },
                      renk: pickedGender == 'Male'
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      child: Gender(
                        genders: FontAwesomeIcons.mars,
                        genderName: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPressed: () {
                        setState(() {
                          pickedGender = 'Female';
                        });
                      },
                      renk: pickedGender == 'Female'
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      child: Gender(),
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(
              height: 50,
              child: FlatButton(
                color: Colors.white,
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                    UserData(weight: weight,height: height,pickedGender: pickedGender,smokedCigg: smokedCigg,gym: gym,text: text)
                  )));


                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        )
    );
  }

  Row buildRowOutlinedButton(int h_w, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            '$text',
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            '$h_w',
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 31,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 45,
              width: 45,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    if (h_w == height) {
                      height = height + 1;
                    } else {
                      weight = weight + 1;
                    }
                  });
                },
                style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1.0, color: Colors.blue)),
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 45,
              width: 45,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    if (h_w == height) {
                      height = height - 1;
                    } else {
                      weight = weight - 1;
                    }
                  });
                },
                style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1.0, color: Colors.blue)),
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
