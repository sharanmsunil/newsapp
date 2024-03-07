import 'package:flutter/material.dart';
import 'package:newsapp/controller/catagory_controller.dart';
import 'package:newsapp/controller/search_screen_controller.dart';
import 'package:newsapp/view/widgets/blackfont.dart';
import 'package:newsapp/view/widgets/greyfont.dart';
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
    TextEditingController textController = TextEditingController();
    SearchScreenController provider1 = Provider.of<SearchScreenController>(context);
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
                        titlePadding: EdgeInsets.only(bottom: 120, left: 20),
                        title: BlackFont(text: "Discover",size: 25,),
                        background: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 170,),
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20),
                              child: GreyFont(text: 'News from all over the world')
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Container(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(left: 20,right: 20),
                                  child: TextField(
                                    controller: textController,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey.shade300,width: 1,)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.grey.shade300,width: 1,)
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.grey.shade300,width: 1,)
                                      ),
                                      hintText: 'Search',
                                      helperStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.fromLTRB(9, 6, 9, 6),
                                        child: Icon(Icons.search,color: Colors.grey,),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Expanded(
                            //   child: ElevatedButton(
                            //     onPressed: () {
                            //       provider1.searchData(searchText: textController.text.toLowerCase());
                            //       FocusManager.instance.primaryFocus?.unfocus();
                            //     },
                            //     style: const ButtonStyle(
                            //         backgroundColor:
                            //         MaterialStatePropertyAll(Color(0xff6A3DE8))),
                            //     child: const Text(
                            //       "Search",
                            //       style: TextStyle(color: Colors.white),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
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
