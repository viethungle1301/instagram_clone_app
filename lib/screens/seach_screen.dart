import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/poster.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Poster? userSearch;
  @override
  void initState() {
    super.initState();
    getDataSearch();
  }

  void getDataSearch() async {
    try {
      var response = await Dio().get(
          'https://v1.nocodeapi.com/patrick_le/instagram/wdXBSsFdOFKViPnD?fbclid=IwAR3nQPMcfWcMMjWKTLfWuzIQSx8f_Idn3xHQxFpDiZtpfZ-tGy4ihZ9LO1A');
      if (response.statusCode == 200) {
        setState(() {
          final json = response.data;
          userSearch = Poster.fromJson(json);
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
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
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
              margin: const EdgeInsets.only(top: 100),
              child: GridView.builder(
                itemCount: userSearch?.data?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  final item = userSearch?.data?[index];
                  if (item == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Image.network(
                    item.mediaUrl ?? '',
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
