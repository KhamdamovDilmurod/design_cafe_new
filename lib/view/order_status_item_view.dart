import 'package:bdm_cafe/screen/main/home/product/products_screen.dart';
import 'package:bdm_cafe/screen/main/payment/payment_screen.dart';
import 'package:bdm_cafe/utils/colors.dart';
import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../utils/utils.dart';
import 'order_item_view.dart';

class OrderStatusItemView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderStatusItemViewState();
  }
}

class OrderStatusItemViewState extends State<OrderStatusItemView>
    with SingleTickerProviderStateMixin {

  bool _isShown = false;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleVisibility() {
    setState(() {
      _isShown = !_isShown;
      if (_isShown) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: WHITE,
                border: Border.all(
                  color: Colors.grey,
                ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0))
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: LIGHT_RED,
                    ),
                    child: InkWell(
                      onTap: (){
                        toggleVisibility();
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 12,),
                          Image.asset(
                            Assets.imagesTableOrder,
                            width: 32,
                            height: 32,
                            fit: BoxFit.cover,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Table 001", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                          Spacer(),
                          Icon(_isShown?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down, size: 32, color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _animation,
                  child: Visibility(
                    visible: _isShown,
                    child: ListView.builder(padding: EdgeInsets.symmetric(horizontal: 8),
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        itemBuilder: (_, position) {
                          return OrderItemView(position);
                        }),
                  ),
                ),
                SizedBox(height: 8,),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
                color: WHITE,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => PaymentScreen()));
                    },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.red),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(150, 20),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                    child: Text("Send for Billing", style: TextStyle(color: Colors.red),),
                ),
                ElevatedButton(
                    onPressed: (){
                      startScreenF(context, ProductsScreen(tableId: 1,));
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: COLOR_PRIMARY,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(150, 20),
                    padding: EdgeInsets.symmetric(vertical: 8), // Set the padding
                  ),
                    child: Text("Add more dishes", style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
