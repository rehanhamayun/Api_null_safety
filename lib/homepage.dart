import 'dart:convert';

import 'package:api_null_safety/Models/favorite_posts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'Models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UsersPosts> postLists = [];

  Future<List<UsersPosts>> getPostApi() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );

    var data = await json.decode(response.body.toString());
    if (response.statusCode == 200) {
      postLists.clear();
      for (Map<String, dynamic> i in data) {
        // This is the way to assign API calls to the model we create.
        postLists.add(UsersPosts.fromJson(i));
      }
      return postLists;
    } else {
      return postLists;
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(postList());
    final favorite = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text('Loading');
                } else {
                  return ListView.builder(
                      itemCount: postLists.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Title',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(postLists[index].title.toString()),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Description',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                    'Description\n' +
                                        postLists[index].body.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                ElevatedButton(
                                  onPressed: () {
                                    favorite.favoriteItemAdd(
                                        postLists[index].title.toString());
                                  },
                                  child: Text("+"),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                return Text("");
              }),
            )
          ],
        ),
      ),
    );
  }
}
