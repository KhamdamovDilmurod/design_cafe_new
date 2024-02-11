

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bdm_cafe/main.dart';
import 'package:bdm_cafe/model/base_model.dart';
import 'package:bdm_cafe/model/category_model.dart';
import 'package:bdm_cafe/model/food_category_model.dart';
import 'package:bdm_cafe/model/food_model.dart';
import 'package:bdm_cafe/model/table_model.dart';
import 'package:bdm_cafe/utils/constants.dart';
import 'package:bdm_cafe/utils/pref_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/chef/order_food_model.dart';
import '../model/chef/product_model.dart';
import '../model/event_model.dart';
import '../model/login_response.dart';
import '../model/table_detail_model.dart';
import '../utils/get_it.dart';

class ApiService {
  Dio dio = Dio();

  ApiService() {
    int time = 8000;
    dio.options.connectTimeout = time;
    dio.options.receiveTimeout = time;
    dio.options.sendTimeout = time;
    dio.options.headers.clear();
    dio.options.baseUrl = BASE_URL;
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers.addAll({
      'Authorization': "Bearer ${PrefUtils.getToken()}",
      'device': Platform.operatingSystem,
      'lang': PrefUtils.getLang(),
    });
    dio.interceptors.add(MyApp.alice.getDioInterceptor());
  }

  String wrapError(DioError error) {
    if (kDebugMode) {
      return error.message;
    }
    switch (error.type) {
      case DioErrorType.other:
        return "Tarmoqqa ulanishda muammo!";
      case DioErrorType.cancel:
        return "Unknown error.";
      case DioErrorType.connectTimeout:
        return "Murojat qilish vaqti tugadi!\nTarmoqqa ulanishda muammo!";
      case DioErrorType.receiveTimeout:
        return "Murojat qilish vaqti tugadi!\nTarmoqqa ulanishda muammo!";
      case DioErrorType.sendTimeout:
        return "Murojat qilish vaqti tugadi!\nTarmoqqa ulanishda muammo!";
      case DioErrorType.response:
        return "Ma'lumot kelishida xatolik!";
    }
    // return error.message;
  }

  BaseModel wrapResponse(Response response) {
    if (response.statusCode == 200) {
      final data = BaseModel.fromJson(response.data);
      if (data.success) {
        return data;
      } else {
        if (data.error_code == 401) {
          eventBus.fire(EventModel(event: EVENT_LOG_OUT, data: ""));
        }
      }
      return data;
    } else {
      return BaseModel(false, response.statusMessage ?? "Unknown error ${response.statusCode}", -1, null, []);
    }
  }

