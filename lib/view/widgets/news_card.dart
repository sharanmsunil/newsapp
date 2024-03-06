import 'package:flutter/material.dart';
import 'package:newsapp/view/widgets/blackfont.dart';
import 'package:newsapp/view/widgets/greyfont.dart';
import 'package:newsapp/view/widgets/news_view_screen.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String content;
  final String sourceName;
  final String url;

   const NewsCard(
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
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsViewScreen(title: title, description: description, imageUrl: imageUrl, content: content, sourceName: sourceName, url: url,date: date,)));
      },
      child: Container(
        height: 300,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                      imageUrl
                    ),
                fit: BoxFit.cover),
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 250,
                child: BlackFont(text: title)),
            SizedBox(
              height: 5,
            ),
            Container(
                width: 250,
                child: GreyFont(text: "Published on "+date!.day.toString()+"-"+date!.month.toString()+"-"+date!.year.toString())),
            SizedBox(
              height: 5,
            ),
            Container(
                width: 250,
                child: GreyFont(text: 'by ' +sourceName)),
          ],
        ),
      ),
    );
  }
}
