import 'package:flutter/material.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:newsapp/view/widgets/blackfont.dart';
import 'package:newsapp/view/widgets/greyfont.dart';
import 'package:newsapp/view/widgets/whitefont.dart';

class NewsViewScreen extends StatelessWidget {
  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String content;
  final String sourceName;
  final String url;

  const NewsViewScreen(
      {super.key,
      required this.title,
      required this.description,
      this.date,
      required this.imageUrl,
      required this.content,
      required this.sourceName,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  top: 380,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30,right: 20,left:  20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Colors.black
                                ),
                                child: Center(child: WhiteFont(text: sourceName)),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Colors.grey.shade200
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 5,),
                                    Icon(Icons.timer,color: Colors.grey,),
                                    SizedBox(width: 5,),
                                    GreyFont(text: date!.day.toString()+"-"+date!.month.toString()+"-"+date!.year.toString()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: 400,
                            child: BlackFont(text: title,size: 20),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: 400,
                            child: GreyFont(text: description,size: 12),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: 400,
                            child: GreyFont(text: content,size: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: NewsColors.textGreyColor,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                      image: DecorationImage(
                          image: NetworkImage(imageUrl),fit: BoxFit.fill)
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                      child: Icon(Icons.arrow_back,color: NewsColors.textLightGreyColor,)),
                ),
                Positioned(
                    top: 200,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WhiteFont(text: title,size: 18),
                          SizedBox(height: 5,),
                          WhiteFont(text: content,size: 10),
                        ],
                      ),
                    )),

              ],
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
