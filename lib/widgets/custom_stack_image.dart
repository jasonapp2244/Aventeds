import 'package:flutter/material.dart';

class ImageStackWidget extends StatelessWidget {
  List? images;
  ImageStackWidget({this.images});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < images!.length; i++)
            Align(
              widthFactor: .3,
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                margin: EdgeInsets.only(left: i.toDouble() * 10),
                child: CircleAvatar(backgroundImage: AssetImage(images![i])),
              ),
            ),
        ],
      ),
    );
  }
}
