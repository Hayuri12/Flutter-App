import 'package:ecommer_shop/core/const.dart';
import 'package:flutter/material.dart';

class ChairModels{
  final String name;
  final double price;
  final Color color;
  final String desc;
  final String imgpath;

ChairModels({
  required this.name, 
  required this.price,
   required this.color,
   required this.desc,
   required this.imgpath,

});

static List<ChairModels>list = [
  ChairModels(
    name: "Stylish Vincent Sheppard chair",
    price: 300,
    color: AppColors.one,
    desc:"This Chair is very confortable, soft and healthy for your back. This product is only available in our application, it's handmade, also the quality is very high. The price is reasonable, and if you purchase this product 10% of it's price will be donated to various Children Shelters.", 
    imgpath: "Untitled-1.png"
  ),
  ChairModels(
    name: "The Interiors Trends",
    price: 400,
    color: AppColors.two,
    desc:"This Chair is very confortable, soft and healthy for your back. This product is only available in our application, it's handmade, also the quality is very high. The price is reasonable, and if you purchase this product 10% of it's price will be donated to various Children Shelters.", 
    imgpath: "Untitled-2.png"
  ),
  ChairModels(
    name: "Chair",
    price: 350,
    color: AppColors.three,
    desc:"This Chair is very confortable, soft and healthy for your back. This product is only available in our application, it's handmade, also the quality is very high. The price is reasonable, and if you purchase this product 10% of it's price will be donated to various Children Shelters.", 
    imgpath: "Untitled-3.png",
  ),
 ChairModels(
    name: "Chair",
    price: 350,
    color: AppColors.four,
    desc:"This Chair is very confortable, soft and healthy for your back. This product is only available in our application, it's handmade, also the quality is very high. The price is reasonable, and if you purchase this product 10% of it's price will be donated to various Children Shelters.", 
    imgpath: "Untitled-4.png",
  ),
 
];
}