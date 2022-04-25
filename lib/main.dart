import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misterfix/screen/auth/login_screen.dart';
import 'package:misterfix/screen/auth/register_screen.dart';
import 'package:misterfix/screen/main/home/home_screen.dart';
import 'package:misterfix/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Misterfix Tech',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // Try running your application with "flutter run". You'll see the
    //     // application has a blue toolbar. Then, without quitting the app, try
    //     // changing the primarySwatch below to Colors.green and then invoke
    //     // "hot reload" (press "r" in the console where you ran "flutter run",
    //     // or simply save your changes to "hot reload" in a Flutter IDE).
    //     // Notice that the counter didn't reset back to zero; the application
    //     // is not restarted.
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: SplashScreen(),
    //   onGenerateRoute: (initial){
    //     switch(initial.name){
    //       case '/login':
    //         return MaterialPageRoute(
    //             builder: (context){
    //               return LoginScreen();
    //             },
    //             settings: RouteSettings());
    //       case '/register':
    //         return MaterialPageRoute(
    //             builder: (context){
    //               return RegisterScreen();
    //             },
    //             settings: RouteSettings());
    //       case '/home':
    //         return MaterialPageRoute(
    //             builder: (context){
    //               return HomeScreen();
    //             },
    //             settings: RouteSettings());
    //       default: return null;
    //     }
    //   }
    // );
  }
}
