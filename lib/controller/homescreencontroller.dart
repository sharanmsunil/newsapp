import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController extends ChangeNotifier{
  late TopHeadline newsModel;
  bool isLoading = false;

  //to process api and get response
  var baseUrl = 'https://newsapi.org';

  fetchData() async{
    isLoading = true;
    // notifyListeners();
    final url = "$baseUrl/v2/top-headlines?country=in&apiKey=98542493c0fd4dfa8309c4fe51c7dae4";
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    Map<String,dynamic> decodeData={};
    if(response.statusCode==200){
      decodeData=jsonDecode(response.body);
    }else{
      print('api failed');
    }
    newsModel=TopHeadline.fromJson(decodeData);
    isLoading=false;
    notifyListeners();

  }

  Future<void> launchURL(String url) async{
    final Uri urli = Uri.parse(url);
    try{
      if(await launchUrl(urli,mode : LaunchMode.inAppWebView)) {
        await launchUrl(urli, mode: LaunchMode.inAppWebView);
      }else{
        throw 'Could not lauch $url';
      }
    } catch (e) {
      print("Error launching Url : $e");
    }
    notifyListeners();
  }
}

///to share news
// void shareText({String textToShare = ""}) {
//   try {
//     Share.share(textToShare);
//   } catch(e) {
//     print("Error sharing: $e");
//   }
//   notifyListeners();
// }