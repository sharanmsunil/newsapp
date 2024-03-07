import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:http/http.dart' as http;

class SearchScreenController with ChangeNotifier{
  TopHeadline? newsModel;
  bool isLoading = false;
  Future<void> searchData({required String searchText}) async{
    isLoading = true;
    final url = Uri.parse("https://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&apiKey=e35f794353a04804935b64fa15514e8e");
    try{
      final response = await http.get(url,
      headers: {
        'Content-Type' : 'application/jason'
      });
      print(response.statusCode);
      if(response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = TopHeadline.fromJson(decodedData);
      } else {
        print("Api failed"); //Handle the failure case as needed
      }
    } catch (e) {
      print("Error: $e"); //Handle the error case as needed
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}