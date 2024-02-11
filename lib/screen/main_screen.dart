import 'package:bdm_cafe/screen/main/home/home_screen.dart';
import 'package:bdm_cafe/screen/main/order/order_status_screen.dart';
import 'package:bdm_cafe/screen/main/orders/orders_screen.dart';
import 'package:bdm_cafe/utils/colors.dart';
import 'package:flutter/material.dart';

import 'chef/chef_main_screen.dart';

class MainScreen extends StatefulWidget {
  final int selectedIndex;

  MainScreen({this.selectedIndex = 0, Key? key}) : super(key: key);

  final screenItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Asosiy'),
    BottomNavigationBarItem(icon: Icon(Icons.border_color), label: 'Buyurtmalar'),
  ];

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var firstTimeStart = true;
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    OrdersScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => ChefMainScreen()));
          },
            child: const Text("BDM CAFE", style: TextStyle(color: WHITE, fontWeight: FontWeight.w600),)),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        fixedColor: COLOR_PRIMARY,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Asosiy'),
          BottomNavigationBarItem(icon: Icon(Icons.border_color), label: 'Buyurtmalar'),
        ],
      ),
    );
  }
}
