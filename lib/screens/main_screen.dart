import 'package:flutter/material.dart';
import 'package:test001/assets/asset_image.dart';
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

  void navigationPage(int page) {
    pageController?.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
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
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeScreen(),
            SearchScreen(),
            Center(
              child: Text(
                'Add Video',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Video',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                'Person',
                style: TextStyle(fontWeight: FontWeight.bold),
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
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'saech'),
              const BottomNavigationBarItem(
                  icon: SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(Icons.add_box_outlined)),
                  label: 'seach'),
              BottomNavigationBarItem(
                label: 'video',
                icon: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(ImageAsset.iconVideo),
                ),
              ),
              const BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 30,
                    width: 30,
                    child: Icon(Icons.person),
                  ),
                  label: 'person'),
            ],
            currentIndex: _page,
            onTap: navigationPage));
  }
}
