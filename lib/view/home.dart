import 'package:flutter/material.dart';
import 'package:news_app/Controller/fetchnews.dart';
import 'package:news_app/Model/newsArt.dart';
import 'package:news_app/view/widgets/NewsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsArt? newsArt; // Make this nullable
  bool isloading = true;

  Future<void> getNews() async {
    // Fetch the news asynchronously
    newsArt = await FetchNews.fetchNews();
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews(); 
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading  
          ? const Center(child: CircularProgressIndicator()) 
          : PageView.builder(
              scrollDirection: Axis.vertical,
              controller: PageController(initialPage: 0),
              onPageChanged: (value) {
                getNews();
                setState(() {
                  isloading = true;
                });
              },
              itemBuilder: (context, index) {
             
                return NewsContainer(
                  ImageUrl: newsArt!.ImageUrl,
                  newsHead: newsArt!.newsHead,
                  newscon: newsArt!.newsCnt,
                  newsUrl: newsArt!.newsUrl,
                  newsDes: newsArt!.newsDes,
                );
              },
            ),
    );
  }
}
