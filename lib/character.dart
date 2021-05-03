import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_test/item.dart';

class Character extends StatelessWidget {
  final Item item;
  final int index;

  const Character({Key key, this.item, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: "avatar-$index",
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      fit: BoxFit.cover,
                      height: 300,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error)),
                ),
              ),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                item.subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  item.description,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ],
          ),
          SafeArea(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white60,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
