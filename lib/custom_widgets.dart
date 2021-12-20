import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectation/constants.dart';

class Gender extends StatelessWidget {
  final IconData genders;
  final String genderName;
  Gender({this.genders=FontAwesomeIcons.venus, this.genderName='Female'});
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(genders,size: 60.0,color: Colors.black,),
        SizedBox(height: 10,),
        Text('$genderName',style: kQuestionStyle,
        ),
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final renk;
  MyContainer({this.renk=Colors.white, this.child, this.onPressed});
  final Widget? child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Container(
        child: child,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: renk,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}