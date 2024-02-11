import 'package:bdm_cafe/screen/main_viewmodel.dart';
import 'package:bdm_cafe/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../../../generated/assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../../view/category_menu_view.dart';
import '../../../view/custom_views.dart';
import '../../../view/cart_item_view.dart';

class MenuScreen extends StatefulWidget {
  int categoryMenuId = 0;
  @override
  State<StatefulWidget> createState() {
    return MenuScreenState();
  }
}

class MenuScreenState extends State<MenuScreen> {
  var firstTimeStart = true;
  var _searchController = TextEditingController();


  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: COLOR_PRIMARY
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(viewModelBuilder: (){
      return MainViewModel();
    }, builder: (BuildContext context, MainViewModel viewModel, Widget? child){
      return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Stack(
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
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12,),
                        Text('Select Menu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
                        SizedBox(height: 12,),
                        CustomViews.buildSearchTextField(
                          "Search for something tasty ",
                          leadingIcon: Image.asset(Assets.imagesSearch, height: 18, width: 18, color: HINT_COLOR,),
                          controller: _searchController,
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 12,),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(height: 8,),
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
                                      element.checked = false;
                                    }
                                    item.checked = true;
                                    widget.categoryMenuId = item.id;
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
                                          widget.categoryMenuId = item.id;
                                          viewModel.getFoodById(widget.categoryMenuId);
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
                          viewModel.foodList.isNotEmpty?
                          ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              shrinkWrap: true,
                              primary: false,
                              scrollDirection: Axis.vertical,
                              itemCount: viewModel.foodList.length,
                              itemBuilder: (_, position) {
                                var item = viewModel.foodList[position];
                                return Container();
                              })
                              : Container(child: Text("Ma'lumot topilmadi !")),
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
    },
      onModelReady: (viewModel) {
        viewModel.errorData.listen((event) {
          showError(context, event);
        });

        viewModel.foodGroupData.listen((event) {
          if (widget.categoryMenuId == 0) {
            widget.categoryMenuId = event[0].id;
          }
          viewModel.getFoodById(widget.categoryMenuId);
        });

        viewModel.getFoodCategories();
      },);
  }
}
