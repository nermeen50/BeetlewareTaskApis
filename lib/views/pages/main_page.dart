import 'package:beetleware_task/application_localizations.dart';
import 'package:beetleware_task/model/color_model.dart';
import 'package:beetleware_task/provider/providerData.dart';

import 'package:beetleware_task/widgets/custom_card.dart';
import 'package:beetleware_task/widgets/custom_profileBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initStatebbfdbfdfdgdf
    super.initState();
    Provider.of<DataProvider>(context, listen: false).fetchsolidCount();
    Provider.of<DataProvider>(context, listen: false).fetchproductCount();
    Provider.of<DataProvider>(context, listen: false).fetchProfileData();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<DataProvider>(context, listen: false)
            .onTabTapped(1, context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorModel.homeMainColor,
          centerTitle: true,
          leading: Image.asset(
            'assets/images/ic_title_bar_logo.png',
            fit: BoxFit.contain,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none_sharp),
              onPressed: () {},
            )
          ],
          elevation: 0.0,
          flexibleSpace: Provider.of<DataProvider>(context).currentIndex == 2
              ? ProfileBottomBar()
              : Text(''),
          title: Text("${Provider.of<DataProvider>(context).appBarTitle}"),
          bottom: PreferredSize(
            preferredSize: Provider.of<DataProvider>(context).currentIndex == 1
                ? Size(double.infinity, 120)
                : Size(double.infinity, 80),
            child: Provider.of<DataProvider>(context).currentIndex == 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomCard(
                          itemCount: Provider.of<DataProvider>(context)
                              .itemModel
                              .data
                              .toString(),
                          itemName: AppLocalizations.of(context)
                              .translate('Item1')
                              .toString()),
                      CustomCard(
                        itemCount: Provider.of<DataProvider>(context)
                            .itemModel2
                            .data
                            .toString(),
                        itemName: AppLocalizations.of(context)
                            .translate('Item2')
                            .toString(),
                      ),
                    ],
                  )
                : Text(''),
          ),
        ),
        body: Provider.of<DataProvider>(context)
            .children[Provider.of<DataProvider>(context).currentIndex],
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: ColorModel.mainColor,
          onPressed: () {
            Provider.of<DataProvider>(context, listen: false)
                .onTabTapped(1, context);
          },
          child: Icon(Icons.home, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Provider.of<DataProvider>(context).currentIndex == 0
                      ? ColorModel.mainColor
                      : Colors.grey,
                ),
                onPressed: () {
                  Provider.of<DataProvider>(context, listen: false)
                      .onTabTapped(0, context);
                },
                splashColor: Colors.white,
              ),
              SizedBox.fromSize(
                size: Size(MediaQuery.of(context).size.width * 0.1, 0.0),
              ),
              IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Provider.of<DataProvider>(context).currentIndex == 2
                        ? ColorModel.mainColor
                        : Colors.grey,
                  ),
                  onPressed: () {
                    Provider.of<DataProvider>(context, listen: false)
                        .onTabTapped(2, context);
                  }),
            ],
          ),
        ));
  }
}
