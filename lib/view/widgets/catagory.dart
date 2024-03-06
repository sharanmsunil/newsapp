import 'package:flutter/material.dart';
import 'package:newsapp/view/widgets/blackfont.dart';
import 'package:newsapp/view/widgets/greyfont.dart';
import 'package:newsapp/view/widgets/news_view_screen.dart';

class NewsCategory extends StatelessWidget {
  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String content;
  final String sourceName;
  final String url;

  const NewsCategory(
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsViewScreen(title: title, description: description, imageUrl: imageUrl, content: content, sourceName: sourceName, url: url,date: date,)));
      },
      child: SizedBox(
        height: 100,
        width: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
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
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 250,
                    child: BlackFont(text: title,size: 11,)),
                SizedBox(
                  height: 5,
                ),
                Container(
                    width: 250,
                    child: GreyFont(text: "Published on "+date!.day.toString()+"-"+date!.month.toString()+"-"+date!.year.toString(),size: 8,)),
                SizedBox(
                  width: 5,
                ),
                Container(
                    width: 250,
                    child: GreyFont(text: 'by ' +sourceName,size: 8,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
