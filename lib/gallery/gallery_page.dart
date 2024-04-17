import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../route/routes.dart';
import 'gallery_controller.dart';

class GalleryPage extends StatelessWidget {
  final controller = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    controller.fetchImages(); // Pass the BuildContext here

    return Scaffold(
      appBar: AppBar(title: Text('Pixabay Gallery')),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width ~/ 150,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: controller.images.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(
                  Routes.fullScreenImage,
                  arguments: {
                    'imageUrl': controller.images[index]['imageUrl'],
                    'likes': controller.images[index]['likes'],
                    'views': controller.images[index]['views'],
                  },
                );
              },
              child: Image.network(
                controller.images[index]['imageUrl'],
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,

              ),
            );
          },
        );
      }),
    );
  }
}