import 'package:flutter/material.dart';
import 'package:newsapp/controller/botton_navigation_controller.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<BottomNavController>(builder: (BuildContext context, BottomNavController bottomNavController, Widget? child){
        return Scaffold(
          body: bottomNavController.myPages[bottomNavController.selectedIndex],
        );
      },),
      bottomNavigationBar: Consumer<BottomNavController>(
        builder: (BuildContext context, BottomNavController bottomNavController, Widget? child) {
          return SizedBox(
            height: 70,
            child: BottomNavigationBar(
                unselectedIconTheme: IconThemeData(
                    color: Colors.grey
                ),
                selectedIconTheme: IconThemeData(
                    color: Colors.black
                ),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedLabelStyle: TextStyle(color: Colors.white),
                unselectedLabelStyle: TextStyle(color: Colors.white),
                currentIndex: Provider
                    .of<BottomNavController>(context)
                    .selectedIndex,
                onTap: Provider
                    .of<BottomNavController>(context, listen: false)
                    .onItemTap,
                items: [
                  BottomNavigationBarItem(
                      icon: bottomNavController.selectedIndex == 0 ? Icon(Icons.home_filled) : Icon(Icons.home_outlined), label: 'home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: 'search'),
                  BottomNavigationBarItem(
                      icon: bottomNavController.selectedIndex == 2 ? Icon(Icons.person_2) : Icon(Icons.person_2_outlined), label: 'user'),
                ]),
          );
        }
      ),
    );
  }
}
