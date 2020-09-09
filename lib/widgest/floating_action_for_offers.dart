import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';

class CustomFloatingButtonForOffers extends StatelessWidget {
  final Function onTapShare, onTapRating;

  CustomFloatingButtonForOffers({this.onTapShare, this.onTapRating});

  @override
  Widget build(BuildContext context) {
    return AnimatedFloatingActionButton(
      fabButtons: <Widget>[
        share(onTapShare),
        rating(onTapRating),
      ],
      animatedIconData: AnimatedIcons.view_list,
    );
  }

  Widget share(Function onTap) {
    return Container(
      child: FloatingActionButton(
        onPressed: onTap,
        heroTag: "",
        tooltip: 'مشاركة',
        child: Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget rating(Function onTap) {
    return Container(
      child: FloatingActionButton(
        onPressed: onTap,
        heroTag: "Image",
        tooltip: 'تقييم',
        child: Icon(
          Icons.star_border,
          color: Colors.white,
        ),
      ),
    );
  }
}
