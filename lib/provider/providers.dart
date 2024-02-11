
import 'package:bdm_cafe/model/food_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/basket_model.dart';
import '../utils/constants.dart';
import '../utils/pref_utils.dart';

class Providers extends ChangeNotifier {
  Providers();

  var index = 0;
  var message_count = 0;

  List<FoodModel> cartItems = [];
  // List<ProductModel> favProductItems = [];

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  void setIndex(int count) {
    index = count;
    notifyListeners();
  }

  int getIndex() {
    return index;
  }

  void setBadgeCount(int count){
    message_count = count;
    notifyListeners();
  }

  int getBadgeCount(){
    return message_count;
  }

  void addToCart(String id, double count, double price) {
    PrefUtils.addToCart(BasketModel(id, count, price));
    notifyListeners();
  }

  // List<FoodModel> getCartItems(){
  //   cartItems = [];
  //   if (Constants.updateCart.isNotEmpty) {
  //     Constants.updateCart.forEach((element) {
  //       PrefUtils.getCartList().forEach((item) {
  //         if (element.id == item.id) {
  //           element.cartCount = item.count;
  //           element.cartCashback = item.keshbek;
  //           cartItems.add(element);
  //         }
  //       });
  //     });
  //   }  else{
  //     box.values.forEach((element) {
  //       PrefUtils.getCartList().forEach((item) {
  //         if (element.id == item.id) {
  //           element.cartCount = item.count;
  //           element.cartCashback = item.keshbek;
  //           cartItems.add(element);
  //         }
  //       });
  //     });
  //   }
  //   return cartItems;
  // }

  // double getTotalSum(){
  //   var totalSum = 0.0;
  //   for (var it in PrefUtils.getCartList()) {
  //     totalSum += it.count * it.price;
  //   }
  //   return totalSum;
  // }
  //
  // double getTotalCashback(){
  //   var totalCash = 0.0;
  //   for (var it in PrefUtils.getCartList()) {
  //     totalCash += it.keshbek;
  //   }
  //   return totalCash;
  // }
  //
  // List<ProductModel> getFav(){
  //   favProductItems = [];
  //   box.values.forEach((element) {
  //     if (element.favorite) favProductItems.add(element);
  //   });
  //   return favProductItems;
  // }
  //
  // void setFav(item){
  //   PrefUtils.setFavoriteProduct(item);
  //   notifyListeners();
  // }
  //
  // void setOrderList(List<OrderModel> items){
  //   Constants.orderList = [];
  //   Constants.orderList = items;
  //   notifyListeners();
  // }
  //
  // List<OrderModel> getOrderList(){
  //   return Constants.orderList;
  // }

  // void setUpdateCart(items){
  //   Constants.updateCart = [];
  //   Constants.updateCart = items;
  //   notifyListeners();
  // }
}
