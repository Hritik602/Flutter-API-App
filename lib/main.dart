import 'package:flutter/material.dart';
import 'package:flutter_app_api/ViewUI/login_ui.dart';

// Map ? data;
//
// Future <Api> fetchApiData() async {
//   final response = await http
//       .get(Uri.parse('https://reqres.in/api/users/2'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     // data=json.decode(response.body);
//     // ignore: avoid_print
//     print(response.body);
//     return Api.fromJson(json.decode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginScreen(),
    );
  }
}
