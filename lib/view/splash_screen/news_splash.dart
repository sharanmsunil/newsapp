import 'package:flutter/material.dart';
import 'package:newsapp/controller/news_splash_controller.dart';
import 'package:provider/provider.dart';

import '../widgets/blackfont.dart';

class NewsSplash extends StatelessWidget {
  const NewsSplash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Provider.of<SplashController>(context, listen: false).finishSplash();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/NewsNest.png'),fit: BoxFit.contain)
              ),
            ),
            SizedBox(height: 20,),
            BlackFont(text: 'NewsNest',size: 15,)
          ],
        ),
      ),
    );
  }
}