import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:bdm_cafe/model/chef/product_model.dart';
import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';
import 'custom_views.dart';

class ChefMenuItemView extends StatefulWidget{

  final ProductModel item;
  final Function(bool) onPressed;

  ChefMenuItemView({Key? key, required this.item, required this.onPressed}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChefMenuItemViewState();
  }
  
}
class ChefMenuItemViewState extends State<ChefMenuItemView>{

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          height: 100,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                // child: SizedBox(child: Image.asset("assets/images/${widget.item.image}")),
                child: Container(
                    color: COLOR_YELLOW_LIGHT.withOpacity(.7),
                    height: 90,
                    width: 90,
                    child: CustomViews.buildNetworkImageWithoutRadius(widget.item.picture)),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.item.name,
                      style: asTextStyle(size: 18, fontWeight: FontWeight.w600),
                    ),
                    // SizedBox(height: 16),
                    Text(widget.item.price.toString(),style: asTextStyle(color: BLACK,size: 16),),
                  ],
                ),
              ),
              AnimatedToggleSwitch<bool>.dual(
                current: widget.item.is_have == 1 ? true : false,
                first: false,
                second: true,
                dif: 50.0,
                borderColor: Colors.transparent,
                borderWidth: 5.0,
                height: 55,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1.5),
                  ),
                ],
                onChanged: (b) {
                  var newStatus = b ? 1 : 0;
                  widget.onPressed(newStatus == 1);
                },
                colorBuilder: (b) => b ? Colors.green : Colors.red,
                // iconBuilder: (value) => value
                //     ? Icon(Icons.circle)
                //     : Icon(Icons.circle),
                textBuilder: (value) => value
                    ? Center(child: Text('O\'CHIRISH'))
                    : Center(child: Text('YOQISH')),
              ),
              // add card
              // Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       border: Border.all(width: 1, color: COLOR_PRIMARY),
              //     ),
              //     child: Container(
              //         margin: const EdgeInsets.all(4),
              //         child: SingleChildScrollView(
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               Text('Tugatish'),
              //               InkWell(
              //                 onTap: () {
              //                 },
              //                 child: Container(
              //                   alignment: Alignment.center,
              //                   height: 34,
              //                   width: 34,
              //                   margin: const EdgeInsets.only(left: 16),
              //                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: COLOR_YELLOW_LIGHT.withOpacity(.7)),
              //                   child: Icon(
              //                     Icons.remove_shopping_cart_outlined,
              //                     size: 18,
              //                     color: Colors.black54,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         )))
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
  
}