import 'dart:ui';

import 'package:bdm_cafe/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/utils.dart';


class BranchItemView extends StatefulWidget {
  final RoomModel item;

  const BranchItemView({Key? key, required this.item})
      : super(key: key);

  @override
  State<BranchItemView> createState() => _BranchItemViewState();
}

class _BranchItemViewState extends State<BranchItemView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      shadowColor: GRAY_COLOR.withOpacity(.5),
      elevation: widget.item.checked?4:0,
      shape: RoundedRectangleBorder(
      side: BorderSide(color: widget.item.checked?Colors.transparent:Colors.grey.shade200),
        borderRadius: BorderRadius.circular(36.0),
      ),
      // color: Theme.of(context).backgroundColor,
      color: widget.item.checked?COLOR_PRIMARY:WHITE,
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 2),
      child: Container(
        // width: size.width * 0.2,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text(
            "${widget.item.name}",
            maxLines: 1,
            style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.w700,
                color: widget.item.checked?WHITE:Colors.black,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ),
    );
  }

}
