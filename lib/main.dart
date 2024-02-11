import 'package:alice/alice.dart';
import 'package:bdm_cafe/provider/providers.dart';
import 'package:bdm_cafe/screen/splash/splash_screen.dart';
import 'package:bdm_cafe/socket/notification_service.dart';
import 'package:bdm_cafe/utils/colors.dart';
import 'package:bdm_cafe/utils/get_it.dart';
import 'package:bdm_cafe/utils/pref_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtils.initInstance();
  apiServiceProvider();
  // await NotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final alice = Alice(showNotification: kDebugMode);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Providers>(create: (context){
      return Providers();
    },
    child: MaterialApp(
      navigatorKey: MyApp.alice.getNavigatorKey(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                padding: const EdgeInsets.all(16),
                primary: COLOR_PRIMARY,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)))),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontWeight: FontWeight.w600, fontFamily: "semibold", fontSize: 20),
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: COLOR_PRIMARY),
          backgroundColor: COLOR_PRIMARY,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        ),
        primarySwatch: Colors.blue,
      ),
      home:const SplashScreen(),
    ));
  }
}

