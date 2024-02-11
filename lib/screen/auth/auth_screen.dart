import 'package:bdm_cafe/screen/chef/chef_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stacked/stacked.dart';

import '../../utils/colors.dart';
import '../../utils/pref_utils.dart';
import '../../utils/utils.dart';
import '../../view/custom_views.dart';
import '../main_screen.dart';
import 'auth_viewmodel.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _loginController = TextEditingController();
  var _passwordController = TextEditingController();

  var phoneInputFormatter = MaskTextInputFormatter(mask: '+998 (##) ### ## ##');

  DateTime timeBackPressed = DateTime.now();

  Future<bool> _onWillPop() {
    final differeance = DateTime.now().difference(timeBackPressed);
    timeBackPressed = DateTime.now();
    if (differeance >= Duration(seconds: 2)) {
      Fluttertoast.showToast(msg: "Chiqish uchun yana bir marta bosing!");
      return Future.value(false);
    }
    Fluttertoast.cancel();
    SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () {
          return AuthViewModel();
        },
        builder: (BuildContext context, AuthViewModel viewModel, Widget? child) {
          return Scaffold(
            // backgroundColor: COLOR_YELLOW_LIGHT,
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.deepOrangeAccent,
                          Colors.orangeAccent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        stops: [0.1, 0.5]),
                  ),
                ),
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Container(
                    height: getScreenHeight(context) - 150,
                    margin: EdgeInsets.only(top: 150),
                    child: Stack(
                      children: [
                        circler(withShadow: true),
                        Column(
                          children: [
                            SizedBox(height: 55),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: WHITE,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(36), topRight: Radius.circular(36)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 72,
                                    ),
                                    Text(
                                      "Tizimga kirish!",
                                      style: asTextStyle(size: 32, color: BLACK, fontWeight: FontWeight.w700),
                                    ),
                                    // Text(
                                    //   "Iltimos ma'lumotlarni kiriting",
                                    //   style: asTextStyle(size: 16, color: BLACK, fontWeight: FontWeight.w700),
                                    // ),
                                    SizedBox(height: 48),
                                    CustomViews.buildTextField(
                                      "Login",
                                      // "+998",
                                      "Login kiriting",
                                      textColor: COLOR_PRIMARY,
                                      controller: _loginController,
                                      // inputType: TextInputType.phone,
                                      inputType: TextInputType.text,
                                      // maskTextInputFormatter: phoneInputFormatter,
                                      textInputAction: TextInputAction.done,
                                    ),
                                    SizedBox(height: 16),
                                    CustomViews.buildTextField(
                                      "Parol",
                                      "Parol",
                                      textColor: COLOR_PRIMARY,
                                      controller: _passwordController,
                                      textInputAction: TextInputAction.done,
                                      inputType: TextInputType.visiblePassword,
                                      obscureText: true,
                                    ),
                                    SizedBox(height: 32),
                                    MyElevatedButton(
                                      width: size.width,
                                      height: 54,
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.deepOrangeAccent,
                                          Colors.orangeAccent,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      onPressed: () {
                                        if(
                                        _loginController.text != "" &&
                                            _passwordController.text != ""
                                        ){
                                          viewModel.login(_loginController.text, _passwordController.text);
                                        } else{
                                          showWarning(context, "Iltimos barcha maydonlarni to'ldiring!");
                                        }
                                      },
                                      child: Text('KIRISH'),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        circler(),
                      ],
                    ),
                  ),
                ),
                if (viewModel.progressData) showAsProgress(),
              ],
            ),
          );
        },
        onModelReady: (viewModel) {
          viewModel.errorData.listen((event) {
            showError(context, event);
          });

          viewModel.loginConfirmData.listen((event) {
            PrefUtils.setUser(event);
            if (event.role=="chief") {
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (_) => ChefMainScreen()), (route) => false);
            }  else {
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (_) => MainScreen()), (route) => false);
            }
          });
        },
      ),
    );
  }

  Widget circler({bool withShadow = false}) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(70)), color: WHITE,
                // color: COLOR_YELLOW_LIGHT,
                // border: Border.all(color: COLOR_PRIMARY, width: 0.1),
                boxShadow: [
                  if (withShadow)
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                ]),
            height: 140,
            width: 140,
            child: Image.asset("assets/images/dinner.png")));
  }
}
