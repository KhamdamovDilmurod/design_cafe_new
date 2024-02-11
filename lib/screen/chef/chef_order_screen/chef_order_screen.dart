import 'package:bdm_cafe/generated/assets.dart';
import 'package:bdm_cafe/screen/chef/chef_order_screen/status/completed_order_page.dart';
import 'package:bdm_cafe/screen/chef/chef_order_screen/status/new_order_page.dart';
import 'package:bdm_cafe/screen/chef/chef_order_screen/status/waiting_order_page.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../view/chef_completed_item_view.dart';
import '../../../view/chef_product_item_view.dart';

class ChefOrderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChefOrderScreenState();
  }
}

class ChefOrderScreenState extends State<ChefOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Row(
            children: [
              Image.asset(Assets.imagesChef, color: WHITE, width: 32, height: 32,),
              SizedBox(width: 10,),
              Text(
                'Chef',
                style: TextStyle(color: WHITE, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: COLOR_PRIMARY,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 12),
            tabs: [
              Tab(
                  icon: Image.asset(
                    Assets.imagesNew,
                    width: 24,
                    height: 24,
                    color: WHITE,
                  )),
              Tab(
                  icon: Image.asset(
                Assets.imagesProcessingTime,
                width: 24,
                height: 24,
                color: WHITE,
              )),
              Tab(
                  icon: Image.asset(
                Assets.imagesCompleted,
                width: 24,
                height: 24,
                color: WHITE,
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // inProgress(),
            // completed(),
            // completed2(),
            NewOrderPage(),
            DoingOrderPage(),
            CompletedOrderPage(),
          ],
        ),
      ),
    );
  }
  //
  // Widget inProgress() {
  //   return SingleChildScrollView(
  //     physics: BouncingScrollPhysics(),
  //     child: Column(
  //       children: [
  //         ListView.builder(
  //             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  //             shrinkWrap: true,
  //             primary: false,
  //             scrollDirection: Axis.vertical,
  //             itemCount: 14,
  //             itemBuilder: (_, position) {
  //               var item = foodMenuList[1];
  //               return ChefProductItemView(
  //                 item: item,
  //               );
  //             }),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget completed() {
  //   return SingleChildScrollView(
  //     physics: BouncingScrollPhysics(),
  //     child: Column(
  //       children: [
  //         ListView.builder(
  //             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  //             shrinkWrap: true,
  //             primary: false,
  //             scrollDirection: Axis.vertical,
  //             itemCount: 14,
  //             itemBuilder: (_, position) {
  //               return ChefCompletedItemView();
  //             }),
  //       ],
  //     ),
  //   );
  // }
  // Widget completed2() {
  //   return SingleChildScrollView(
  //     physics: BouncingScrollPhysics(),
  //     child: Column(
  //       children: [
  //         ListView.builder(
  //             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  //             shrinkWrap: true,
  //             primary: false,
  //             scrollDirection: Axis.vertical,
  //             itemCount: 14,
  //             itemBuilder: (_, position) {
  //               return ChefCompletedItemView();
  //             }),
  //       ],
  //     ),
  //   );
  // }
}
