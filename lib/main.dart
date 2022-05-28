import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mkan_shop/logic/controllers/theme_controller.dart';
import 'package:mkan_shop/routes/routes.dart';
import 'package:mkan_shop/utils/theme.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Mkan Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      themeMode: ThemeController().themeModeGet,
      initialRoute: FirebaseAuth.instance.currentUser != null  || GetStorage().read<bool>("auth") ==  true ? AppRoutes.mainScreen : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }

}


