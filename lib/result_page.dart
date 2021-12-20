import 'package:flutter/material.dart';

import 'user_data.dart';
import 'calculate.dart';

class ResultPage extends StatelessWidget {

  final UserData _userData;
  ResultPage(this._userData);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result Page'),centerTitle: true,titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(flex: 8,
              child: Center(child: Text(Calculate(_userData).calculating().round().toString(),style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
              ),)),
          Expanded(
            flex: 1,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {

                Navigator.pop(context);

              },
              child: Text(
                'Go Back',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
