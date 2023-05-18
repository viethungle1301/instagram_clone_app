import 'package:flutter/material.dart';
import 'package:test001/assets/asset_image.dart';

// ignore: must_be_immutable
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
      {super.key,
      required this.username,
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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
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
                        image: AssetImage(widget.avatar),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(35)),
                      border: Border.all(color: Colors.white, width: 2)),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.username,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (widget.subText) const Text('Được tài trợ')
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              if (widget.check)
                SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset(
                      ImageAsset.iconCheck,
                    )),
              const Spacer(),
              const SizedBox(
                child: Icon(Icons.more_horiz),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          child: Image.network(
            widget.imagePoster,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                    color:
                        (widget.clickLike == false) ? Colors.red : Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    ImageAsset.iconComment,
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(ImageAsset.iconSend),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.clickSave = !widget.clickSave;
                    });
                  },
                  child: (widget.clickSave == false)
                      ? Image.asset(
                    ImageAsset.iconBookmark2,
                          width: 25,
                          height: 25,
                        )
                      : Image.asset(
                    ImageAsset.iconBookmark,
                          width: 25,
                          height: 25,
                        ),
                ),
              ]),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${widget.like} lượt thích',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: widget.username,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const TextSpan(text: ' '),
                  TextSpan(
                      text: widget.stt,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ))
                ]),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text('Xem tất cả có 36 bình luận'),
              const SizedBox(
                height: 8,
              ),
              const Text('4 giờ trước')
            ],
          ),
        )
      ],
    );
  }
}
