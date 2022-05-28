import 'package:get/get.dart';
import 'package:mkan_shop/view/screens/category_screen.dart';
import 'package:mkan_shop/view/screens/favorites_screen.dart';
import 'package:mkan_shop/view/screens/home_screen.dart';
import 'package:mkan_shop/view/screens/settongs_screen.dart';

class MainController extends GetxController{
  RxInt currentIndex = 0.obs;

  final  tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs;

  final title = [
    'Mkan Shop',
    'Categories',
    'Favourites',
    'Setting'

  ].obs;
}