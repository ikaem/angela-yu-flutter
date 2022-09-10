import 'package:flash_chat/router/routes.dart';
import 'package:flash_chat/widgets/custom_material_button.dart';
import 'package:flash_chat/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Container(
                height: 200.0,
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            CustomTextField(
                hintText: "Enter your email",
                onChanged: (String value) {
                  print("value");
                }),
            SizedBox(
              height: 48.0,
            ),
            CustomTextField(
                hintText: "Enter your password",
                onChanged: (String value) {
                  print("value");
                }),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: CustomMaterialButton(
                color: Colors.blueGrey,
                label: "Register",
                onPressed: (BuildContext widgetContext) {
                  //some logic here first to register
                  Navigator.pushNamed(widgetContext, Routes.chatScreen);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
