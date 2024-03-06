import 'package:flutter/material.dart';
import 'package:newsapp/controller/catagory_controller.dart';
import 'package:newsapp/view/widgets/blackfont.dart';
import 'package:provider/provider.dart';

import '../widgets/catagory.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  void fetchData(BuildContext context) async {
    Provider.of<CategoryController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    fetchData(context);
    return Scaffold(
      body: Consumer<CategoryController>(
        builder:
            (BuildContext context, CategoryController provider, Widget? child) {
          return DefaultTabController(
              length: provider.categoryList.length,
              initialIndex: 0,
              child:  provider.isLoading == true
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 250,
                      floating: true,
                      pinned: false,
                      leading: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: EdgeInsets.only(bottom: 80, left: 20),
                        title: BlackFont(text: "Discover",size: 25,),
                      ),
                      bottom: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.black,
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        unselectedLabelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        tabs: List.generate(
                            provider.categoryList.length,
                            (index) => Tab(
                                  text: provider.categoryList[index],
                                )),
                        onTap: (value) {
                          provider.onTap(index: value);
                        },
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: provider.newsModel.articles?.length ?? 0,
                      (context, index) => Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: NewsCategory(
                                title: provider
                                    .newsModel.articles?[index].title
                                    .toString() ??
                                    "",
                                description: provider.newsModel
                                    .articles?[index].description
                                    .toString() ??
                                    "",
                                date: provider
                                    .newsModel.articles?[index].publishedAt,
                                imageUrl: provider.newsModel
                                    .articles?[index].urlToImage
                                    .toString() ??
                                    "",
                                content: provider
                                    .newsModel.articles?[index].content
                                    .toString() ??
                                    "",
                                sourceName: provider.newsModel.articles?[index].source?.name.toString() ?? "",
                                url: provider.newsModel.articles?[index].url.toString() ?? ""),
                          ),
                    ))
                  ],
                ),
              );
        },
      ),
    );
  }
}
