import 'package:flutter/material.dart';

import '../models/users.dart';

class WidgetContainer extends StatelessWidget {
  WidgetContainer({super.key, required this.name, required this.urlImage});
  String name;
  String urlImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(70)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.purple, Colors.amber]),
            ),
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(urlImage),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(65)),
                  border: Border.all(color: Colors.white, width: 3)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              alignment: Alignment.center,
              child: Text(
                name,
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ))
        ],
      ),
    );
  }
}
