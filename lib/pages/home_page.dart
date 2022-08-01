import 'package:ecommer_shop/core/const.dart';
import 'package:ecommer_shop/core/my_flutter_app.dart';
import 'package:ecommer_shop/models/chairs_model.dart';
import 'package:ecommer_shop/pages/details_page.dart';
import 'package:ecommer_shop/widgets/appclipper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<ChairModels> chairList = ChairModels.list;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            MyFlutterApp.menu,
          ),
          color: Colors.black,
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                IconButton(
                  icon: const Icon(MyFlutterApp.search),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            // width: 250,
            height: 250,
            child: ListView.builder(
              itemCount: chairList.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          chairList[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 10),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: _buildBackground(chairList, index, 230),
                        ),
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: AspectRatio(
                              aspectRatio: 1.15,
                              child: Image(
                                image: AssetImage(
                                    "assets/${chairList[index].imgpath}"),
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  "Just for You",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "View all",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...chairList.map((data) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DetailPage(
                      data,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ]),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/${data.imgpath}"),
                      width: 100,
                      height: 80,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Text(
                              data.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12)),
                    Text(
                      "${data.price.toInt()}mad",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              spreadRadius: 1,
              blurRadius: 10,
            )
          ],
        ),
        child: BottomNavigationBar(
            selectedItemColor: AppColors.buttonColor,
            unselectedItemColor: Colors.black,
            currentIndex: 1,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(MyFlutterApp.compass),
                ),
                label: 'compass',
              ),
              BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.list),
                label: 'list',
              ),
              BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.shopping_bag),
                label: 'bag',
              ),
              BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.user),
                label: 'user',
              ),
            ]),
      ),
    );
  }

  Widget _buildBackground(
      List<ChairModels> chairList, int index, double width) {
    return ClipPath(
      clipper: AppClipper(),
      child: Container(
        color: chairList[index].color,
        width: width,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(child: SizedBox()),
                    Container(
                      width: 125,
                      child: Text(
                        chairList[index].name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${chairList[index].price}MAD",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ]),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    color: AppColors.five,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                    )),
                child: Center(
                  child: IconButton(
                    icon: const Icon(MyFlutterApp.plus),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DetailPage(
                            chairList[index],
                          ),
                        ),
                      );
                    },
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
