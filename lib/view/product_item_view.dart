import 'package:bdm_cafe/model/food_model.dart';
import 'package:bdm_cafe/utils/utils.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'custom_views.dart';

class ProductItemView extends StatefulWidget {
  final FoodModel item;
  Function add2Cart;

  ProductItemView({Key? key, required this.item, required this.add2Cart}) : super(key: key);

  @override
  _ProductItemViewState createState() => _ProductItemViewState();
}

class _ProductItemViewState extends State<ProductItemView> {
  var _countController = TextEditingController();
  final _countFocusNode = FocusNode();
  var cartCount = 1;
  var totalSum = 0;

  @override
  void initState() {
    _countController = TextEditingController(text: '1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(color: WHITE, borderRadius: BorderRadius.circular(8), boxShadow: [
          BoxShadow(
            color: GRAY_COLOR.withOpacity(.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ]),
        child: Column(
          children: [
            Row(
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
                      SizedBox(height: 8),
                      Text(
                        "${widget.item.sell_price}",
                        style: asTextStyle(color: COLOR_PRIMARY, size: 16),
                      ),
                      SizedBox(height: 8),
                      if (widget.item.is_have == 0)
                        Container(
                          padding: EdgeInsets.all(4),
                          child: Text("Hozirda mavjud emas", style: asTextStyle(color: WHITE, size: 16)),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            if (widget.item.is_have == 1)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(child: Text((int.parse(_countController.text) * widget.item.sell_price).toString()))),
                  Expanded(
                    flex: 1,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1, color: COLOR_YELLOW_LIGHT),
                        ),
                        child: Container(
                            margin: const EdgeInsets.all(4),
                            child: SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      if (cartCount >= 1) {
                                        cartCount--;
                                      }
                                      _countController.text = cartCount.toString();
                                      totalSum = int.parse(_countController.text) * widget.item.sell_price;
                                      setState(() {});
                                      // if (product!.cartCount >= 1) {
                                      // setState(() {
                                      // product?.cartCount--;
                                      // cartText =
                                      // (product?.cartCount ?? 0.0).toString();
                                      // widget.item.cartCount =
                                      // product?.cartCount ?? 0.0;
                                      // BlocProvider.of<CartCubit>(context)
                                      //     .addToCart(widget.item);
                                      // });
                                      // } else {
                                      // widget.item.cartCount = product?.cartCount ?? 0.0;
                                      // BlocProvider.of<CartCubit>(context)
                                      //     .addToCart(widget.item);
                                      // }
                                      // if (product?.cartCount == 0) {
                                      // widget.updateCart();
                                      // }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 34,
                                      width: 34,
                                      margin: const EdgeInsets.only(right: 4),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8), color: COLOR_YELLOW_LIGHT.withOpacity(0.7)),
                                      child: Icon(
                                        Icons.remove,
                                        size: 18,
                                        color: BLACK,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      focusNode: _countFocusNode,
                                      onChanged: (count) {
                                        cartCount = int.parse(count);
                                        totalSum = int.parse(count) * widget.item.sell_price.toInt();
                                        setState(() {});
                                      },
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(2),
                                      ),
                                      controller: _countController,
                                      style: asTextStyle(size: 16, fontWeight: FontWeight.bold, color: BLACK),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      cartCount++;
                                      _countController.text = cartCount.toString();
                                      totalSum = int.parse(_countController.text) * widget.item.sell_price;
                                      setState(() {});
                                      // cartText = (product?.cartCount ?? 0.0).toString();
                                      // widget.item.cartCount = product?.cartCount ?? 0.0;
                                      // Provider.of<Providers>(context)
                                      //     .addToCart(widget.item);
                                      // if (product?.cartCount == 0) {widget.updateCart();
                                      // }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 34,
                                      width: 34,
                                      margin: const EdgeInsets.only(left: 4),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8), color: COLOR_YELLOW_LIGHT.withOpacity(.7)),
                                      child: const Icon(
                                        Icons.add,
                                        size: 18,
                                        color: BLACK,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        widget.add2Cart(int.parse(_countController.text));
                      },
                      child: Container(
                        height: 42,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            color: COLOR_PRIMARY,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: COLOR_YELLOW_LIGHT)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Qo'shish", style: TextStyle(fontWeight: FontWeight.w700, color: WHITE)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
