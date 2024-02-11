import 'dart:async';

import 'package:bdm_cafe/screen/chef/chef_viewmodel.dart';
import 'package:bdm_cafe/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';

import '../../../../model/event_model.dart';
import '../../../../socket/socket_service.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/get_it.dart';
import '../../../../utils/utils.dart';
import '../../../../view/chef_product_item_view.dart';

class NewOrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewOrderPageState();
  }
}

class NewOrderPageState extends State<NewOrderPage> {

  StreamSubscription? _eventBusListener;

  final TextEditingController _commentController = TextEditingController();

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
                        return ChefProductItemView(
                          item: item, onPressed: () {
                            viewModel.send2Process(item.id);
                        },
                          onCancelClicked: (){
                            commentBottomSheet(viewModel, item.id);
                          },
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

        SocketService.getInstance();
        _eventBusListener = eventBus.on<EventModel>().listen((event) {
          if (event.event == EVENT_UPDATE_ORDERS) {
          viewModel.getOrderFood("waiting");
          Fluttertoast.showToast(
              msg: "update order",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
          print("EVENT_UPDATE_ORDERS");
          }
        });
        viewModel.getOrderFood("waiting");

        viewModel.errorData.listen((event) {
          showError(context, event);
        });

        viewModel.send2ProcessData.listen((event) {
          viewModel.getOrderFood("waiting");
        });

        viewModel.cancelOrderData.listen((event) {
          viewModel.getOrderFood("waiting");
          Fluttertoast.showToast(
              msg: "order canceled",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        });
      },
    );

  }

  void commentBottomSheet(ChefViewModel viewModel, int id){
    final focusNode = FocusNode();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      // isDismissible: false,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: COLOR_GREY,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                    blurRadius: 0,
                  ),
                  BoxShadow(
                    color: COLOR_GREY,
                    offset: Offset(-2, 2),
                    spreadRadius: 0,
                    blurRadius: 0,
                  ),
                ],
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Rad etish sababini kiriting: ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 10,),
                  TextField(
                    controller: _commentController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      hintText: 'Sabab',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: COLOR_PRIMARY),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    focusNode: focusNode,
                    cursorColor: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(COLOR_PRIMARY),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: const Text('Yuborish', style: TextStyle(color: Colors.white, fontSize: 16,fontFamily:'Roboto', fontWeight: FontWeight.w500,)),
                        onPressed: (){
                          viewModel.cancelOrder(id, _commentController.text.toString());
                          Navigator.pop(context);
                        }
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _eventBusListener?.cancel();
    super.dispose();
  }
}
