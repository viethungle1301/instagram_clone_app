import 'package:flutter/material.dart';
import 'package:test001/assets/app_assets.dart';
import 'package:test001/models/users.dart';

class PosterWidget extends StatefulWidget {
  final String imagePoster;
  final int like;
  final String avatar;
  final bool check;
  final bool subText;
  final String stt;
  bool clickLike = true;
  bool clickSave = true;
  String username;
  PosterWidget(
      {required this.username,
      required this.imagePoster,
      required this.like,
      required this.avatar,
      required this.check,
      required this.subText,
      required this.stt});

  @override
  State<PosterWidget> createState() => _PosterWidgetState();
}

class _PosterWidgetState extends State<PosterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.purple, Colors.amber]),
                  ),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.avatar),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                        border: Border.all(color: Colors.white, width: 2)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (widget.subText) const Text('Được tài trợ')
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                if (widget.check)
                  Container(
                      height: 15,
                      width: 15,
                      child: Image.asset(
                        AppAsset.iconCheck,
                      )),
                Spacer(),
                SizedBox(
                  child: Icon(Icons.more_horiz),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            child: Image.network(
              widget.imagePoster,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.clickLike = !widget.clickLike;
                      });
                    },
                    child: Icon(
                      (widget.clickLike == false)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: (widget.clickLike == false)
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      AppAsset.iconComment,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(AppAsset.iconSend),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.clickSave = !widget.clickSave;
                      });
                    },
                    child: (widget.clickSave == false)
                        ? Image.asset(
                            AppAsset.iconBookmark2,
                            width: 25,
                            height: 25,
                          )
                        : Image.asset(
                            AppAsset.iconBookmark,
                            width: 25,
                            height: 25,
                          ),
                  ),
                ]),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '${widget.like} lượt thích',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: widget.username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(text: ' '),
                      TextSpan(
                          text: widget.stt,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ))
                    ]),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Xem tất cả có 36 bình luận'),
                SizedBox(
                  height: 8,
                ),
                Text('4 giờ trước')
              ],
            ),
          )
        ],
      ),
    );
  }
}
