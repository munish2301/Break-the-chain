import 'package:flutter/material.dart';

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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              urlToImage,
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            maxLines: 2,
            style: TextStyle(
                color: Colors.teal, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            description,
            maxLines: 3,
            style: TextStyle(color: Colors.teal[300], fontSize: 14),
          )
        ],
      ),
    );
  }
}
