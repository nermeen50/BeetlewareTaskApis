import 'package:beetleware_task/application_localizations.dart';
import 'package:beetleware_task/model/color_model.dart';
import 'package:beetleware_task/provider/providerData.dart';
import 'package:beetleware_task/widgets/custom_profileBodyCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileBodyCard(
            iconName: Icon(
              Icons.notifications_none_outlined,
              color: ColorModel.mainColor,
            ),
            listTitle: AppLocalizations.of(context)
                .translate('Notification')
                .toString(),
            iconTrailing:
                Icon(Icons.arrow_forward, color: ColorModel.mainColor),
            onTapCard: () {},
          ),
          ProfileBodyCard(
            iconName: Icon(
              Icons.settings_input_composite_sharp,
              color: ColorModel.mainColor,
            ),
            listTitle:
                AppLocalizations.of(context).translate('Setting').toString(),
            iconTrailing:
                Icon(Icons.arrow_forward, color: ColorModel.mainColor),
            onTapCard: () {},
          ),
          ProfileBodyCard(
            iconName: Icon(
              Icons.logout,
              color: ColorModel.mainColor,
            ),
            listTitle:
                AppLocalizations.of(context).translate('Logout').toString(),
            iconTrailing:
                Icon(Icons.arrow_forward, color: ColorModel.mainColor),
            onTapCard: () {
              Provider.of<DataProvider>(context, listen: false).logout(context);
            },
          ),
        ],
      ),
    );
  }
}
