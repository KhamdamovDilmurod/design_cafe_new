

import 'dart:async';

import 'package:bdm_cafe/model/category_model.dart';
import 'package:bdm_cafe/model/food_category_model.dart';
import 'package:bdm_cafe/model/food_model.dart';
import 'package:bdm_cafe/model/table_model.dart';
import 'package:bdm_cafe/utils/pref_utils.dart';
import 'package:stacked/stacked.dart';

import '../api/api_service.dart';
import '../model/table_detail_model.dart';
import '../utils/get_it.dart';

class MainViewModel extends BaseViewModel {
  final api = getIt.get<ApiService>();
  final StreamController<String> _errorStream = StreamController();

  Stream<String> get errorData {
    return _errorStream.stream;
  }

  StreamController<bool> _bronTableStream = StreamController();

  Stream<bool> get bronTableData {
    return _bronTableStream.stream;
  }

  StreamController<bool> _add2CartStream = StreamController();

  Stream<bool> get add2CartData {
    return _add2CartStream.stream;
  }

  StreamController<List<TableModel>> _tableListStream = StreamController();

  Stream<List<TableModel>> get tableListData {
    return _tableListStream.stream;
  }

  StreamController<List<TableModel>> _myTableDataStream = StreamController();

  Stream<List<TableModel>> get myTableData {
    return _myTableDataStream.stream;
  }

  StreamController<TableDetailModel> _tableIdStream = StreamController();

  Stream<TableDetailModel> get tableIdData {
    return _tableIdStream.stream;
  }

  StreamController<List<RoomModel>> _roomsStream = StreamController();

  Stream<List<RoomModel>> get roomsData {
    return _roomsStream.stream;
  }

  StreamController<List<FoodCategoryModel>> _foodGroupStream = StreamController();

  Stream<List<FoodCategoryModel>> get foodGroupData {
    return _foodGroupStream.stream;
  }

  StreamController<bool> _sent2PrepareStream = StreamController();

  Stream<bool> get sent2PrepareData {
    return _sent2PrepareStream.stream;
  }

  var progressData = false;
  List<RoomModel> rooms = [];
  List<TableModel> tableList = [];
  List<TableModel> myTablesList = [];
  TableDetailModel? tableItem;
  List<FoodCategoryModel> foodGroupList = [];
  List<FoodModel> foodList = [];

  void getRooms() async {
    progressData = true;
    notifyListeners();
    final data = await api.getRooms(_errorStream);
    if (data != null) {
      rooms = data;
      _roomsStream.sink.add(rooms);
    }
    progressData = false;
    notifyListeners();
  }

  void getTableByRoom(int id) async {
    progressData = true;
    notifyListeners();
    final data = await api.getTableByRoom(id,_errorStream);
    if (data != null) {
      tableList = data as List<TableModel>;
      _tableListStream.sink.add(tableList);
    }
    progressData = false;
    notifyListeners();
  }

  void getMyTables() async {
    progressData = true;
    notifyListeners();
    final data = await api.getMyTables(_errorStream);
    if (data != null) {
      myTablesList = data;
      _myTableDataStream.sink.add(myTablesList);
    }
    progressData = false;
    notifyListeners();
  }

  void getTableId(int tableId) async {
    progressData = true;
    notifyListeners();
    final data = await api.getTableId(tableId,_errorStream);
    if (data != null) {
      tableItem = data;
      await PrefUtils.setCurrentTable(data);
      _tableIdStream.sink.add(data);
    }
    progressData = false;
    notifyListeners();
  }

  void getFoodCategories() async {
    progressData = true;
    notifyListeners();
    final data = await api.getFoodCategories(_errorStream);
    if (data != null) {
      foodGroupList = data;
      _foodGroupStream.sink.add(data);
    }
    progressData =  false;
    notifyListeners();
  }

  void getFoodById(int groupId) async {
    progressData = true;
    notifyListeners();
    final data = await api.getFoodListById(groupId,_errorStream);
    if (data != null) {
      foodList = data;
    }
    progressData =  false;
    notifyListeners();
  }

  void bronTable(int roomId,int tableId) async {
    progressData = true;
    notifyListeners();
    final data = await api.bronTable(roomId,tableId,_errorStream);
    if (data != null) {
      // foodList = data;
      _bronTableStream.sink.add(true);
    }
    progressData =  false;
    notifyListeners();
  }

  void add2Cart(int orderId,int foodId, int count, String type) async {
    progressData = true;
    notifyListeners();
    final data = await api.add2Cart(orderId,foodId,count,type, _errorStream);
    if (data != null) {
      _add2CartStream.sink.add(true);
    }
    progressData =  false;
    notifyListeners();
  }

  void sent2Prepare(int orderId) async {
    progressData = true;
    notifyListeners();
    final data = await api.sent2Prepare(orderId,_errorStream);
    if (data != null) {
      _sent2PrepareStream.sink.add(data);
    }
    progressData =  false;
    notifyListeners();
  }

}