import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../model/chef/order_food_model.dart';

class ChefCompletedItemView extends StatefulWidget{
  final OrderFoodModel item;

  const ChefCompletedItemView({Key? key, required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChefCompletedItemViewState();
  }

}
class ChefCompletedItemViewState extends State<ChefCompletedItemView>{
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 1,
            color: Colors.black26,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buyurtma #${widget.item.id}',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      widget.item.waiter_name,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '${widget.item.food_name} - x ${widget.item.count}',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('${widget.item.datetime}'),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              border: Border.all(color: Colors.green.withOpacity(.4), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Yakunlangan',
                  style: TextStyle(fontSize: 14, color: Colors.green.withOpacity(.6)),
                ),
                SizedBox(width: 12,),
                Image.asset(Assets.imagesCompleted, width: 24, height: 24, color: Colors.green.withOpacity(.6),),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}