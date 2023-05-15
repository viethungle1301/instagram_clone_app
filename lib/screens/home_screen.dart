import 'package:dio/dio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:test001/assets/app_assets.dart';
import 'package:test001/widget_builder/app_bar_widget.dart';
import 'package:test001/widget_builder/new_feed_widget.dart';
import 'package:test001/widget_builder/poster_widget.dart';

import '../models/users.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio().get('https://api.randomuser.me/?results=10');
      if (response.statusCode == 200) {
        setState(() {
          final json = response.data;
          user = User.fromJson(json);
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      childNewFeed:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: user?.results?.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = user?.results?[index];
                  if (item == null) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return WidgetContainer(
                    name: item.name?.last ?? '',
                    urlImage: item.picture?.medium ?? '',
                  );
                })),
        SizedBox(
          height: 5,
        ),
        const DottedLine(
          dashGapLength: 0,
          dashColor: Colors.black12,
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
      childPoster: ListView.builder(
          itemCount: user?.results?.length,
          itemBuilder: (BuildContext context, int index) {
            final itemPoster = user?.results?[index];
            if (itemPoster == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return PosterWidget(
                username: itemPoster.name?.last ?? ' asdasdsa',
                imagePoster: itemPoster.picture?.large ?? ' dasa',
                like: 4592,
                avatar: itemPoster.picture?.medium ?? 'asd ',
                check: false,
                subText: false,
                stt: itemPoster.location?.street?.name ?? '');
          }),
    );
  }
}
