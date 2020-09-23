import 'package:flash_chat/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  // static const routeName='Welcome';
  static String id = "welcome_screen";

// Animated Controller Animated Value Ticker

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation animation1;

  // final Color colour;
  // final String title;
  // final Function onPressed;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 1), vsync: this
        // upperBound: 100.0
        // for curvedAnimation upperBound is 1
        // ticker provider
        );

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    // animation =
    //     ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
    controller.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
      // print(controller.value);
      // print(animation.value);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red.withOpacity(controller.value),
      backgroundColor: Colors.white,
      // backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    // height: 60.0,
                    // height: controller.value,
                    height: animation.value * 70,
                  ),
                ),
                // Text(
                // '${controller.value.toInt()}%',
                // 'Flash Chat',
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  // isRepeatingAnimation: true,
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                // ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title:'Log In',
              colour:Colors.lightBlueAccent,
              onPressed: () {
              Navigator.pushNamed(context,LoginScreen.id);
              }
            ),
          RoundedButton(
              title:'Register',
              colour:Colors.blueAccent,
              onPressed: () {
              Navigator.pushNamed(context,RegistrationScreen.id);
              }
            ),    
          ],
        ),
      ),
    );
  }
}
