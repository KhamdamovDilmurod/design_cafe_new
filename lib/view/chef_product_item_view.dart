import 'package:bdm_cafe/model/chef/order_food_model.dart';
import 'package:bdm_cafe/utils/colors.dart';
import 'package:bdm_cafe/utils/utils.dart';
import 'package:flutter/material.dart';


class ChefProductItemView extends StatefulWidget {
  final OrderFoodModel item;
  final VoidCallback onPressed;
  final Function() onCancelClicked;

  const ChefProductItemView({Key? key, required this.item, required this.onPressed, required this.onCancelClicked}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChefProductItemViewState();
  }
}

class ChefProductItemViewState extends State<ChefProductItemView> {

  // final TextEditingController _commentController = TextEditingController();

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
                      widget.item.table_name,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${widget.item.food_name} - x ${widget.item.count}',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('(${widget.item.measurement})'),
                  Text('${widget.item.datetime}'),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){
                  widget.onCancelClicked();
                },
                child: Container(
                  width: getScreenWidth(context)*.4,
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(.1),
                    border: Border.all(color: Colors.red.withOpacity(.4), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.close_outlined, color: Colors.red.withOpacity(.6)),
                      Text(
                        'Rad etish',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red.withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap:  widget.onPressed,
                child: Container(
                  width: getScreenWidth(context)*.4,
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    border: Border.all(color: Colors.green.withOpacity(.4), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.check, color: Colors.green.withOpacity(.6)),
                      Text(
                        'Boshlash',
                        style: TextStyle(fontSize: 14, color: Colors.green.withOpacity(.6)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // void commentBottomSheet(){
  //   final focusNode = FocusNode();
  //   showModalBottomSheet(
  //     backgroundColor: Colors.transparent,
  //     context: context,
  //     isDismissible: false,
  //     isScrollControlled: true,
  //     builder: (BuildContext context) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //         ),
  //         child: SingleChildScrollView(
  //           child: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.vertical(
  //                 top: Radius.circular(20),
  //               ),
  //               color: Colors.white,
  //               boxShadow: [
  //                 BoxShadow(
  //                   // color: Colors.purple,
  //                   offset: Offset(2, -2),
  //                   spreadRadius: 0,
  //                   blurRadius: 0,
  //                 ),
  //                 BoxShadow(
  //                   // color: Colors.purple,
  //                   offset: Offset(-2, -2),
  //                   spreadRadius: 0,
  //                   blurRadius: 0,
  //                 ),
  //               ],
  //             ),
  //             padding: EdgeInsets.all(16),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Text("Rad etish sababini kiriting: ", style: TextStyle(letterSpacing: 1,fontFamily:'Roboto',color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
  //                 TextField(
  //                   controller: _commentController,
  //                   decoration: InputDecoration(
  //                     focusColor: Colors.black,
  //                     hintText: 'Sabab',
  //                     enabledBorder: UnderlineInputBorder(
  //                       borderSide: BorderSide(color: Colors.grey),
  //                     ),
  //                     //[focusedBorder], displayed when [TextField, InputDecorator.isFocused] is true
  //                     focusedBorder: UnderlineInputBorder(
  //                       borderSide: BorderSide(color: Colors.black, width: 2),
  //                     ),
  //                   ),
  //                   focusNode: focusNode,
  //                   cursorColor: Colors.black,
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Container(
  //                   margin: EdgeInsets.all(8),
  //                   width: double.infinity,
  //                   height: 48,
  //                   child: ElevatedButton(
  //                       style: ButtonStyle(
  //                         backgroundColor: MaterialStateProperty.all<Color>(COLOR_PRIMARY),
  //                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                           RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(10.0),
  //                           ),
  //                         ),
  //                       ),
  //                       child: const Text('Yuborish', style: TextStyle(color: Colors.white, fontSize: 16,fontFamily:'Roboto', fontWeight: FontWeight.w500,)),
  //                       onPressed: (){
  //                         Navigator.pop(context);
  //                       }
  //                   ),
  //                 ),
  //                 SizedBox(height: 20,),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
