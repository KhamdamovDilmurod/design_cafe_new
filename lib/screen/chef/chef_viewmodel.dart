import 'dart:async';

import 'package:bdm_cafe/model/chef/order_food_model.dart';
import 'package:bdm_cafe/model/chef/product_model.dart';
import 'package:stacked/stacked.dart';

import '../../api/api_service.dart';
import '../../utils/get_it.dart';

class ChefViewModel extends BaseViewModel{

  final api = getIt.get<ApiService>();
  final StreamController<String> _errorStream = StreamController();

  var progressData = false;

  Stream<String> get errorData {
    return _errorStream.stream;
  }

  // ordered food list
  List<OrderFoodModel> foodList = [];

  void getOrderFood(String status) async {
    progressData = true;
    notifyListeners();
    final data = await api.getOrderFood(status,_errorStream);
    if (data != null) {
      foodList = data;
    }
    progressData =  false;
    notifyListeners();
  }

  // food list
  List<ProductModel> foods = [];

  void getFoods() async {
    progressData = true;
    notifyListeners();
    final data = await api.getMyFoods(_errorStream);
    if (data != null) {
      foods = data;
    }
    progressData =  false;
    notifyListeners();
  }


  // send process
  StreamController<List<OrderFoodModel>> _send2ProcessData = StreamController();

  Stream<List<OrderFoodModel>> get send2ProcessData {
    return _send2ProcessData.stream;
  }
  void send2Process(int id) async {
    progressData = true;
    notifyListeners();
    final data = await api.send2Process(id,_errorStream);
    if (data != null) {
      _send2ProcessData.sink.add(data);
    }
    progressData =  false;
    notifyListeners();
  }

  // send complete
  StreamController<List<OrderFoodModel>> _send2CompleteData = StreamController();

  Stream<List<OrderFoodModel>> get send2CompleteData {
    return _send2CompleteData.stream;
  }
  void send2Complete(int id) async {
    progressData = true;
    notifyListeners();
    final data = await api.send2Complete(id,_errorStream);
    if (data != null) {
      _send2CompleteData.sink.add(data);
    }
    progressData =  false;
    notifyListeners();
  }

  // control foods
  StreamController<List<ProductModel>> _controlFoodData = StreamController();

  Stream<List<ProductModel>> get controlFoodData {
    return _controlFoodData.stream;
  }
  void controlFoods(int status, int foodId) async {
    progressData = true;
    notifyListeners();
    final data = await api.controlFoods(status, foodId,_errorStream);
    if (data != null) {
      _controlFoodData.sink.add(data);
    }
    progressData =  false;
    notifyListeners();
  }

  // cancel order
  StreamController<List<OrderFoodModel>> _cancelOrderData = StreamController();

  Stream<List<OrderFoodModel>> get cancelOrderData {
    return _cancelOrderData.stream;
  }
  void cancelOrder(int id, String comment) async {
    progressData = true;
    notifyListeners();
    final data = await api.cancelOrder(id, comment,_errorStream);
    if (data != null) {
      _cancelOrderData.sink.add(data);
    }
    progressData =  false;
    notifyListeners();
  }

}