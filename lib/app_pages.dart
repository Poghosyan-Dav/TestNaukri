import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:testnaukri/route/routes.dart';

import 'gallery/full_screen_page.dart';
import 'gallery/gallery_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.home, page: () => GalleryPage()),
    GetPage(name: Routes.fullScreenImage, page: () => FullScreenImagePage()),
  ];
}