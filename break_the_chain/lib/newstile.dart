import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';

import 'articlescreen.dart';
import 'nointernet.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  NewsTile({
    this.title,
    this.description,
    this.url,
    this.urlToImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool result = await DataConnectionChecker().hasConnection;
        if (result == false) {
          Navigator.pushNamed(context, NoInternetScreen.noInternetScreenID);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleScreen(
                url: url,
              ),
            ),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      urlToImage == null
                          ? "https://cdn.dribbble.com/users/71890/screenshots/2368143/health_news.jpg"
                          : urlToImage,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 12,
                ),
                Text(
                  title == null ? "" : title,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  description == null ? "" : description,
                  maxLines: 3,
                  style: TextStyle(color: Colors.teal[300], fontSize: 14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
