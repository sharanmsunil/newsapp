import 'package:flutter/material.dart';
import 'package:newsapp/view/widgets/whitefont.dart';

import '../../utils/colors.dart';

class HighlightNews extends StatelessWidget {
  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String content;
  final String sourceName;
  final String url;

  HighlightNews(
      {super.key,
        required this.title,
        required this.description,
        required this.date,
        required this.imageUrl,
        required this.content,
        required this.sourceName,
        required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 400,
      child: Stack(
        children: [
          Container(
            height: 350,
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(imageUrl),fit: BoxFit.cover)
            ),
          ),
          Positioned(
              bottom: 40,
              left: 20,
              child: WhiteFont(text: "Learn More  ▹")),
          Positioned(
              bottom: 80,
              left: 10,
              child: Container(
                width: 400,
                child: WhiteFont(text: title,size: 20,),
              )),
          // Positioned(
          //     top: 50,
          //     left: 10,
          //     child: Icon(Icons.menu,color: NewsColors.bgColor,))
        ],
      ),
    );
  }
}
