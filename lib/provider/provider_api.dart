import 'dart:convert';
import 'dart:io';

import 'package:api_null_safety/provider/post_provider_model.dart';
import 'package:http/http.dart' as http;

Future<PostProviderModel?> getPostData() async {
  PostProviderModel? result;
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

  var postData = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    return PostProviderModel.fromJson(postData[0]);
  } else {
    print("Error");
  }
  return result;
}
