import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/controller/homescreencontroller.dart';
import 'package:newsapp/view/widgets/blackfont.dart';
import 'package:newsapp/view/widgets/greyfont.dart';
import 'package:newsapp/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../widgets/highlight_news.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void fetchData(BuildContext context) {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Scaffold(
      body: Consumer<HomeScreenController>(
        builder: (BuildContext context, HomeScreenController provider,
            Widget? child) {
          return provider.isLoading == true
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Expanded(
                        //   child: SizedBox(
                        //     height: 350,
                        //     child: ListView.builder(
                        //         shrinkWrap: true,
                        //         physics: ScrollPhysics(),
                        //         scrollDirection: Axis.horizontal,
                        //         itemCount: provider.newsModel.articles?.length ?? 0,
                        //         itemBuilder: (context, index) {
                        //           return HighlightNews(title: provider.newsModel.articles?[index].title
                        //               .toString() ?? "",
                        //               description: provider.newsModel.articles?[index].description
                        //                   .toString() ?? "",
                        //               date: provider.newsModel.articles?[index].publishedAt,
                        //               imageUrl: provider
                        //                   .newsModel.articles?[index].urlToImage
                        //                   .toString() ??
                        //                   "",
                        //               content: provider.newsModel.articles?[index].content
                        //                   .toString() ??
                        //                   "",
                        //               sourceName: provider
                        //                   .newsModel.articles?[index].source?.name
                        //                   .toString() ??
                        //                   "",
                        //               url:  provider.newsModel.articles?[index].url
                        //                   .toString() ??
                        //                   "");
                        //         }
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          child: SizedBox(
                            height: 350,
                            child: CarouselSlider.builder(itemCount: provider.newsModel.articles?.length ?? 0, itemBuilder: (BuildContext context, int index, int pageViewIndex){
                              return HighlightNews(title: provider.newsModel.articles?[index].title
                                                .toString() ?? "",
                                                description: provider.newsModel.articles?[index].description
                                                    .toString() ?? "",
                                                date: provider.newsModel.articles?[index].publishedAt,
                                                imageUrl: provider
                                                    .newsModel.articles?[index].urlToImage
                                                    .toString() ??
                                                    "",
                                                content: provider.newsModel.articles?[index].content
                                                    .toString() ??
                                                    "",
                                                sourceName: provider
                                                    .newsModel.articles?[index].source?.name
                                                    .toString() ??
                                                    "",
                                                url:  provider.newsModel.articles?[index].url
                                                    .toString() ??
                                                    "");
                            }, options:  CarouselOptions(
                              height: 400,
                              aspectRatio: 16/9,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                            ))
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BlackFont(text: 'Breaking News',size: 25,),
                                GreyFont(text: "More",size: 15,color: Colors.grey.shade700,)
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                          child: Expanded(
                            child: SizedBox(
                              height: 300,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: provider.newsModel.articles?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: NewsCard(title: provider.newsModel.articles?[index].title
                                      .toString() ?? "",
                                      description: provider.newsModel.articles?[index].description
                                          .toString() ?? "",
                                      date: provider.newsModel.articles?[index].publishedAt,
                                      imageUrl: provider
                                          .newsModel.articles?[index].urlToImage
                                          .toString() ??
                                          "",
                                      content: provider.newsModel.articles?[index].content
                                          .toString() ??
                                          "",
                                      sourceName: provider
                                          .newsModel.articles?[index].source?.name
                                          .toString() ??
                                          "",
                                      url:  provider.newsModel.articles?[index].url
                                          .toString() ??
                                          ""),
                                );
                              }
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 50,
                        left: 10,
                        child: Icon(Icons.menu,color: NewsColors.bgColor,))
                  ],
                ),
              );
        },
      ),
    );
  }
}
