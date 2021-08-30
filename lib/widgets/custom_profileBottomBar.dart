import 'package:beetleware_task/application_localizations.dart';
import 'package:beetleware_task/model/color_model.dart';
import 'package:beetleware_task/provider/providerData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileBottomBar extends StatelessWidget {
  static const double _appBarBottomBtnPosition = 100.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.19,
      width: double.infinity,
      child: Transform.translate(
        offset: Offset(0.0, _appBarBottomBtnPosition),
        child: Card(
            color: ColorModel.mainColor,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        '${Provider.of<DataProvider>(context, listen: false).profileModel.data.avatar}'),
                  ),
                  title: Text(
                      "${Provider.of<DataProvider>(context, listen: false).profileModel.data.name}",
                      style: TextStyle(
                          color: ColorModel.whiteColor,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      AppLocalizations.of(context).translate('Customer'),
                      style: TextStyle(
                          color: ColorModel.whiteColor,
                          fontWeight: FontWeight.w300)),
                  trailing: Icon(
                    Icons.edit,
                    color: ColorModel.secondryColor,
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                              AppLocalizations.of(context)
                                  .translate('Number_salses'),
                              style: TextStyle(
                                  color: ColorModel.whiteColor,
                                  fontWeight: FontWeight.bold)),
                          Text(
                              AppLocalizations.of(context)
                                  .translate('Customer'),
                              style: TextStyle(
                                  color: ColorModel.whiteColor,
                                  fontWeight: FontWeight.w300))
                        ],
                      ),
                      VerticalDivider(
                        color: ColorModel.whiteColor,
                        width: 1.0,
                      ),
                      Column(
                        children: [
                          Text(
                              AppLocalizations.of(context)
                                  .translate('Number_salses'),
                              style: TextStyle(
                                  color: ColorModel.whiteColor,
                                  fontWeight: FontWeight.bold)),
                          Text(AppLocalizations.of(context).translate('Sales'),
                              style: TextStyle(
                                  color: ColorModel.whiteColor,
                                  fontWeight: FontWeight.w300))
                        ],
                      ),
                      VerticalDivider(
                        color: ColorModel.whiteColor,
                        width: 1.0,
                      ),
                      Column(
                        children: [
                          Text(
                              AppLocalizations.of(context)
                                  .translate('Number_salses'),
                              style: TextStyle(
                                  color: ColorModel.whiteColor,
                                  fontWeight: FontWeight.bold)),
                          Text(AppLocalizations.of(context).translate('Offers'),
                              style: TextStyle(
                                  color: ColorModel.whiteColor,
                                  fontWeight: FontWeight.w300))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
