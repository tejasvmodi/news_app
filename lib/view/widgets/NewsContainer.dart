// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/view/details_view.dart';

class NewsContainer extends StatelessWidget {
  NewsContainer({
    super.key,
    required this.ImageUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newscon,
    required this.newsUrl,
  });
  String ImageUrl;
  String newsHead;
  String newscon;
  String newsDes;
  String newsUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
              height: 330,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: "assets/images.png",
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images.png', // Fallback image in case of error
                  height: 330,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                );
              },
              image: ImageUrl),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsHead.length >= 70
                      ? newsHead
                      : "${newsHead.toString().substring(0, newsHead.length - 2)}...",
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  newsDes,
                  style: const TextStyle(fontSize: 10, color: Colors.black38),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  newscon.length <= 5
                      ? 'no content'
                      : newscon.length > 250
                          ? newscon.substring(0, 250)
                          : "${newscon.toString().substring(0, newscon.length - 15)}...",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailViewScreen(newsUrl: newsUrl),
                          ));
                    },
                    child: const Text("Read More")),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
