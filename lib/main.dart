import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:ostad_my_app/cart_page.dart';
import 'package:sizer/sizer.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: CartPage(),
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.transparent,
                systemNavigationBarIconBrightness: Brightness.dark
              ),
            ),

          scaffoldBackgroundColor: Color.fromRGBO(245, 245, 245, 10)

          ),

        );
      }
    );
  }
}
