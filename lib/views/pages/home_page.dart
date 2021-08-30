import 'package:beetleware_task/application_localizations.dart';
import 'package:beetleware_task/widgets/custom_bodyCard.dart';
import 'package:flutter/material.dart';

// ssssss
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          BodyCard(
            imageName: 'assets/images/splash.png',
            imageTitle:
                AppLocalizations.of(context).translate('Card1_Name').toString(),
          ),
          BodyCard(
            imageName: 'assets/images/computer-search.jpg',
            imageTitle:
                AppLocalizations.of(context).translate('Card2_Name').toString(),
          ),
        ],
      ),
    );
  }
}
