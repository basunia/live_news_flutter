import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mail_automation/utils/url_launcher.dart';
import 'package:mail_tm_api/mail_tm_api.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key, required this.newsItem, required this.index})
      : super(key: key);
  final News newsItem;
  final int index;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(4.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        children: [
          newsItem.image != null && newsItem.image!.isNotEmpty
              ? ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Container(
                    width: size.width,
                    height: size.width * (3 / 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(newsItem.image!),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 12, 0, 12.0),
            child: Column(
              children: [
                ListTile(
                  // leading: Text('${index}'),
                  // dense: true,
                  title: Text(
                    newsItem.title,
                  ),
                  subtitle: Text(newsItem.description),
                ),
                (newsItem.url != null && newsItem.url!.contains('https://'))
                    ? OutlinedButton(
                        onPressed: () {
                          debugPrint('url ${newsItem.url}');
                          if (newsItem.url != null &&
                              newsItem.url!.contains('https://')) {
                            launchWebUrl(newsItem.url!);
                          }
                        },
                        child: const Text(
                          'detail_news',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12.0),
                        ).tr(),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
