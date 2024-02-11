import 'dart:convert';

import 'package:bdm_cafe/model/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/basket_model.dart';
import '../model/login_response.dart';
import '../model/table_detail_model.dart';
import 'constants.dart';

class PrefUtils {
  static SharedPreferences? _singleton;

  static const PREF_BASE_IMAGE_URL = "base_image_url";
  static const PREF_BASE_FILE_URL = "base_file_url";

  static const PREF_BDM_ITEMS = "bdm_items";
  static const PREF_BASE_URL = "base_url";
  static const PREF_FCM_TOKEN = "fcm_token";
  static const PREF_TOKEN = "token";
  static const PREF_USER = "user";
  static const PREF_LANG = "lang";
  static const PREF_BASKET = "basket";
  static const PREF_CURRENT_TABLE = "pref_current_table";

  static SharedPreferences? getInstance() {
    return _singleton;
  }

  static initInstance() async {
    _singleton = await SharedPreferences.getInstance();
  }

  static LoginResponse? getUser() {
    if (_singleton?.getString(PREF_USER) == null) {
      return null;
    } else {
      return LoginResponse.fromJson(jsonDecode(_singleton?.getString(PREF_USER) ?? ""));
    }
  }

  static Future<Future<bool>?> setUser(LoginResponse value) async {
    return _singleton?.setString(PREF_USER, jsonEncode(value.toJson()));
  }

  static String getBaseImageUrl() {
    return _singleton?.getString(PREF_BASE_IMAGE_URL) ?? "";
  }

  static Future<bool?> setBaseImageUrl(String value) async {
    return _singleton?.setString(PREF_BASE_IMAGE_URL, value);
  }

  static String getBaseFileUrl() {
    return _singleton?.getString(PREF_BASE_FILE_URL) ?? "";
  }

  static Future<bool?> setBaseFileUrl(String value) async {
    return _singleton?.setString(PREF_BASE_FILE_URL, value);
  }

  static String getBaseUrl() {
    return _singleton?.getString(PREF_BASE_URL) ?? "";
  }

  static Future<bool?> setBaseUrl(String value) async {
    return _singleton?.setString(PREF_BASE_URL, value);
  }

  static String getFCMToken() {
    return _singleton?.getString(PREF_FCM_TOKEN) ?? "";
  }

  static Future<bool?> setFCMToken(String value) async {
    return _singleton?.setString(PREF_FCM_TOKEN, value);
  }

  static String getToken() {
    return _singleton?.getString(PREF_TOKEN) ?? "";
  }

  static Future<bool?> setToken(String value) async {
    return _singleton?.setString(PREF_TOKEN, value);
  }

  static String getLang() {
    return _singleton?.getString(PREF_LANG) ?? DEFAULT_LANG_KEY;
  }

  static Future<bool?> setLang(String value) async {
    return _singleton?.setString(PREF_LANG, value);
  }

  static TableDetailModel? getCurrentTable() {
    if (_singleton?.getString(PREF_CURRENT_TABLE) == null) {
      return null;
    } else {
      return TableDetailModel.fromJson(jsonDecode(_singleton?.getString(PREF_CURRENT_TABLE) ?? ""));
    }
  }

  static Future<bool?> setCurrentTable(TableDetailModel value) async {
    return _singleton?.setString(PREF_CURRENT_TABLE, jsonEncode(value.toJson()));
  }

  static Future<bool> clearCart() async {
    var result = await _singleton!.setString(PREF_BASKET, jsonEncode([].toList()));
    // EventBus().fire(EventModel(EVENT_UPDATE_CART, true));
    return result;
  }

  static List<BasketModel> getCartList() {
    var json = _singleton?.getString(PREF_BASKET);
    if (json == null) {
      return [];
    }
    var items = (jsonDecode(json) as List<dynamic>).map((js) => BasketModel.fromJson(js));
    return items.toList();
  }

  static double getCartCount(String id) {
    final items = PrefUtils.getCartList().where((element) => element.id == id).toList();
    return items.isNotEmpty ? items.first.count : 0.0;
  }

  static Future<bool> addToCart(BasketModel item) async {
    var items = getCartList();

    if (item.count == 0) {
      var index = 0;
      var removeIndex = -1;

      for (var element in items) {
        if (element.id == item.id) {
          removeIndex = index;
        }
        index++;
      }
      if (removeIndex > -1) {
        items.removeAt(removeIndex);
      }
    } else {
      var isHave = false;
      for (var element in items) {
        if (element.id == item.id) {
          element.count = item.count;

          isHave = true;
        }
      }

      if (!isHave) {
        items.add(item);
      }
    }

    var r = await _singleton!.setString(PREF_BASKET, jsonEncode(items.map((item) => item.toJson()).toList()));
    // EventBus().fire(EventModel(EVENT_UPDATE_CART, true));
    return r;
  }

//
// static UserInfoModel? getUser() {
//   if (_singleton?.getString(PREF_USER) == null) {
//     return null;
//   } else {
//     return UserInfoModel.fromJson(jsonDecode(_singleton?.getString(PREF_USER) ?? ""));
//   }
// }
//
// static Future<bool?> setUser(UserInfoModel value) async {
//   return _singleton?.setString(PREF_USER, jsonEncode(value.toJson()));
// }

}
