import 'dart:async';

import 'package:bdm_cafe/extentions/extensions.dart';
import 'package:bdm_cafe/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'colors.dart';

class DrawerItemModel {
  final Widget icon;
  final String title;

  DrawerItemModel({required this.icon, required this.title});
}

class DrawerMade extends StatefulWidget {
  final List<DrawerItemModel> drawers;

  const DrawerMade({Key? key, required this.drawers}) : super(key: key);

  @override
  _DrawerMadeState createState() => _DrawerMadeState();
}

class _DrawerMadeState extends State<DrawerMade> {
  double radius = 32;
  late DrawerItemModel selectedDrawer;
  Timer? timer;
  final int durationTime = 300;

  @override
  void initState() {
    selectedDrawer = widget.drawers.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double drawerWidth = getScreenWidth(context) / (6 / 5);
    return SafeArea(
      child: Drawer(
        width: drawerWidth,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(radius), bottomRight: Radius.circular(radius))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(radius), bottomRight: Radius.circular(radius)),
              color: LIGHT_BLACK),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(
                      CupertinoIcons.person,
                      color: Colors.white,
                    ),
                  ),
                  title: Text("Xamdamov Dilmurod",
                      style: TextStyle(color: Colors.white), maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text("+998991234567".phoneFormatter(),
                      style: TextStyle(color: Colors.white), maxLines: 1, overflow: TextOverflow.ellipsis)),
              Padding(
                padding: EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "browse".toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white24),
                ),
              ),
              ...widget.drawers.map((e) => drawerMenuItem(
                  icon: e.icon,
                  title: e.title,
                  press: () {
                    setState(() {
                      selectedDrawer = e;
                    });
                    timer?.cancel();
                    var duration = Duration(milliseconds: durationTime);
                    timer = Timer(duration, () {
                      Fluttertoast.cancel();
                      Fluttertoast.showToast(
                          msg: e.title,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    });

                  },
                  isActive: selectedDrawer == e,
                  drawerWidth: drawerWidth))
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerMenuItem(
      {required Widget icon,
      required String title,
      required VoidCallback press,
      required bool isActive,
      required double drawerWidth}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(color: Colors.white24, height: 1),
        ),
        Stack(
          children: [
            AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                height: 56,
                width: isActive ? drawerWidth : 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(color: COLOR_PRIMARY, borderRadius: BorderRadius.all(Radius.circular(10))),
                )),
            ListTile(
              onTap: press,
              leading: SizedBox(
                width: 34,
                height: 34,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: icon,
                ),
              ),
              title: Text(
                title.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

