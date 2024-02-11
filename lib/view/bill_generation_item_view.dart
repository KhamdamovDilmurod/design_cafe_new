import 'package:bdm_cafe/utils/colors.dart';
import 'package:flutter/material.dart';

class BillGenerationItemView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return BillGenerationItemViewState();
  }
  
}
class BillGenerationItemViewState extends State<BillGenerationItemView>{
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(left:12, right: 20, top: 12, bottom: 12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.withOpacity(.5),
        ),
      ),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Table - A01', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded, size: 24, color: COLOR_PRIMARY,)
            ],
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 4, top: 2, bottom: 2),
            decoration: BoxDecoration(
              color: Color(0xffFFE8BE),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text('No of Items - 4', style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold,),),
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 4, top: 2, bottom: 2),
            decoration: BoxDecoration(
              color: Color(0xffE2FDD4),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text('Bill Amt- 450 \$', style: TextStyle(color:Colors.green, fontWeight: FontWeight.bold,),),
          ),
        ],
      ),
    );
  }
  
}
