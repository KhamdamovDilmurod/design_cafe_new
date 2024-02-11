import 'dart:convert';

import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CartItemView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return CartItemViewState();
  }
  
}
class CartItemViewState extends State<CartItemView>{
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hakka Noodles', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(height: 2,),
                    Text('325 \$', style: TextStyle(fontSize: 14),),
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        Text('CUSTOMIZE', style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 2,),
                        Icon(Icons.arrow_forward_ios_rounded, size: 14,),
                      ],
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    color: LIGHT_RED.withOpacity(.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.remove, color: COLOR_PRIMARY,),
                      SizedBox(width: 4,),
                      Text('1', style: TextStyle(fontSize: 18),),
                      SizedBox(width: 4,),
                      Icon(Icons.add, color: COLOR_PRIMARY,),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
  
}