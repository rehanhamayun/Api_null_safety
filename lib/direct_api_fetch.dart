import 'dart:convert';

import 'package:api_null_safety/Models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Future<ProductsModel> getProductsApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data?['street']);
    } else {
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<ProductsModel>(
              future: getProductsApi(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data['id'].length,
                      itemBuilder: (BuildContext context, int position) {
                        return Card();
                      });
                } else {
                  return Text("Loading");
                }
              })
        ],
      ),
    );
  }
}
