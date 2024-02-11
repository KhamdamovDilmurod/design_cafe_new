import 'package:flutter/material.dart';

class BillItemView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return BillItemViewState();
  }
  
}
class BillItemViewState extends State<BillItemView>{
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*.25,
                child: Text('Paneer Chillie', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,)),
              ),
              Text('2', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,),),
              Text('500 \$', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,),)
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
  
}