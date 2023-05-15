import 'package:flutter/material.dart';
import 'package:test001/assets/app_assets.dart';
import 'package:test001/screens/home_screen.dart';
import 'package:test001/screens/seach_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static String routeName = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}
PageController? pageController;
class _MainScreenState extends State<MainScreen> {

  int _page = 0;

  void navigationPage(int page){
    pageController?.jumpToPage(page);
  }

  void onPageChanged(int page){
    setState(() {
      this._page = page;
    });
  }
  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }
  @override
  void dispose() {
    super.dispose();
    pageController?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          SearchScreen(),
          Container(
            child: Center(
              child: Text('Add Video',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
          Container(
            child: Center(
              child: Text('Video',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
          Container(
            child: Center(
              child: Text('Person',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'saech'),
          BottomNavigationBarItem(
              icon: Container(
                  height: 30,
                  width: 30,
                  child: Icon(Icons.add_box_outlined)),
              label: 'seach'),
          BottomNavigationBarItem(
            label: 'video',
              icon: Container(
                height: 25,
                width: 25,
                child: Image.asset(AppAsset.iconVideo),),),
          BottomNavigationBarItem(
              icon: Container(
                height: 30,
                width: 30,
                child: Icon(Icons.person),
              ),
              label: 'person'),
        ],
        currentIndex: _page,
        onTap: navigationPage
      )
    );
  }
}
