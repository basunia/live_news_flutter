import 'package:flutter/material.dart';
import 'package:mail_tm_api/mail_tm_api.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key, required this.newsItem, required this.index})
      : super(key: key);
  final News newsItem;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // textColor: Colors.white,
      leading: Text('${index}'),
      // dense: true,
      title: Text(
        newsItem.title,
      ),
      subtitle: Text(newsItem.description),
    );
  }
}
