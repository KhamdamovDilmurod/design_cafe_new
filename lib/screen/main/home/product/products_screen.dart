import 'dart:async';

import 'package:bdm_cafe/screen/main_viewmodel.dart';
import 'package:bdm_cafe/utils/app_colors.dart';
import 'package:bdm_cafe/utils/pref_utils.dart';
import 'package:bdm_cafe/view/custom_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/utils.dart';
import '../../../../view/category_menu_view.dart';
import '../../../../view/product_item_view.dart';

var categoryMenuId = 0;

class ProductsScreen extends StatefulWidget {
  int tableId;

  ProductsScreen({Key? key, required this.tableId}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var firstTimeStart = true;
  var _searchController = TextEditingController();


  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: COLOR_PRIMARY));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () {
      return MainViewModel();
    }, builder: (BuildContext context, MainViewModel viewModel, Widget? child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: COLOR_PRIMARY,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, offset: Offset(1, -1), spreadRadius: 0, blurRadius: 0),
                        BoxShadow(color: Colors.grey, offset: Offset(-1, -1), spreadRadius: 0, blurRadius: 0)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            // IconButton(splashColor: Colors.red,focusColor: Colors.red, onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
                            InkWell(
                                onTap: () {
                                  finishScreen(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: WHITE,
                                    size: 24,
                                  ),
                                )),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "${PrefUtils.getCurrentTable()?.table.room_name} - ${PrefUtils.getCurrentTable()?.table.name} ",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        CustomViews.buildSearchTextField(
                          "Search for something tasty ",
                          leadingIcon: Image.asset(
                            Assets.imagesSearch,
                            height: 18,
                            width: 18,
                            color: HINT_COLOR,
                          ),
                          controller: _searchController,
                          inputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 8),
                  // Row(
                  //   children: [
                  //     SizedBox(width: 8),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.all(Radius.circular(24)), border: Border.all(color: AppColors.gray_dark2)),
                  //       child: Container(
                  //         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //         child: Row(
                  //           children: [
                  //             Text(PrefUtils.getCurrentTable()?.table.room_name ?? "        ", style: TextStyle(fontWeight:
                  //             FontWeight
                  //                 .w700)),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 8,
                  //     ),
                  //     Container(
                  //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.all(Radius.circular(24)), border: Border.all(color: AppColors.gray_dark2)),
                  //       child: Row(
                  //         children: [
                  //           Text(PrefUtils.getCurrentTable()?.table.name ?? "        ", style: TextStyle(fontWeight: FontWeight.w500)),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 8,
                  ),

                  Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                Container(
                                  height: 56,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: viewModel.foodGroupList.length,
                                      itemBuilder: (_, position) {
                                        var item = viewModel.foodGroupList[position];

                                        if (firstTimeStart) {
                                          for (var element in viewModel.foodGroupList) {
                                            if (element.id == categoryMenuId) {
                                              element.checked = true;
                                              break;
                                            }
                                          }
                                          firstTimeStart = false;
                                        }

                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                          ),
                                          child: InkWell(
                                              borderRadius: BorderRadius.circular(16),
                                              onTap: () {
                                                setState(() {
                                                  for (var element in viewModel.foodGroupList) {
                                                    element.checked = false;
                                                  }
                                                  item.checked = true;
                                                });
                                                categoryMenuId = item.id;
                                                viewModel.getFoodById(categoryMenuId);
                                              },
                                              child: CategoryMenuView(
                                                item: item,
                                              )),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ListView.builder(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                    shrinkWrap: true,
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: viewModel.foodList.length,
                                    itemBuilder: (_, position) {
                                      var item = viewModel.foodList[position];
                                      return ProductItemView(
                                        item: item,
                                        add2Cart: (int count){
                                          // Fluttertoast.showToast(msg: "$count");

                                          var table = PrefUtils.getCurrentTable();
                                          if (table?.order != null) {
                                          viewModel.add2Cart(table!.order!.order_id, item.id, count, MENU);
                                          }  else {
                                            Fluttertoast.showToast(msg: "Iltimos oldin buyurtma yarating.");
                                          }
                                        },
                                      );
                                    }),
                                SizedBox(
                                  height: 70,
                                )
                              ],
                            ),
                          ),
                        ),
                ],
              ),
              if (viewModel.progressData) showAsProgress(),
            ],
          ),
        ),
      );
    }, onModelReady: (viewModel) {
      viewModel.errorData.listen((event) {
        showError(context, event);
      });

      viewModel.foodGroupData.listen((event) {
        if (categoryMenuId == 0) {
          categoryMenuId = event[0].id;
        }
        viewModel.getFoodById(categoryMenuId);
      });

      viewModel.add2CartData.listen((event) {
        Fluttertoast.showToast(msg: "Savatga saqlandi.");
      });

      if (viewModel.tableItem?.table.active != 0) {
        viewModel.getFoodCategories();
      }
    });
  }
}
