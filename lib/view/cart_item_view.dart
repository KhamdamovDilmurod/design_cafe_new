import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/enum/enum.dart';
import '../model/table_detail_model.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';
import 'custom_views.dart';

class CartItemView extends StatefulWidget {
  final TableOrderProductModel item;
  Function updateCartCount;

  CartItemView({Key? key, required this.item, required this.updateCartCount}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CartItemViewState();
  }
}

class CartItemViewState extends State<CartItemView> {
  var cartCount = 1;
  var totalSum = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(color: WHITE, borderRadius: BorderRadius.circular(8), boxShadow: [
        BoxShadow(
          color: GRAY_COLOR.withOpacity(.5),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ]),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    // child: SizedBox(child: Image.asset("assets/images/${widget.item.image}")),
                    child: Container(
                        color: COLOR_YELLOW_LIGHT.withOpacity(.7),
                        height: 90,
                        width: 90,
                        child: CustomViews.buildNetworkImageWithoutRadius(widget.item.food.picture)),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.item.food.name,
                        style: asTextStyle(size: 16, fontWeight: FontWeight.w600),
                      ),
                      // SizedBox(height: 16),
                      Text(
                        "${widget.item.sell_price}",
                        style: asTextStyle(color: RED, size: 16),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        child: Text(getStatus(widget.item.status), style: asTextStyle(color: WHITE, size: 14)),
                        decoration: BoxDecoration(
                          color: getStatusColor(widget.item.status),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // add card
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                onTap: () {
                  if(widget.item.status == TableOrderProductStatusEnum.WAITING ){
                    if (widget.item.amount > 0) {
                      widget.item.newCount = widget.item.amount - 1;
                    }
                    widget.updateCartCount();
                  } else {
                    Fluttertoast.showToast(msg: 'Allaqachon jo\'natilgan');
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomLeft: Radius.circular
                        (8)), color:
                  RED),
                  child: Icon(
                    Icons.remove,
                    size: 18,
                    color: WHITE,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${widget.item.amount}",
                    style: asTextStyle(size: 16, fontWeight: FontWeight.bold, color: BLACK),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if(widget.item.status == TableOrderProductStatusEnum.WAITING ){
                    if (widget.item.amount > 0) {
                      widget.item.newCount = widget.item.amount + 1;
                    }
                    widget.updateCartCount();
                  } else {
                    Fluttertoast.showToast(msg: "Allaqachon jo'natilgan");
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomRight: Radius
                      .circular(8)), color: COLOR_GREEN),
                  child: const Icon(
                    Icons.add,
                    size: 18,
                    color: WHITE,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getStatus(TableOrderProductStatusEnum? statusEnum) {
    switch (statusEnum) {
      case TableOrderProductStatusEnum.WAITING:
        return "Jo'natilmagan";
      case TableOrderProductStatusEnum.SENDING:
        return "Jo'natildi";
      case TableOrderProductStatusEnum.PROCESSING:
        return "Tayyorlanishda";
      case TableOrderProductStatusEnum.COMPLETED:
        return "Tayyor";
      case TableOrderProductStatusEnum.CANCEL:
        return "Bekor qilindi";
    }
    return "";
  }

  Color getStatusColor(TableOrderProductStatusEnum? statusEnum) {
    switch (statusEnum) {
      case TableOrderProductStatusEnum.WAITING:
        return COLOR_YELLOW;
      case TableOrderProductStatusEnum.SENDING:
        return BLUE;
      case TableOrderProductStatusEnum.PROCESSING:
        return GRAY_COLOR;
      case TableOrderProductStatusEnum.COMPLETED:
        return COLOR_GREEN;
      case TableOrderProductStatusEnum.CANCEL:
        return Colors.red;
    }
    return COLOR_PRIMARY;
  }
}
