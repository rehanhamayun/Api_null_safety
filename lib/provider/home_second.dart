import 'package:api_null_safety/provider/post_provider_model.dart';
import 'package:api_null_safety/provider/provider_loading_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSecond extends StatefulWidget {
  const HomeSecond({Key? key}) : super(key: key);

  @override
  State<HomeSecond> createState() => _HomeSecondState();
}

class _HomeSecondState extends State<HomeSecond> {
  @override
  void initState() {
    super.initState();
    final mydata = Provider.of<DataClass>(context, listen: false);
    mydata.getData();
  }

  @override
  Widget build(BuildContext context) {
    final mydata = Provider.of<DataClass>(context);
    print(mydata.postProviderModel?.body);
    return Scaffold();
  }
}
