import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_renshuu/lang/translation.dart';
import 'package:getx_renshuu/screens/CartScreen.dart';
import 'package:getx_renshuu/screens/HomeScreen.dart';
import 'package:getx_renshuu/screens/WishListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rey Store',
      translations: translation(),
      locale: Locale('en','US'),
      fallbackLocale: Locale('ja','JP'),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen(),),
        GetPage(name: '/wishlist', page: () => WishListScreen(),),
        GetPage(name: '/cart', page: () => CartScreen(),),
      ],
    );
  }
}
