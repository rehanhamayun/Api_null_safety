import 'package:api_null_safety/provider/post_provider_model.dart';
import 'package:api_null_safety/provider/provider_api.dart';
import 'package:flutter/material.dart';

class DataClass with ChangeNotifier {
  PostProviderModel? postProviderModel;

  bool loading = false;

  getData() async {
    loading = true;
    postProviderModel = await (getPostData());
    loading = false;

    notifyListeners();
  }
}
