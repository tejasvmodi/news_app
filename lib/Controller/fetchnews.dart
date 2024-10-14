import 'dart:developer';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart';
import 'package:news_app/Model/newsArt.dart';

class FetchNews {
  static  List sources = [
      "abc-news",
      "bbc-news",
      "bbc-sport",
      "business-insider",
      "engadget",
      "entertainment-weekly",
      "espn",
      "espn-cric-info",
      "financial-post",
      "fox-news",
      "fox-sports",
      "globo",
      "google-news",
      "google-news-in",
      "medical-news-today",
      "national-geographic",
      "news24",
      "new-scientist",
      "new-york-magazine",
      "next-big-future",
      "techcrunch",
      "techradar",
      "the-hindu",
      "the-wall-street-journal",
      "the-washington-times",
      "time",
      "usa-today",
    ];

  static Future<NewsArt> fetchNews() async {
  
    final _random =new Random();
    var element = sources[_random.nextInt(sources.length)];
  
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$element&apiKey=2af2650f02b044129f075c6d9069b50d"));

    Map body_data = jsonDecode(response.body);
    List articles =  body_data['articles'];

    // print(body_data);

  final _newrandom =new Random();
    var myarticle = articles[_random.nextInt(articles.length)];

  print(myarticle);
   
  return  NewsArt.fromAPItoApp(myarticle);

  }
}
