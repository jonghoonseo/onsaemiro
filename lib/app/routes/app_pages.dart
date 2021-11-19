import 'package:get/get.dart';

import 'package:onsaemiro/app/bindings/details_binding.dart';
import 'package:onsaemiro/app/bindings/home_binding.dart';
import 'package:onsaemiro/app/ui/android/details/details_page.dart';
import 'package:onsaemiro/app/ui/android/home/home_page.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: Routes.DETAILS,
        page: () => DetailsPage(),
        binding: DetailsBinding()),
  ];
}
