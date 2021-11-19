import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:onsaemiro/app/controller/details/details_controller.dart';
import 'package:onsaemiro/app/data/provider/api.dart';
import 'package:onsaemiro/app/data/repository/posts_repository.dart';

class DetailsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() {
      return DetailsController(
          repository:
              MyRepository(apiClient: MyApiClient(httpClient: http.Client())));
    });
  }

}
