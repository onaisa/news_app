import 'package:flutter/material.dart';
import 'package:news_app/modules/webviwescreen.dart';

Widget ArtecalesWidget(context, article) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: () {
        gotoNavgate(context, WebViweScreen(url: article['url']));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadiusDirectional.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage("${article['urlToImage']}"),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(width: 15.0),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${article['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    '${article['publishedAt']}',
                    // '13/4/1991',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              )),
        ],
      ),
    ),
  );
}

void gotoNavgate(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
