import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/router/routes.dart';
import 'package:flash_chat/widgets/custom_material_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  //could possibly used as a route name
  // should be stsatic, so hwen used, this does not have to isntantiate whole widget
  static const String id = "welcome_screen";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // late Animation _animationCurved;
  late Animation _animationTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      //upper bound cannot be above 1 if using curved animation
      // upperBound: 100,
    );
    // _animationCurved =
    //     CurvedAnimation(parent: _animationController, curve: Curves.decelerate);
    _animationTween = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(_animationController);

    _animationController.forward();

    // _animationCurved.addStatusListener((status) {
    //   print("status: $status");
    //   if (status == AnimationStatus.completed) {
    //     _animationController.reverse(from: 1.0);
    //     // return;
    //   } else if (status == AnimationStatus.dismissed) {
    //     _animationController.forward();
    //   }
    //   // status: AnimationStatus.completed
    // });

    // _animationController.reverse(from: 1.0);
    _animationController.addListener(() {
      // print("controller value: ${_animationController.value}");
      // print("animation value: ${_animationCurved.value}");
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red.withOpacity(_animationController.value),
      // backgroundColor: Colors.white,
      backgroundColor: _animationTween.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset("assets/images/logo.png"),
                    height: 60.0,
                    // height: _animationCurved.value * 100,
                  ),
                ),
                AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Flash Chat",
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 45.0,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: CustomMaterialButton(
                color: Colors.blue,
                label: "Login",
                onPressed: (BuildContext widgetContext) {
                  Navigator.pushNamed(widgetContext, Routes.loginScreen);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: CustomMaterialButton(
                color: Colors.blueGrey,
                label: "Register",
                onPressed: (BuildContext widgetContext) {
                  Navigator.pushNamed(widgetContext, Routes.registerScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
