import 'package:flutter/material.dart';
import 'package:test001/assets/asset_image.dart';

// ignore: must_be_immutable
class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              height: 65,
              width: 65,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAsset.imageAvatarHung),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(65)),
              ),
            ),
            Container(
                alignment: Alignment.bottomRight,
                height: 65,
                width: 65,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: const Icon(
                    Icons.add_circle,
                    color: Colors.blue,
                    size: 19,
                  ),
                ))
          ]),
          const SizedBox(
            height: 5,
          ),
          Container(
              alignment: Alignment.center,
              child: const Text(
                "Lê Việt Hùng",
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
