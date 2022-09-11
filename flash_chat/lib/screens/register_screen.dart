import 'package:firebase_auth/firebase_auth.dart';
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
  final _auth = FirebaseAuth.instance;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? email;
  String? password;
  bool isLoading = false;

  void handleRegisterUser(BuildContext widgetContext) async {
    setState(() {
      isLoading = true;
    });

    final currentEmail = email;
    final currentPass = password;

    final navigator = Navigator.of(widgetContext);

    if (currentEmail == null) return;
    if (currentPass == null) return;

    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: currentEmail, password: currentPass);

      navigator.pushNamedAndRemoveUntil(Routes.chatScreen, (route) => false);
      // this below is problematic
      // Navigator.pushNamedAndRemoveUntil(
      //     widgetContext, Routes.chatScreen, (route) => false);
    } catch (e) {
      //TODO better here put catching specific exceptions
      print("exception: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: "logo",
                      child: Container(
                        height: 200.0,
                        child: Image.asset("assets/images/logo.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  CustomTextField(
                      hintText: "Enter your email",
                      onChanged: (String value) {
                        email = value;
                        print("email: $email");
                      }),
                  SizedBox(
                    height: 48.0,
                  ),
                  CustomTextField(
                      isObscureText: true,
                      hintText: "Enter your password",
                      onChanged: (String value) {
                        password = value;
                        print("password: $password");
                      }),
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: CustomMaterialButton(
                      color: Colors.blueGrey,
                      label: "Register",
                      onPressed: handleRegisterUser,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
