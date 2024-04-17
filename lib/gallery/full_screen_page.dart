import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FullScreenImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments;
    final String imageUrl = arguments['imageUrl'];
    final int likes = arguments['likes'];
    final int views = arguments['views'];

    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.network(imageUrl,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
     ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Likes: $likes'),
              Text('Views: $views'),
            ],
          ),
        ),
      ),
    );
  }
}