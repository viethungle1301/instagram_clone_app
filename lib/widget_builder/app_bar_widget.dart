import 'package:flutter/material.dart';

import '../assets/asset_image.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {Key? key, required this.childNewFeed, required this.childPoster})
      : super(key: key);

  final Widget childNewFeed;
  final Widget childPoster;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(children: [
                    Image.asset(
                      ImageAsset.imageLogoText,
                      height: 70,
                      width: 100,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black,
                        ))
                  ]),
                ),
                const Spacer(),
                InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    )),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(ImageAsset.iconMessenger),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60),
            child: childNewFeed,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 160,
            ),
            child: childPoster,
          )
        ],
      ),
    );
  }
}
