import 'package:bdm_cafe/screen/main/home/product/products_screen.dart';
import 'package:bdm_cafe/screen/main/home/table_detail/table_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class TableScreen extends StatefulWidget {
  int tableId;
  TableScreen({Key? key,required this.tableId}) : super(key: key);

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  int _selectedIndex = 0;
  bool firstTimeRun = true;
  List<Widget> screen =[];

  @override
  void initState() {
    screen = [TableDetailScreen(tableId: widget.tableId),ProductsScreen(tableId: widget.tableId,)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [Container(color: COLOR_GREY, child: screen[_selectedIndex])]),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 8,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
          fixedColor: COLOR_PRIMARY,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.recycling_rounded),
              label: 'STOL',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'MENU',
            ),
          ],
          onTap: (index) => setState(() {
            _selectedIndex = index;
            // provider.setBottomScreen(_selectedIndex);
          })),
    );
  }
}
