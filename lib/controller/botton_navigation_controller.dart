import 'package:flutter/material.dart';

import '../view/category_screen/categoryscreen.dart';
import '../view/home_screen/homescreen.dart';
import '../view/search_screen/searchscreen.dart';

class BottomNavController extends ChangeNotifier{
  int selectedIndex = 0;

  void onItemTap(index){
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages= [
    HomeScreen(),
    SearchScreen(),
    UserScreen(),
  ];
}