import 'package:retwho/app/data/controller/auth/auth_controller.dart';

class AppApi {
  final String baseUrl =
      // "https://api.retwho.com/";
      "https://retwho.herokuapp.com";

  // "http://170.187.157.25";
  final String shop = '/shop';
  final String product = '/product';
  final String sale = '/sale';
  final String department = '/department';
  final String request = '/request';

  final Map<String, String> headerValue = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${AuthController.instance.userToken}',
  };
}
