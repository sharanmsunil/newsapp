import 'package:flutter/material.dart';
import 'package:newsapp/controller/botton_navigation_controller.dart';
import 'package:newsapp/controller/catagory_controller.dart';
import 'package:newsapp/controller/homescreencontroller.dart';
import 'package:newsapp/controller/news_splash_controller.dart';
import 'package:newsapp/view/splash_screen/news_splash.dart';
import 'package:newsapp/view/bottomnavbar/newshome.dart';
import 'package:provider/provider.dart';

import 'controller/search_screen_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SplashController()),
          ChangeNotifierProvider(create: (context) => BottomNavController()),
          ChangeNotifierProvider(create: (context) => HomeScreenController()),
          ChangeNotifierProvider(create: (context) => CategoryController()),
          ChangeNotifierProvider(create: (context) => SearchScreenController()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Consumer<SplashController>(builder: (BuildContext context,
              SplashController splashProvider, Widget? child) {
            return splashProvider.isSplashFinished ? MainPage() : NewsSplash();
          }),
        ));
  }
}
