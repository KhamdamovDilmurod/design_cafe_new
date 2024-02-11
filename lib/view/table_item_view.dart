import 'package:bdm_cafe/utils/colors.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/table_model.dart';
import '../utils/app_colors.dart';

class TableItemView extends StatefulWidget {
  TableModel item;

  TableItemView({Key? key, required this.item}) : super(key: key);

  @override
  State<TableItemView> createState() => _TableItemViewState();
}

class _TableItemViewState extends State<TableItemView> {
  @override
  Widget build(BuildContext context) {
    return widget.item.own == 0
        ? Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 4, bottom: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: GRAY_COLOR.withOpacity(.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  color: widget.item.own == 0?COLOR_GREEN:Colors.red
                ),
              ),
              Spacer(),
              Text(
                "${widget.item.id}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PTSansCaption'),
              )
            ],
          ),
          Image.asset("assets/images/ic_terrace.png",height: 56,width: 56,),
        ],
      ),
    )
        : Container(
      decoration: DottedDecoration(
        // color: Colors.white,
        shape: Shape.box,
        borderRadius: BorderRadius.circular(8), //remove this to get plane rectange
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8.0),
      //   color: AppColors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.3),
      //       spreadRadius: 3,
      //       blurRadius: 7,
      //       offset: Offset(0, 3), // changes position of shadow
      //     ),
      //   ],
      // ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: GRAY_COLOR.withOpacity(.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: widget.item.own == 0?COLOR_GREEN:COLOR_PRIMARY
                ),
              ),
              Spacer(),
              Text(
                "${widget.item.id}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PTSansCaption'),
              )
            ],
          ),
          Image.asset("assets/images/ic_man.png",height: 56,width: 56,),
        ],
      ),
    );
  }
}
