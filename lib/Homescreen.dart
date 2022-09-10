import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'model.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<Getapimodel> modellist = [];

  Future<List<Getapimodel>> apifun() async {
    final response =
        await http.get(Uri.parse("http://jsonplaceholder.typicode.com/users"));
    final data = jsonDecode(response.body.toString());

    for (Map i in data) {
      modellist.add(Getapimodel.fromJson(i as Map<String, dynamic>));
    }

    if (response == 200) {
      return modellist;
    } else {
      return modellist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apifun(),
        builder: ((context, AsyncSnapshot<List<Getapimodel>> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: modellist.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        //modellist[index].title.toString()
                        Text(snapshot.data![index].name.toString()),
                        Text(snapshot.data![index].email.toString()),
                        Text(snapshot.data![index].address!.city.toString()),
                        Text(
                            snapshot.data![index].address!.geo!.lat.toString()),
                        //  Text(modellist[index].name.address.city.toString()),
                        //               Text(modellist[index].email.toString()),
                      ],
                    ),
                  );
                });
          }
        }));
  }
}
