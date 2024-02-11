import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/colors.dart';
import '../../../view/bill_generation_item_view.dart';
import '../../../view/custom_views.dart';

class BillGenerationScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return BillGenerationScreenState();
  }
  
}
class BillGenerationScreenState extends State<BillGenerationScreen>{


  var _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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
                  Text('Bill Generation', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
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
                    ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal:8,vertical: 8),
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: 44,
                        itemBuilder: (_, position) {
                          return BillGenerationItemView();
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}