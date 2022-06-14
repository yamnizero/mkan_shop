import 'package:get/get.dart';
import 'package:mkan_shop/language/en.dart';

import '../utils/my_string.dart';
import 'ar.dart';
import 'fr.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    ene: en,
    ara: ar,
    frf: fr,
  };
}