  //login
  Future<LoginResponse?> login(String phone, String password, StreamController<String> errorStream) async {
    try {
      final response = await dio.post("user/login",
          //queryParameters: {"phone": phone}
          data: jsonEncode({"username": phone, "password": password}));
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return LoginResponse.fromJson(baseData.data);
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }

  //Xonalar royxati
  Future<List<RoomModel>?> getRooms(StreamController<String> errorStream) async {
    try {
      final response = await dio.get("room",
          queryParameters: {});
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return (baseData.data as List<dynamic>).map((json) => RoomModel.fromJson(json)).toList();
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }


  //Xona bo'yicha stollar royxati
  Future<List<TableModel>?> getTableByRoom(id,StreamController<String> errorStream) async {
    try {
      final response = await dio.get("table/roomid/${id}",
          queryParameters: {});
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return (baseData.data as List<dynamic>).map((json) => TableModel.fromJson(json)).toList();
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }


  //Mening stollarim royxati
  Future<List<TableModel>?> getMyTables(StreamController<String> errorStream) async {
    try {
      final response = await dio.get("table/get-my-tables",
          queryParameters: {});
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return (baseData.data as List<dynamic>).map((json) => TableModel.fromJson(json)).toList();
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }


  //Bitta stol xaqida ma'lumot
  Future<TableDetailModel?> getTableId(tableId,StreamController<String> errorStream) async {
    try {
      final response = await dio.get("table/id/$tableId",
          queryParameters: {});
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return TableDetailModel.fromJson(baseData.data);
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }


  //Hamma taom guruhlari
  Future<List<FoodCategoryModel>?> getFoodCategories(StreamController<String> errorStream) async {
    try {
      final response = await dio.get("food-group",
          queryParameters: {});
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return (baseData.data as List<dynamic>).map((json) => FoodCategoryModel.fromJson(json)).toList();
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }


  //Taom guruhiga tegishli taomlar ro'yxati
  Future<List<FoodModel>?> getFoodListById(id,StreamController<String> errorStream) async {
    try {
      final response = await dio.get("food-group/group-id/$id",
          queryParameters: {});
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return (baseData.data as List<dynamic>).map((json) => FoodModel.fromJson(json)).toList();
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }


  //Bo'sh buyurtma yaratish va stolni band qilish
  Future<bool?> bronTable(roomId,tableId,StreamController<String> errorStream) async {
    try {
      final response = await dio.post("order/bron-table",
          data: jsonEncode({"room_id": roomId,"table_id": tableId}));
      final baseData = wrapResponse(response);
      if (baseData.success) {
        // return TableModel.fromJson(baseData.data);
        return true;
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }


  Future<bool?> add2Cart(orderId,foodId,count,type,StreamController<String> errorStream) async {
    try {
      final response = await dio.post("order/add-to-cart",
          data: jsonEncode({"order_id": orderId,"food_id": foodId,"count": count, "type": type}));
      final baseData = wrapResponse(response);
      if (baseData.success) {
        // return TableModel.fromJson(baseData.data);
        return true;
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }

  Future<bool?> sent2Prepare(orderId,StreamController<String> errorStream) async {
    try {
      final response = await dio.get("order/send-to-prepare/$orderId",
          queryParameters: {});
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return true;
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }

  // Oshpaz uchun
  // Oshpazga jo'natilgan zakaz taomlar ro'yxati uchun
  Future<List<OrderFoodModel>?> getOrderFood(String status,StreamController<String> errorStream) async {
    try {
      final response = await dio.get("order/get-order-food/$status",
          queryParameters: {});
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return (baseData.data as List<dynamic>).map((json) => OrderFoodModel.fromJson(json)).toList();
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }

  // Oshpaz uchun taomlar ro'yxati
  Future<List<ProductModel>?> getMyFoods(StreamController<String> errorStream) async {
    try {
      final response = await dio.get("food/get-my-foods",
          queryParameters: {});
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return (baseData.data as List<dynamic>).map((json) => ProductModel.fromJson(json)).toList();
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }

  // oshpaz uchun taomlarni boshlash
  Future<List<OrderFoodModel>?> send2Process(int id, StreamController<String> errorStream) async {
    try {
      final response = await dio.get("order/food-process/$id",
          queryParameters: {});
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return (baseData.data as List<dynamic>).map((json) => OrderFoodModel.fromJson(json)).toList();
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }

  // oshpaz uchun taomlarni tayyotlarini yakunlash
  Future<List<OrderFoodModel>?> send2Complete(int id, StreamController<String> errorStream) async {
    try {
      final response = await dio.get("order/food-complete/$id",
          queryParameters: {});
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return (baseData.data as List<dynamic>).map((json) => OrderFoodModel.fromJson(json)).toList();
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }

  // oshpaz uchun taomlarni o'chirib yoqish
  Future<List<ProductModel>?> controlFoods(int status, int foodId, StreamController<String> errorStream) async {
    try {
      final response = await dio.post("food/controll",
          data: jsonEncode({"status": status,"food_id": foodId}));
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return (baseData.data as List<dynamic>).map((json) => ProductModel.fromJson(json)).toList();
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }

  // oshpaz uchun taomlarni o'chirib yoqish
  Future<List<OrderFoodModel>?> cancelOrder(int id, String comment, StreamController<String> errorStream) async {
    try {
      final response = await dio.post("order/cancel",
          data: jsonEncode({"id": id,"comment": comment}));
      final baseData = wrapResponse(response);
      if (baseData.success) {
        return (baseData.data as List<dynamic>).map((json) => OrderFoodModel.fromJson(json)).toList();
      } else {
        errorStream.sink.add(baseData.message ?? "Error");
      }
    } on DioError catch (e) {
      errorStream.sink.add(wrapError(e));
    }
    return null;
  }
}