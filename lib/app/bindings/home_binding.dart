import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:onsaemiro/app/controller/home/home_controller.dart';
import 'package:onsaemiro/app/data/provider/api.dart';
import 'package:onsaemiro/app/data/repository/posts_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
          repository:
              MyRepository(apiClient: MyApiClient(httpClient: http.Client())));
    });
  }
}
