import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserCardWidget extends StatelessWidget {
  UserCardWidget({super.key, required this.name, required this.urlImage});
  String name;
  String urlImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        padding: const EdgeInsets.symmetric(vertical: 10,),
        width: 120,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.grey
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
            const SizedBox(
              height: 5,
            ),
            Center(
                child: Text(
                  name,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                )),
            const Center(
              child: Text('Gợi ý cho bạn',
                style: TextStyle(color: Colors.grey),),
            ),
            ElevatedButton(onPressed: (){},
                child: const Text("Theo dõi lại"))
          ],
        ),
      ),
    );
  }
}
