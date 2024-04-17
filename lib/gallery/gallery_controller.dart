import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class GalleryController extends GetxController {
  var images = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  void fetchImages() async {
    try {
      final String apiKey = '43434181-b70b9948552f50fb4f5ddce50';
      final String apiUrl =
          'https://pixabay.com/api/?key=$apiKey&q=nature&image_type=photo';

      final http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data != null && data['hits'] != null) {
          List<dynamic> hits = data['hits'];
          hits.forEach((image) {
            String imageUrl = image['previewURL'];
            int likes = image['likes'];
            int views = image['views'];
            images.add({'imageUrl': imageUrl, 'likes': likes, 'views': views});
          });
        } else {
          print('No images data found');
        }
      } else {
        print('Failed to load images: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching images: $e');
    } finally {
      isLoading.value = false;
    }
  }
}