import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../utils/colors.dart';

class OrderItemView extends StatefulWidget{

  final int position;

  OrderItemView(this.position);

  @override
  State<StatefulWidget> createState() {

    return OrderItemViewState();
  }
  
}
class OrderItemViewState extends State<OrderItemView>{
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12,),
              Text("Paneer Chili", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: (widget.position==0)?Colors.blue.withOpacity(.2):Colors.pink.withOpacity(.2),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Text((widget.position==0)?"In progress":"Not prepared", style: TextStyle(color: (widget.position==0)?Colors.blue:Colors.pink),),
              ),
            ],
          ),
        ),
        Text("Modify", style: TextStyle(fontWeight: FontWeight.bold, color: (widget.position==0)?Colors.grey:LIGHT_RED),),
        SizedBox(width: 60,),
        Image.asset(Assets.imagesDelete, width: 24, height: 24, color: (widget.position==0)?Colors.grey:LIGHT_RED),
      ],
    );
  }
  
}