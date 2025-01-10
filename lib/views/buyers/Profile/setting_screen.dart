
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:winkle_final/Utilis/commonappbarview.dart';
import 'package:winkle_final/Utilis/commoncard.dart';
import 'package:winkle_final/Utilis/enum.dart';
import 'package:winkle_final/Utilis/text_styles.dart';
import 'package:winkle_final/Utilis/themes.dart';
import 'package:winkle_final/provider/themeprovider.dart';
import 'package:winkle_final/utils/settinglist.dart';
import 'package:winkle_final/views/buyers/Profile/countryscreen.dart';
import 'package:winkle_final/views/buyers/Profile/currencyscreen.dart';


class RemoveFocuse extends StatelessWidget {
  const RemoveFocuse({Key? key, required this.child, this.onClick})
      : super(key: key);
  final Widget child;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? GestureDetector(
            onTap: onClick,
            child: child,
          )
        : InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: onClick,
            child: child,
          );
  }
}
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>  {
  List<SettingsListData> settingsList = SettingsListData.settingsList;
  var country = 'Australia';
  var currency = '\$ AUD';
  int selectedradioTile = 0;
  List<String> data = ["English", "French", "Arabic", "Japanese"];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: RemoveFocuse(
            onClick: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CommonAppbarView(
                  iconData: Icons.arrow_back,
                  onBackClick: () {
                    Navigator.pop(context);
                  },
                  titleText: "Setting",
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 16),
                    itemCount: settingsList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                         if (index == 1) {
                            // Perform the desired action for index 1
                          } else if (index == 6) {
                            _gotoCurrencyScreen();
                          } else if (index == 5) {
                            _gotoCountryScreen();
                          } else if (index == 2) {
                            _getFontPopUI();
                          } else if (index == 3) {
                            _getColorPopUI();
                          } else if (index == 4) {
                            _getLanguageUI();
                          } 
                          // else if (index == 10) {
                          //   _gotoSplashScreen();
                          // }
                        },
                     
                     
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, right: 16),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        settingsList[index].titleTxt,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  index == 5
                                      ? Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: getTextUi(country),
                                        )
                                      : index == 6
                                          ? Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: getTextUi(currency),
                                            )
                                          : index == 1
                                              ? _themeUI()
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: Container(
                                                    child: Icon(
                                                      settingsList[index]
                                                          .iconData,
                                                      color: AppTheme
                                                          .secondaryTextColor,
                                                    ),
                                                  ),
                                                )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Divider(
                                height: 1,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _themeUI() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: PopupMenuButton<ThemeModeType>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onSelected: (type) {
          type == ThemeModeType.system
              ? themeProvider.updateThemeMode(ThemeModeType.system)
              : type == ThemeModeType.light
                  ? themeProvider.updateThemeMode(ThemeModeType.light)
                  : themeProvider.updateThemeMode(ThemeModeType.dark);
          setState(() {});
        },
        icon: Icon(
          themeProvider.themeModeType == ThemeModeType.system
              ? FontAwesomeIcons.adjust
              : themeProvider.themeModeType == ThemeModeType.light
                  ? FontAwesomeIcons.cloudSun
                  : FontAwesomeIcons.cloudMoon,
          color: AppTheme.secondaryTextColor,
        ),
        offset: Offset(10, 18),
        itemBuilder: (context) => [
          ...ThemeModeType.values.toList().map(
                (e) => PopupMenuItem(
                  value: e,
                  child: _getSelectedUI(
                    e == ThemeModeType.system
                        ? FontAwesomeIcons.adjust
                        : e == ThemeModeType.light
                            ? FontAwesomeIcons.cloudSun
                            : FontAwesomeIcons.cloudMoon,
                    e.toString().split(".")[1],
                    e == themeProvider.themeModeType,
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Widget getTextUi(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _getSelectedUI(IconData icon, String text, bool isCurrent) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: isCurrent ? AppTheme.primaryColor : AppTheme.primaryTextColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              text,
              style: TextStyle(
                color: isCurrent ? AppTheme.primaryColor : AppTheme.primaryTextColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  _getFontPopUI() {
    final List<Widget> fontArray = [];
    FontFamilyType.values.toList().forEach(
      (element) {
        fontArray.add(
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                context.read<ThemeProvider>().updateFontType(element);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                   "Hello",
                      style: AppTheme.getTextStyle(
                        element,
                        TextStyles(context).getRegularStyle().copyWith(
                            color: context.read<ThemeProvider>().fontType ==
                                    element
                                ? AppTheme.primaryColor
                                : AppTheme.fontcolor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: FontFamilyType.WorkSans == element ? 3 : 0),
                      child: Text(
                        element.toString().split('.')[1],
                        style: AppTheme.getTextStyle(
                          element,
                          TextStyles(context).getRegularStyle().copyWith(
                              color: context.read<ThemeProvider>().fontType ==
                                      element
                                  ? AppTheme.primaryColor
                                  : AppTheme.fontcolor),
                        ).copyWith(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: CommonCard(
                    color: AppTheme.backgroundColor,
                    radius: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                          "Selected fonts",
                            style: TextStyles(context)
                                .getBoldStyle()
                                .copyWith(fontSize: 22),
                          ),
                        ),
                        Divider(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  fontArray[0],
                                  fontArray[1],
                                  fontArray[2],
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  fontArray[3],
                                  fontArray[4],
                                  fontArray[5],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }

  _getColorPopUI() {
    final List<Widget> fontArray = [];

    ColorType.values.toList().forEach((element) {
      fontArray.add(
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            onTap: () {
              context.read<ThemeProvider>().updateColorType(element);
              Navigator.pop(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 48,
                    width: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: context.read<ThemeProvider>().colorType ==
                                    element
                                ? AppTheme.getColor(element)
                                : Colors.transparent)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.getColor(element)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: CommonCard(
              color: AppTheme.backgroundColor,
              radius: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                     "Selected color",
                      style: TextStyles(context)
                          .getBoldStyle()
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  Divider(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        fontArray[0],
                        fontArray[1],
                        fontArray[2],
                        fontArray[3]
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getLanguageUI() {
    final List<Widget> languageArray = [];
    final list = LanguageType.values.toList();

    list.forEach(
      (element) {
        languageArray.add(
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              context.read<ThemeProvider>().updateLanguage(element);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, bottom: 16, top: 16, right: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  context.read<ThemeProvider>().languageType == element
                      ? Icon(Icons.radio_button_checked)
                      : Icon(Icons.radio_button_off),
                  Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Text(data[element.index]))
                ],
              ),
            ),
          ),
        );
      },
    );
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 240,
            child: CommonCard(
              color: AppTheme.backgroundColor,
              radius: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                    child: Text(
                     "Selected language",
                      style: TextStyles(context)
                          .getBoldStyle()
                          .copyWith(fontSize: 22),
                    ),
                  ),
                  Divider(
                    height: 16,
                  ),
                  for (var item in languageArray) item,
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
// void _gotoSplashScreen() async {
//   bool isOk = await showDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Are you sure?"),
//         content: Text("You want to Sign Out."),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(false); // User pressed No
//             },
//             child: Text("No"),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(true); // User pressed Yes
//             },
//             child: Text("Yes"),
//           ),
//         ],
//       );
//     },
//   );

//   if (isOk == true) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => LoginScreen(),
//       ),
//     );
//   }
// }


  void _gotoCountryScreen() {
    // Perform navigation to the country screen
   Navigator.push(
    context,
   MaterialPageRoute(builder: (context) => CountryScreen()));
  }

  void _gotoCurrencyScreen() {
    // Perform navigation to the currency screen
   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CurrencyScreen()));
  }
 
  SplashScreen() {}

}