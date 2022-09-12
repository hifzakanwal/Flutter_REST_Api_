import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class firstscreen extends StatefulWidget {
  final String? email, password;
  const firstscreen({super.key, required this.email, required this.password});

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 100,
            width: 250,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.done_outline_outlined,
                    color: Colors.green,
                  ),
                  Text("Sign up Successfully"),
                ],
              ),
            )),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 55),
          child: Row(
            children: [
              Text("Your email is "),
              Text(
                widget.email.toString(),
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, top: 10),
          child: Row(
            children: [
              Text("Your password is "),
              Text(
                widget.password.toString(),
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
      ],
    )));
  }
}
