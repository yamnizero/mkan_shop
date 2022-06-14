import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mkan_shop/utils/my_string.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;
  var storageLang = GetStorage();
  var langLocal = ene;

  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

  ///Language

  @override
  void onInit() async {
    langLocal = await getLanguage;
    super.onInit();
  }

  void saveLanguage(String lang) async{
    await storageLang.write("lang", lang);
  }

   Future<String> get getLanguage async {
    return  await storageLang.read("lang");
   }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if(langLocal == typeLang){
      return ;
    }
    if(typeLang == frf){
      langLocal = frf;
      saveLanguage(frf);
    }else if(typeLang == ara){
      langLocal = ara;
      saveLanguage(ara);
    }else{
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
