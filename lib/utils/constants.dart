import 'dart:core';
import 'package:bdm_cafe/model/food_model.dart';


const String URL_COMPANY = 'http://bdm.uz';
const SECRET_NAME = "BDM";
const APP_TYPE = "";
const BDM_BASE_URL = "http://isti.uz/mobiles/ load_config/";


// const BASE_URL_SOCKET = "http://192.168.88.106:4000";
const BASE_URL_SOCKET = "http://194.113.153.92:63005";
// const BASE_URL = "http://192.168.88.106:4000/api/v1/mobile/";
const BASE_URL = "http://194.113.153.92:63005/api/v1/mobile/";

const server_link = "http://195.158.11.92:60003/";

// var BASE_IMAGE_URL = "http://${PrefUtils.getBaseImageUrl()}";
var BASE_IMAGE_URL = "http://194.113.153.92:63005/api/v1/uploads/";
const HOST_VOICE_USERS = "http://info.bdmgroup.uz/backend/web/users_at_clients_voice/";
const HOST_VOICE_CLIENT = "http://info.bdmgroup.uz/backend/web/clients_at_users_voice/";

const BASE_URL_VOICE = "http://85.193.87.168:3010/upload/";
// const BASE_URL_VOICE = "http://192.168.88.21:3010/upload/";

const UZ_LANG_KEY = "uz";
const RU_LANG_KEY = "ru";
const DEFAULT_LANG_KEY = UZ_LANG_KEY;

const MENU = "menu";
const CART = "cart";

const EVENT_UPDATE_CART = 1;
const EVENT_LOG_OUT = 2;
const EVENT_TABLE_UPDATE = 3;
const EVENT_UPDATE_ORDERS = 4;

class Constants{
  static List<FoodModel> updateCart = [];
}

// List<TableModel> tableList = [
//   TableModel("01", "2", "12:00", "00:28", false),
//   TableModel("02", "2", "12:00", "00:28", true),
//   TableModel("03", "2", "12:18", "00:10", false),
//   TableModel("04", "4", "12:00", "00:28", true),
//   TableModel("05", "2", "12:00", "00:28", true),
//   TableModel("06", "4", "12:00", "00:28", true),
//   TableModel("07", "3", "12:00", "00:28", true),
//   TableModel("08", "4", "12:00", "00:28", false),
//   TableModel("09", "3", "12:00", "00:28", true),
//   TableModel("10", "4", "12:00", "00:28", false),
//   TableModel("11", "3", "12:00", "00:28", false),
//   TableModel("12", "2", "12:00", "00:28", true),
//   TableModel("13", "3", "12:00", "00:28", true),
//   TableModel("14", "1", "12:00", "00:28", true),
//   TableModel("15", "1", "12:00", "00:28", true),
//   TableModel("16", "1", "12:00", "00:28", false),
//   TableModel("17", "1", "12:00", "00:28", false),
//   TableModel("18", "1", "12:00", "00:28" , false),
// ];

// List<CategoryModel> categoryList = [
//   CategoryModel(1, "Asosiy"),
//   CategoryModel(2, "1-qavat"),
//   CategoryModel(3, "2-qavat"),
//   CategoryModel(4, "Tashqari"),
// ];

// List<CategoryModel> categoryMenuList = [
//   CategoryModel(1, "Birinchisi"),
//   CategoryModel(2, "Ikkinchisi"),
//   CategoryModel(3, "Suvlar"),
//   CategoryModel(4, "Salatlar"),
//   CategoryModel(5, "Shirinliklar"),
// ];

List<FoodModel> foodMenuList = [
  FoodModel(1, "K F C",17000,"kfc.png", "pors",1),
  FoodModel(2, "Palov", 20000,"palov.png", "pors",1),
  FoodModel(3, "PlaceHolder",25000,"placeholder.jpg", "pors",1),
  FoodModel(4, "Palov", 250000,"palov.png", "pors",1),
  FoodModel(5, "Palov", 250000,"palov.png", "pors",1),
];

