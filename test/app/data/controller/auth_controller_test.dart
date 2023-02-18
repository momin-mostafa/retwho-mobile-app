// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:retwho/app/data/controller/auth_controller.dart';

// void main() {
//   group('AuthController ', () {
//     var binding;
//     var firebaseApp;
//     setUpAll(() async {
//       binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//       firebaseApp = await Firebase.initializeApp();
//       Get.put<AuthController>(AuthController());
//     });

//     test(
//         'Given AuthController when initialized then userToken should be empty string',
//         () {
//       expect(Get.find<AuthController>().userToken, '');
//     });
//     test(
//       'Given AuthController when signIn called then userToken should not be empty',
//       () async {
//         await Get.find<AuthController>()
//             .signIn(email: 'admin@example.com', password: '******');
//         expect(Get.find<AuthController>().userToken, isNot(''));
//       },
//     );

//     tearDownAll(() {
//       binding = null;
//       firebaseApp = null;
//     });
//   });
// }
