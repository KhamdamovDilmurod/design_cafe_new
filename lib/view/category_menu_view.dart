import 'package:flutter/material.dart';

import '../model/category_model.dart';
import '../model/food_category_model.dart';
import '../utils/colors.dart';

class CategoryMenuView extends StatefulWidget {
  final FoodCategoryModel item;
  const CategoryMenuView({Key? key, required this.item}) : super(key: key);

  @override
  _CategoryMenuViewState createState() => _CategoryMenuViewState();
}

class _CategoryMenuViewState extends State<CategoryMenuView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        color: widget.item.checked?COLOR_PRIMARY:Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: COLOR_YELLOW_LIGHT)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Icon(Icons.category_rounded,color: COLOR_GREEN,),
          // SizedBox(
          //   width: 4,
          // ),
          Text(widget.item.name,style: TextStyle(fontWeight: FontWeight.w700, color: widget.item.checked?WHITE:BLACK)),
        ],
      ),
    );
  }
}
