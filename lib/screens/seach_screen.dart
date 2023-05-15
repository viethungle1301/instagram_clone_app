import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/users.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  User? userSearch;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void _getDataUser() async {}
  void getData() async {
    try {
      var response = await Dio().get('https://api.randomuser.me/?results=10');
      if (response.statusCode == 200) {
        setState(() {
          final json = response.data;
          userSearch = User.fromJson(json);
        });
      } else {
        print('ERROR');
      }
    } catch (object) {
      print(object);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white30,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: const TextField(
                textInputAction: TextInputAction.search,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "search",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: GridView.builder(
                itemCount: userSearch?.results?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  final item = userSearch?.results?[index];
                  if (item == null) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return Image.network(
                    item.picture?.medium ?? '',
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
