import 'package:beetleware_task/application_localizations.dart';
import 'package:beetleware_task/model/color_model.dart';
import 'package:beetleware_task/provider/providerData.dart';
import 'package:beetleware_task/widgets/custom_canvas.dart';
import 'package:beetleware_task/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ColorModel.homeMainColor,
        elevation: 0.0,
        leading: PopupMenuButton(
          icon: Icon(Icons.language_outlined),
          itemBuilder: (BuildContext bc) {
            return Provider.of<DataProvider>(context, listen: false)
                .options
                .map((lang) => PopupMenuItem(
                      child: Text(lang),
                      value: lang,
                    ))
                .toList();
          },
          onSelected: (value) async {
            Provider.of<DataProvider>(context, listen: false)
                .selectedLang(value);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/splash.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  color: ColorModel.whiteColor,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.41,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: formKey,
                    child: Stack(
                      alignment: Alignment.lerp(
                          Alignment.center, Alignment.bottomCenter, 1.2),
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: CustomPaint(
                                painter: CurvePainter(),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .translate('Login_text')
                                        .toString(),
                                    style: TextStyle(
                                        color: ColorModel.whiteColor,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            CustomInput(
                              hintText: AppLocalizations.of(context)
                                  .translate('UserName_text')
                                  .toString(),
                              controllerInput: userNameController,
                              prefixIcon: Icon(Icons.person_outline_sharp),
                              obsecureText: false,
                              inputValidation: (value) {
                                if (value.isEmpty || value == null) {
                                  return AppLocalizations.of(context)
                                      .translate('Required_userName')
                                      .toString();
                                } else if (value.length > 15) {
                                  return AppLocalizations.of(context)
                                      .translate('Required_password')
                                      .toString();
                                } else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            CustomInput(
                              hintText: AppLocalizations.of(context)
                                  .translate('Password_text')
                                  .toString(),
                              controllerInput: passwordController,
                              prefixIcon: Icon(Icons.lock_outline_sharp),
                              obsecureText: true,
                              inputValidation: (value) {
                                if (value.isEmpty || value == null) {
                                  return AppLocalizations.of(context)
                                      .translate('Required_userName')
                                      .toString();
                                } else if (value.length < 6) {
                                  return AppLocalizations.of(context)
                                      .translate('Required_password')
                                      .toString();
                                } else
                                  return null;
                              },
                            ),
                          ],
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(7),
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              await Provider.of<DataProvider>(context,
                                      listen: false)
                                  .fetchLoginData(
                                      context,
                                      userNameController.text,
                                      passwordController.text);
                            }
                          },
                          color: ColorModel.mainColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)
                                    .translate('Login_text')
                                    .toString(),
                                style: TextStyle(
                                    color: ColorModel.whiteColor, fontSize: 17),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: ColorModel.whiteColor,
                                size: 25,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
