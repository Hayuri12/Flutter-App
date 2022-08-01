// ignore_for_file: deprecated_member_use

import 'package:ecommer_shop/core/const.dart';
import 'package:ecommer_shop/core/my_flutter_app.dart';
import 'package:ecommer_shop/models/chairs_model.dart';
import 'package:ecommer_shop/widgets/appclipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:size_config/size_config.dart';

class DetailPage extends StatefulWidget {
  final ChairModels chairModels;
  const DetailPage(this.chairModels);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "CATEGORIES",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            MyFlutterApp.left_open,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              MyFlutterApp.basket,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 25),
        ],
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Stack(children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.shortestSide,
              width: MediaQuery.of(context).size.shortestSide,
              child: ClipPath(
                clipper: AppClipper(),
                child: Container(
                  color: AppColors.three,
                  //the Padding is for the chairModels names
                  padding: EdgeInsets.only(top: 200, right: 250, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.chairModels.name,
                          style: const TextStyle(
                            fontSize: 36,
                          ),
                        ),
                      ),
                      _buildRating(),
                      const SizedBox(height: 24),
                      const Text(
                        "Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        widget.chairModels.desc,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Colors",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          _buildColorOption(Colors.white),
                          _buildColorOption(AppColors.two),
                          _buildColorOption(Colors.grey),
                          _buildColorOption(Colors.black)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned (
            bottom: 0,
            child : _buildBottom(),
            ),
            Positioned(
              top: 100,
              right: 0,
              child: Image(
                // fit: BoxFit.cover,
                height: 378,
                width: 364,
                image: AssetImage("assets/${widget.chairModels.imgpath}")),
            )
        ]),
      ),
      
    );
  }

  Widget _buildBottom() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      width: MediaQuery.of(context).size.width,
      decoration:const  BoxDecoration(
        color: AppColors.two,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "PRICE",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text("${widget.chairModels.price.toInt()}MAD",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
                  ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 50),
          decoration: const BoxDecoration(
            color: AppColors.five,
            borderRadius: BorderRadius.all(Radius.circular(50),),
          ),
          child: const Text(
            "ADD TO CART",
            style: TextStyle(
            color: Colors.black,
          ),
          ),
          )
      ]
      ),
    );
  }

  Container _buildColorOption(Color couleur) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: couleur,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }

  Widget _buildRating() {
    return Row(
      children: <Widget>[
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemSize: 30,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
      ],
    );
  }
}
