import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:test001/assets/asset_image.dart';
import 'package:test001/auth_controller.dart';
import 'package:test001/widget_builder/profile_widget.dart';
import 'package:test001/widget_builder/user_cards_widget.dart';
import '../models/poster.dart';
import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;
  Poster? poster;
  @override
  void initState() {
    super.initState();
    getDataUser2();
    getDataPoster();
  }

  void getDataPoster() async {
    try {
      var responsePoster = await Dio().get(
          'https://v1.nocodeapi.com/patrick_le/instagram/wdXBSsFdOFKViPnD?fbclid=IwAR0tfQVxRMtojApuCJldTBzpJM_89Lms0gUQ20mrL8tJA046z_bBiDTFaEI');
      // ignore: unrelated_type_equality_checks
      if (responsePoster.statusCode == 200) {
        setState(() {
          final jsonUser = responsePoster.data;
          poster = Poster.fromJson(jsonUser);
        });
      } else {
        if (kDebugMode) {
          print("Error User");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void getDataUser2() async {
    try {
      var response3 = await Dio().get('https://api.randomuser.me/?results=10');
      if (response3.statusCode == 200) {
        setState(() {
          final json1 = response3.data;
          user = User.fromJson(json1);
        });
      } else {
        if (kDebugMode) {
          print(response3.statusCode);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin:const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const Text('hungkthn.k57',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),),
                InkWell(
                  onTap: (){},
                    child: const Icon(Icons.keyboard_arrow_down,),
                ),
                const Spacer(),
                InkWell(
                  onTap: (){},
                  child: const Icon(Icons.add_box_outlined),
                ),
                const SizedBox(width: 15,),
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                      ),
                        context: context,
                        builder: (BuildContext context){
                          return SizedBox(
                            height: h * 0.6,
                            child: ListView(
                              children:  <Widget>[
                                ListTile(
                                  leading: IconButton(
                                      onPressed: (){},
                                      icon: const Icon(Icons.settings,color: Colors.black),),
                                  title: const Text( "Cài đặt và quyền riêng tư"),
                                ),
                                ListTile(
                                  leading: IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.save_alt_rounded,color: Colors.black,),),
                                  title: const Text( "Kho lưu trữ"),
                                ),
                                ListTile(
                                  leading: IconButton(
                                    onPressed: (){},
                                    icon: const Image(image: AssetImage(ImageAsset.iconBookmark)),),
                                  title: const Text( "Đã lưu"),
                                ),
                                ListTile(
                                  leading: IconButton(
                                    onPressed: (){
                                    },
                                    icon: const Icon(Icons.qr_code,color: Colors.black),),
                                  title: const Text( "Mã QR"),
                                ),
                                ListTile(
                                  leading: IconButton(
                                    onPressed: (){
                                    },
                                    icon: const Icon(Icons.payment,color: Colors.black),),
                                  title: const Text( "Đơn đặt hàng và thanh toán"),
                                ),
                                ListTile(
                                  leading: IconButton(
                                    onPressed: (){
                                    },
                                    icon: const Icon(Icons.list,color: Colors.black),),
                                  title: const Text( "Bạn thân"),
                                ),
                                ListTile(
                                  leading: IconButton(
                                    onPressed: (){
                                    },
                                    icon: const Icon(Icons.star_outline,color: Colors.black),),
                                  title: const Text( "Yêu thích"),
                                ),
                                ListTile(
                                  leading: IconButton(
                                    onPressed: (){
                                      AuthController.instance.logOut();
                                    },
                                    icon: const Icon(Icons.logout,color: Colors.black),),
                                  title: const Text( "Đăng xuất"),
                                ),

                              ],
                            ),
                          );
                        });
                  },
                  child: const Icon(Icons.menu),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(top: 60),
            height: 90,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProfileWidget(),
                const SizedBox(width: 45,),
                GestureDetector(
                  onTap: (){},
                    child: _subDataProfile(364, "Bài viết")),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){},
                  child: _subDataProfile(113, "Người theo dõi"),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){},
                  child: _subDataProfile(138, "Đang theo dõi"),
                ),
              ],
            ),
          ),
          Container(
            margin:const EdgeInsets.only(top: 170),
            padding:const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white38,

                    ),
                      child:const Text('Chỉnh sửa',style: TextStyle(
                        fontSize: 10,
                        color: Colors.black
                      ),),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white38,

                    ),
                    child:const Text('Chia sẻ trang cá nhân',style: TextStyle(
                        fontSize: 10,
                        color: Colors.black
                    ),),
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white38,
                    ),
                    child:const Icon(Icons.person_add,color: Colors.black,size: 15,)
                  ),
                ),

              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 240,left: 20,right: 20),
            child: Row(
              children:const [
                Text('Khám phá mọi người',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Spacer(),
                Text('Xem tất cả',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 270,left: 20,right: 20),
            height: 180,
            child:  ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: user?.results?.length,
                    itemBuilder: (BuildContext context,int index){
                final item = user?.results?[index];
                if (item == null) {
                  return Shimmer(
                    // ignore: sort_child_properties_last
                    child: const CircularProgressIndicator(),
                    color: Colors.grey,
                  );
                }
                return UserCardWidget(
                    name: item.name?.last??"",
                    urlImage: item.picture?.medium??"");

                    })
                ),
          Container(
            margin: const EdgeInsets.only(top: 480),
            child: GridView.builder(
              itemCount: poster?.data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (BuildContext context, int index) {
                final item = poster?.data?[index];
                if (item == null) {
                  return Shimmer(
                    duration: const Duration(seconds: 3), //Default value
                    interval: const Duration(
                        seconds: 5), //Default value: Duration(seconds: 0)
                    color: Colors.grey, //Default value
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
          )
        ],
      ),
    );
  }
  Widget _subDataProfile(int count,String title){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(count.toString(),style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold
        ),),
        Text(title,style: const TextStyle(
          fontSize: 10,
        ),)

      ],
    );
  }
}
