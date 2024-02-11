import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';

import '../../../../utils/utils.dart';
import '../../../../view/chef_completed_item_view.dart';
import '../../chef_viewmodel.dart';

class CompletedOrderPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CompletedOrderPageState();
  }
  
}
class CompletedOrderPageState extends State<CompletedOrderPage>{
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChefViewModel>.reactive(
      viewModelBuilder: () {
        return ChefViewModel();
      },
      builder: (BuildContext context, ChefViewModel viewModel, Widget? child) {
        return Stack(
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
                      itemCount: viewModel.foodList.length,
                      itemBuilder: (_, position) {
                        var item = viewModel.foodList[position];
                        return ChefCompletedItemView(
                          item: item
                        );
                      }),
                ],
              ),
            ),
            if (viewModel.progressData) showAsProgress(),
          ],
        );
      },
      onViewModelReady: (viewModel) {

        viewModel.getOrderFood("done");

        viewModel.errorData.listen((event) {
          showError(context, event);
        });

      },
    );
  }
  
}