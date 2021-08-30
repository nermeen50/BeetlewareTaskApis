import 'package:beetleware_task/application_localizations.dart';
import 'package:beetleware_task/model/login_model.dart';
import 'package:beetleware_task/model/itemCount_model.dart';
import 'package:beetleware_task/model/profile_model.dart';
import 'package:beetleware_task/services/apis.dart';
import 'package:beetleware_task/views/pages/home_page.dart';
import 'package:beetleware_task/views/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataProvider extends ChangeNotifier {
  LoginModel _loginModel = LoginModel();
  Apis apis = Apis();
  ItemModel _itemModel = ItemModel();
  ItemModel _itemModel2 = ItemModel();
  ProfileModel _profileModel = ProfileModel();
  Locale locale;
  String selectedItem = 'اللغه العربيه';
  List<String> options = ['اللغه العربيه', 'English'];
  int currentIndex = 1;
  String _appBarTitle;
  final List<Widget> children = [
    Text(''),
    HomePage(),
    ProfilePage(),
  ];
  String get appBarTitle => _appBarTitle;

  set appBarTitle(String appBarTitle) {
    _appBarTitle = appBarTitle;
    notifyListeners();
  }

  LoginModel get loginModel => _loginModel;

  set loginModel(LoginModel loginModel) {
    _loginModel = loginModel;
    notifyListeners();
  }

  ItemModel get itemModel => _itemModel;

  set itemModel(ItemModel itemModel) {
    _itemModel = itemModel;
    notifyListeners();
  }

  ItemModel get itemModel2 => _itemModel2;

  set itemModel2(ItemModel itemModel2) {
    _itemModel2 = itemModel2;
    notifyListeners();
  }

  ProfileModel get profileModel => _profileModel;

  set profileModel(ProfileModel profileModel) {
    _profileModel = profileModel;

    notifyListeners();
  }

  Future<void> fetchLoginData(context, username, password) async {
    loginModel = await apis.loginApi(context, username, password);
    notifyListeners();
  }

  Future<void> fetchsolidCount() async {
    itemModel = await apis.solidItemApi();
    notifyListeners();
  }

  Future<void> fetchproductCount() async {
    itemModel2 = await apis.productItemApi();
    notifyListeners();
  }

  Future<void> fetchProfileData() async {
    profileModel = await apis.profileApi();
    notifyListeners();
  }

  void onTabTapped(int index, context) async {
    currentIndex = index;
    if (currentIndex == 0) {
      appBarTitle =
          AppLocalizations.of(context).translate('AppBar_title2').toString();
    } else if (currentIndex == 1) {
      appBarTitle =
          AppLocalizations.of(context).translate('AppBar_title1').toString();
    } else {
      appBarTitle =
          AppLocalizations.of(context).translate('AppBar_title3').toString();
    }
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    print(preferences.get("sharedData"));
    Navigator.pushNamedAndRemoveUntil(
        context, "pageLogin", (Route<dynamic> route) => false);
    notifyListeners();
  }

// sssssss
  void setLocale(Locale value) async {
    locale = value;
    notifyListeners();
  }

  void selectedLang(value) async {
    selectedItem = value;

    if (selectedItem == 'اللغه العربيه') {
      setLocale(Locale('ar'));
      print(selectedItem);
    } else {
      setLocale(Locale('en'));
      print(selectedItem);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', locale.toString());

    print('set language  ${prefs.get('language')}');
    // selectedItem = value;
    notifyListeners();
  }
}
