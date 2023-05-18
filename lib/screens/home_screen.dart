import 'package:dio/dio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test001/assets/asset_image.dart';
import 'package:test001/widget_builder/app_bar_widget.dart';
import 'package:test001/widget_builder/new_feed_widget.dart';
import 'package:test001/widget_builder/poster_widget.dart';
import '../models/poster.dart';
import '../models/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Poster? poster;
  User? user;
  @override
  void initState() {
    super.initState();
    getDataUser();
    getDataPoster();
  }

  void getDataUser() async {
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

  void getDataPoster() async {
    try {
      var responsePoster = await Dio().get(
          'https://v1.nocodeapi.com/patrick_le/instagram/wdXBSsFdOFKViPnD?fbclid=IwAR0tfQVxRMtojApuCJldTBzpJM_89Lms0gUQ20mrL8tJA046z_bBiDTFaEI');
      // ignore: unrelated_type_equality_checks
      if (responsePoster.statusCode == 200) {
        setState(() {
          final jsonUser = responsePoster.data;
          poster = Poster.fromJson(jsonUser);
        });
      } else {
        print("Error User");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
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
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return WidgetContainer(
                    name: item.name?.last ?? '',
                    urlImage: item.picture?.medium ?? '',
                  );
                })),
        const SizedBox(
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
          itemCount: poster?.data?.length,
          itemBuilder: (BuildContext context, int index) {
            final itemPoster = poster?.data?[index];
            if (itemPoster == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return PosterWidget(
                username: "hungkthn_k57",
                imagePoster: itemPoster.mediaUrl.toString(),
                like: 4592,
                avatar:  ImageAsset.imageAvatarHung,
                check: false,
                subText: false,
                stt: itemPoster.caption.toString());
          }),
    );
  }
}
