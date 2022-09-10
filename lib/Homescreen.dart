import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<model> modellist = [];

  Future<List<model>> modelfun() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      // for (Map i in data) {
      //modellist.add(Getapimodel.fromJson(i as Map<String, dynamic>));

      for (Map i in data) {
        model modelg = model(title: i['title'], url: i['url'], id: i['id']);
        modellist.add(modelg);
      }
      return modellist;
    } else {
      return modellist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: modelfun(),
                //list
                builder: (context, AsyncSnapshot<List<model>> snapshot) {
                  return ListView.builder(
                      itemCount: modellist.length,
                      itemBuilder: (context, index) {
                        // Text(modellist[index].id.toString()),
                        return ListTile(
                          title: Text(snapshot.data![index].id.toString()),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data![index].url.toString()),
                          ),
                          subtitle:
                              Text(snapshot.data![index].title.toString()),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}

class model {
  String? title, url;
  int? id;
  model({this.title, this.url, this.id});
}
