import 'package:beetleware_task/application_localizations.dart';
import 'package:beetleware_task/provider/providerData.dart';
import 'package:beetleware_task/views/pages/main_page.dart';
import 'package:beetleware_task/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var sharedData = prefs.getString('sharedData');
  var lang = prefs.getString('language');
  print('get language ${lang}');
  runApp(
    ChangeNotifierProvider(
      create: (_) => DataProvider(),
      builder: (context, _) => MaterialApp(
        supportedLocales: [Locale('en'), Locale('ar')],
        locale: Provider.of<DataProvider>(context).locale == null
            ? lang == null
                ? Provider.of<DataProvider>(context).locale
                : Locale(lang)
            : Provider.of<DataProvider>(context).locale,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        debugShowCheckedModeBanner: false,
        title: 'Login_text',
        builder: EasyLoading.init(),
        initialRoute: sharedData == null ? 'pageLogin' : 'pageHome',
        routes: {
          'pageLogin': (context) => LoginPage(),
          'pageHome': (context) => MainPage(),
        },
      ),
    ),
  );
}
