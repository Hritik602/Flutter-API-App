import 'package:flutter/material.dart';
import 'package:flutter_app_api/Api%20service%202/api_service2.dart';
import 'package:flutter_app_api/ViewUI/list_of_user_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email =
      TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController password = TextEditingController(text: "cityslicka");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Welcome To,",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 3.0),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomeText(
                fontSize: 25,
                text: "New Api ",
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
              ),
              const SizedBox(
                height: 100,
              ),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Enter Email",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Passwprd",
                    hintText: "Enter password",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      final api =
                          await ApiFetch().userLogin(email.text, password.text);
                      if (api['token'] != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListUser()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Sorry invalid"),
                          backgroundColor: Colors.red,
                        ));
                      }
                      print(api.toString());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomeText extends StatelessWidget {
  CustomeText(
      {Key? key, this.fontSize, this.fontWeight, this.letterSpacing, this.text})
      : super(key: key);
  double? fontSize;
  String? text;
  FontWeight? fontWeight;
  double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.black,
          letterSpacing: letterSpacing),
    );
  }
}
