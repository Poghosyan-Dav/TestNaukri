import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:testnaukri/route/routes.dart';

import 'app_pages.dart';

var YOUR_API_KEY = '43434181-b70b9948552f50fb4f5ddce50';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pixabay Gallery',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: Routes.home,
          getPages: AppPages.pages,
    );
  }
}


















