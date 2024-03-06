import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/newsmodel.dart';

class CategoryController extends ChangeNotifier{
  List<String> categoryList = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology",
  ];
  String category = 'business';

  onTap({required int index}){
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }
  late TopHeadline newsModel;
  bool isLoading = false;

  fetchData()async{
    isLoading = true;
    // notifyListeners();
    final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=e35f794353a04804935b64fa15514e8e");
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodeData = {};
    
    if(response.statusCode == 200){
      decodeData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = TopHeadline.fromJson(decodeData);
    isLoading = false;
    notifyListeners();
  }

}