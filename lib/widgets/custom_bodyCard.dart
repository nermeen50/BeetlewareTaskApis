import 'package:beetleware_task/model/color_model.dart';
import 'package:flutter/material.dart';

class BodyCard extends StatelessWidget {
  final String imageName, imageTitle;

  const BodyCard({Key key, this.imageName, this.imageTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Image.asset(
            imageName,
            fit: BoxFit.cover,
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  imageTitle,
                  style: TextStyle(
                      color: ColorModel.secondryColor,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: ColorModel.secondryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
