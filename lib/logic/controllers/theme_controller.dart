
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController{

  final GetStorage boxStorage = GetStorage();

  final key = 'isDarkModes';

  saveThemeDateInBox(bool isDark){
    boxStorage.write(key, isDark);
  }

  bool getThemeDateInBox(){
   return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get themeModeGet => getThemeDateInBox() ? ThemeMode.dark : ThemeMode.light;

  void changesTheme(){
  Get.changeThemeMode(getThemeDateInBox() ?  ThemeMode.light : ThemeMode.dark);
  saveThemeDateInBox(!getThemeDateInBox());

  }
}