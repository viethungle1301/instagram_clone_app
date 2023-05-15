import 'package:flutter/material.dart';

import '../assets/app_assets.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.childNewFeed, required this.childPoster}) : super(key: key);

  final Widget childNewFeed;
  final Widget childPoster;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            height: 80,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('sad');
                  },
                  child: Row(children: [
                    Image.asset(
                      AppAsset.imageLogoText,
                      height: 70,
                      width: 100,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,))
                  ]),
                ),
                Spacer(),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.favorite_border,color: Colors.black,
                    )),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(AppAsset.iconMessenger),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60),
            child: childNewFeed,
          ),
          Container(
            margin: EdgeInsets.only(top: 160,),
            child: childPoster,
          )
        ],
      ),
    );
  }
}
