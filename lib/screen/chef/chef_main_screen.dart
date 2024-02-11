import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../view/chef_product_item_view.dart';
import '../main/menu/menu_screen.dart';
import 'chef_menu_screen/chef_menu_screen.dart';
import 'chef_order_screen/chef_order_screen.dart';

class ChefMainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return ChefMainScreenState();
  }
  
}
class ChefMainScreenState extends State<ChefMainScreen>{

  int _currentIndex = 0;
  final List<Widget> _children = [
    ChefOrderScreen(),
    ChefMenuScreen(),
  ];


  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(),
      body:_children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        fixedColor: COLOR_PRIMARY,
        unselectedItemColor: Colors.grey,
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Menu'
          ),
        ],
      ),
    );
  }
  
}