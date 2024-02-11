import 'package:bdm_cafe/view/order_status_item_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../generated/assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../../view/category_menu_view.dart';
import '../../../view/custom_views.dart';
import '../../../view/product_item_view.dart';

class OrderStatusScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return OrderStatusScreenState();
  }
  
}
class OrderStatusScreenState extends State<OrderStatusScreen>{

  var _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Colors.red,
      backgroundColor: AppColors.background_color,
      body: SafeArea(
        child: Column(
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
                  Text('Order ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
                  SizedBox(height: 12,),
                  CustomViews.buildSearchTextField(
                    "Search . . . ",
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
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    itemCount: 9,
                    itemBuilder: (_, position) {
                      return OrderStatusItemView();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}