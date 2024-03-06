import 'package:flutter/material.dart';
import 'package:newsapp/view/widgets/news_view_screen.dart';
import 'package:newsapp/view/widgets/whitefont.dart';


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
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsViewScreen(title: title, description: description, imageUrl: imageUrl, content: content, sourceName: sourceName, url: url,date: date,)));
      },
      child: SizedBox(
        height: 350,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 350,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl),fit: BoxFit.cover)
              ),
            ),
            Positioned(
                bottom: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: WhiteFont(text: "Learn More  ▹"),
                )),
            Positioned(
                bottom: 80,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: 400,
                  child: WhiteFont(text: title,size: 18),
                )),
            // Positioned(
            //     top: 50,
            //     left: 10,
            //     child: Icon(Icons.menu,color: NewsColors.bgColor,))
          ],
        ),
      ),
    );
  }
}
