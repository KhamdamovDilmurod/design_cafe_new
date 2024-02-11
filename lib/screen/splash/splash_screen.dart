
import 'dart:io';
import 'dart:ui';

import 'package:bdm_cafe/screen/auth/auth_screen.dart';
import 'package:bdm_cafe/screen/main_screen.dart';
import 'package:bdm_cafe/screen/main_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../../utils/clipper_path.dart';
import '../../utils/colors.dart';
import '../../utils/pref_utils.dart';
import '../../utils/utils.dart';
import '../chef/chef_main_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var firstTimeStart = true;

  @override
  didChangeDependencies() async {
    if (firstTimeStart) {

      firstTimeStart = false;
    }
    Future.delayed(Duration(seconds: 2), () {
      getConfigs();
    });
    super.didChangeDependencies();
  }

  void getConfigs() async {
    if (PrefUtils.getToken().isEmpty) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AuthScreen()), (route) => false);
    } else {
      if(PrefUtils.getUser()?.role == "chief"){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => ChefMainScreen()), (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => MainScreen()), (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () {
        return MainViewModel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepOrangeAccent,
                    Colors.orangeAccent,
                  ],
                ),),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 140,width: 140,child: Image.asset("assets/images/dinner.png",color: WHITE,)),
                      SizedBox(height: 8,),
                      RichText(
                          text: TextSpan(style: asTextStyle(size: 32,fontFamily: "semibold"), children: <TextSpan>[
                          TextSpan(text: "BDM", style: TextStyle(color: WHITE,fontWeight: FontWeight.w700)),
                        TextSpan(text: " CAFE", style: TextStyle(color: WHITE,fontWeight: FontWeight.w700)),
                      ]))
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(64),
                      child: CircularProgressIndicator(color: COLOR_PRIMARY),
                    )),
              ],
            ),
          ),
        );
      },
      onModelReady: (viewModel) {
        viewModel.errorData.listen((event) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text("Xato!"),
                content: Text(event),
                actions: [
                  TextButton(
                      onPressed: () {
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else {
                          exit(0);
                        }
                      },
                      child: Text(
                        "Chiqish",
                        style: TextStyle(color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Qayta urinish",
                          style: TextStyle(color: Colors.black))),
                ],
              ));
        });

      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
