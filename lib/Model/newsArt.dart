import 'package:flutter/material.dart';

class NewsArt {
  String ImageUrl;
  String newsHead;
  String newsDes;
  String newsCnt;
  String newsUrl;

  NewsArt({
    required this.ImageUrl,
    required this.newsCnt,
    required this.newsDes,
    required this.newsHead,
    required this.newsUrl,
  });

  static fromAPItoApp(Map<String, dynamic> article) {
    return NewsArt(
        ImageUrl: article['urlToImage'] ?? "https://plus.unsplash.com/premium_photo-1688561384438-bfa9273e2c00?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        newsCnt: article['content'] ?? "--",
        newsDes:  article['description'] ?? "--",
        newsHead:  article['title'] ?? "--",
        newsUrl:  article['url'] ?? 'https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en');
  }
}
