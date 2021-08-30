import 'package:beetleware_task/model/color_model.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String itemCount, itemName;

  const CustomCard({Key key, this.itemCount, this.itemName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorModel.mainColor,
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: IntrinsicHeight(
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: ColorModel.whiteColor,
                radius: 25,
                child: Image.asset('assets/images/ic_sold_items.png'),
              ),
              VerticalDivider(
                thickness: 1,
                color: ColorModel.whiteColor,
              ),
              Column(
                children: [
                  Text(
                    itemCount,
                    style:
                        TextStyle(color: ColorModel.whiteColor, fontSize: 30),
                  ),
                  Text(
                    itemName,
                    style: TextStyle(
                        color: ColorModel.whiteColor,
                        fontWeight: FontWeight.w300),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
