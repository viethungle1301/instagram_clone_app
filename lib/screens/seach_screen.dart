import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
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
      } else {}
    } catch (e) {
      // ignore: avoid_print
      print(e);
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
              decoration:   BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(1, 1),
                    color: Colors.grey.withOpacity(0.5)
                  )
                ]
              ),
              child:  TextField(
                textInputAction: TextInputAction.search,
                maxLines: 1,
                decoration: InputDecoration(
                  prefixIcon:const  Icon(Icons.search,color:  Colors.grey,size: 16,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                    return Shimmer(
                      duration: const Duration(seconds: 3), //Default value
                      interval: const Duration(
                          seconds: 5), //Default value: Duration(seconds: 0)
                      color: Colors.white, //Default value
                      colorOpacity: 0, //Default value
                      enabled: true, //Default value
                      direction:
                          const ShimmerDirection.fromLTRB(), //Default Value
                      child: Container(
                        color: Colors.grey,
                      ),
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
