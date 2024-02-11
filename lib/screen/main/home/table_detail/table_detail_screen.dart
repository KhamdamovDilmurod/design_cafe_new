import 'dart:async';

import 'package:bdm_cafe/screen/main/bill_generation_screen/bill_generation_screen.dart';
import 'package:bdm_cafe/screen/main/payment/payment_screen.dart';
import 'package:bdm_cafe/screen/main_viewmodel.dart';
import 'package:bdm_cafe/utils/colors.dart';
import 'package:bdm_cafe/view/cart_item_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../model/enum/enum.dart';
import '../../../../model/event_model.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/get_it.dart';
import '../../../../utils/utils.dart';

class TableDetailScreen extends StatefulWidget {
  int tableId;

  TableDetailScreen({Key? key, required this.tableId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TableDetailScreenState();
  }
}

class TableDetailScreenState extends State<TableDetailScreen> {
  StreamSubscription? _busEventListener;
  var summa = 0;
  var waitingCount = 0;

  @override
  void dispose() {
    _busEventListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () {
        return MainViewModel();
      },
      builder: (BuildContext context, MainViewModel viewModel, Widget? child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Order Summary",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              elevation: 1,
              leading: IconButton(
                icon: SizedBox(
                    height: 24,
                    width: 24,
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: COLOR_PRIMARY,
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Stack(
              children: [
                (viewModel.tableItem?.table.active == 0 && !viewModel.progressData)
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            viewModel.bronTable(viewModel.tableItem!.table.room_id, viewModel.tableItem!.table.id);
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: HINT_COLOR,
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(0, 2), // changes position of shadow
                                    ),
                                  ],
                                  color: COLOR_PRIMARY),
                              width: getScreenWidth(context),
                              height: 54,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Band qilish",
                                  style: asTextStyle(size: 18, fontWeight: FontWeight.w700, color: BLACK),
                                ),
                              )),
                        ),
                      )
                    : Column(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 16.0, bottom: 4, left: 24, right: 24),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Container(
                          //         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          //         decoration: BoxDecoration(
                          //           color: LIGHT_RED,
                          //           borderRadius: BorderRadius.circular(8),
                          //         ),
                          //         child: Text('Table - AOI', style: TextStyle(color: Colors.black, fontSize: 16),),
                          //       ),
                          //       SizedBox(width: 20,),
                          //       Container(
                          //         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          //         decoration: BoxDecoration(
                          //           color: LIGHT_RED,
                          //           borderRadius: BorderRadius.circular(8),
                          //         ),
                          //         child: Text('Cover - 5  ', style: TextStyle(color: Colors.black, fontSize: 16),),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  if (viewModel.tableItem != null)
                                    ListView.builder(
                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                        shrinkWrap: true,
                                        primary: false,
                                        scrollDirection: Axis.vertical,
                                        itemCount: viewModel.tableItem!.order!.foods.length ?? 0,
                                        itemBuilder: (_, position) {
                                          var item = viewModel.tableItem?.order!.foods[position];
                                          return CartItemView(item: item!,
                                              updateCartCount: () {
                                            viewModel.add2Cart(item.order_id, item.food_id, item.newCount!, CART);
                                              }
                                          );
                                        }),
                                ],
                              ),
                            ),
                          ),

                          if (viewModel.tableItem != null)
                            Container(
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, offset: Offset(1, -1), spreadRadius: 0, blurRadius: 0),
                                    BoxShadow(color: Colors.grey, offset: Offset(-1, -1), spreadRadius: 0, blurRadius: 0)
                                  ]),
                              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jo'natilmagan: $waitingCount ta",
                                        style: TextStyle(fontSize: 14, color: BLACK),
                                      ),
                                      Text(
                                        "Summa: $summa so'm",
                                        style: TextStyle(fontSize: 14, color: BLACK),
                                      ),
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  InkWell(
                                    onTap: () {
                                      if(waitingCount>0){
                                        viewModel.sent2Prepare(viewModel.tableItem!.order!.order_id);
                                      } else {
                                        showWarning(context, "Savatdagi barcha buyurtmalar jo'natilgan");
                                      }
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: COLOR_YELLOW,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.only(left: 4.0, top: 4, bottom: 4, right: 12.0),
                                        child: Icon(Icons.send_rounded, color: WHITE)),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: BLUE,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.all(8),
                                      margin: EdgeInsets.only(left: 4.0, top: 4, bottom: 4, right: 12.0),
                                      child: Icon(Icons.price_change_outlined, color: WHITE)),
                                  InkWell(
                                    onTap: (){

                                      Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentScreen()));
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (_) => ChefMainScreen()));
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: COLOR_GREEN,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.only(left: 4.0, top: 4, bottom: 4, right: 4.0),
                                        child: Icon(Icons.account_balance_wallet_outlined, color: WHITE)),
                                  ),
                                ],
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

        viewModel.bronTableData.listen((event) {
          eventBus.fire(EventModel(event: EVENT_TABLE_UPDATE, data: ""));
          viewModel.getTableId(viewModel.tableItem!.table.id);
        });

        viewModel.sent2PrepareData.listen((event) {
          viewModel.getTableId(widget.tableId);
        });

        viewModel.add2CartData.listen((event) {
          viewModel.getTableId(widget.tableId);
        });

        viewModel.tableIdData.listen((event) {
          summa = 0;
          waitingCount = 0;
          if (event.order != null) {
            event.order?.foods.forEach((element) {
              if (element.status != TableOrderProductStatusEnum.CANCEL) {
                summa += element.sell_price * element.amount;
              }
              if (element.status == TableOrderProductStatusEnum.WAITING) {
                waitingCount++;
              }
            });
          }
          setState(() {});
        });

        viewModel.getTableId(widget.tableId);
      },
    );
  }
}
