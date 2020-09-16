import 'package:flutter/material.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/data/models/shop.dart';
import 'package:mawy_app/functions/navigation_funs.dart';
import 'package:mawy_app/screens/shop_details.dart';

Widget listOfShops({List<ShopData> shops}){
  return Padding(
    padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
    child: GridView.builder(
        shrinkWrap: true,
        itemCount: shops.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.8
        ),
        itemBuilder: (context , index){
          return GestureDetector(
            onTap: (){
              normalShift(context, ShopDetails(shop: shops[index],));
            },
            child: Container(
              height: MediaQuery.of(context).size.height*0.1,
              decoration: BoxDecoration(
                  color: MAIN_COLOR,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.white,)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(shops[index].shopName ?? "", style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),),
                  ),
                ],
              ),
            ),
          );
        }),
  );
}