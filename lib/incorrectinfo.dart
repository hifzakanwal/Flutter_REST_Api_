import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class firstifincorrect extends StatefulWidget {
  const firstifincorrect({super.key});

  @override
  State<firstifincorrect> createState() => _firstifincorrectState();
}

class _firstifincorrectState extends State<firstifincorrect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                height: 100,
                width: 250,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      Text("Incorrect password or email \n Try again ")
                    ],
                  ),
                ))));
  }
}
