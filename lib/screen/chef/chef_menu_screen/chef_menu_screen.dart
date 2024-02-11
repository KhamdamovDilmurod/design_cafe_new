import 'package:bdm_cafe/screen/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../generated/assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../../view/category_menu_view.dart';
import '../../../view/chef_menu_item_view.dart';
import '../../../view/custom_views.dart';
import '../../../view/product_item_view.dart';
import '../chef_viewmodel.dart';

class ChefMenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChefMenuScreenState();
  }
}

class ChefMenuScreenState extends State<ChefMenuScreen> {
  var _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChefViewModel>.reactive(
      viewModelBuilder: () {
        return ChefViewModel();
      },
      builder: (BuildContext context, ChefViewModel viewModel, Widget? child) {
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Select Menu',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
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
                    Expanded(
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                ListView.builder(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                    shrinkWrap: true,
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount: viewModel.foods.length,
                                    itemBuilder: (_, position) {
                                      var item = viewModel.foods[position];
                                      return ChefMenuItemView(item: item,
                                        onPressed: (newStatus) {
                                          viewModel.controlFoods(newStatus ? 1 : 0, item.id);
                                        },);
                                    }),
                              ],
                            ),
                          ),
                          if (viewModel.progressData) showAsProgress(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      onViewModelReady: (viewModel) {
        viewModel.getFoods();

        viewModel.errorData.listen((event) {
          showError(context, event);
        });

        viewModel.controlFoodData.listen((event) {
          viewModel.getFoods();
        });
      },
    );
  }
}
