
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:winkle_final/Utilis/commonappbarview.dart';
import 'package:winkle_final/Utilis/commoncard.dart';
import 'package:winkle_final/Utilis/commonsearchbar.dart';
import 'package:winkle_final/utils/settinglist.dart';
import 'package:winkle_final/views/buyers/Profile/howdoscreen.dart';





class HelpCenterScreen extends StatefulWidget {
  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    List<SettingsListData> helpSearchList = SettingsListData.helpSearchList;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: appBar(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                itemCount: helpSearchList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (helpSearchList[index].subTxt != "") {
                        // Navigate to HowDoScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HowDoScreen(),
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 16),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    helpSearchList[index].titleTxt != ""
                                        ? helpSearchList[index].titleTxt
                                        : helpSearchList[index].subTxt,
                                    style: TextStyle(
                                      fontWeight:
                                          helpSearchList[index].titleTxt != ""
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                      fontSize:
                                          helpSearchList[index].titleTxt != ""
                                              ? 18
                                              : 14,
                                    ),
                                  ),
                                ),
                              ),
                              helpSearchList[index].subTxt != ""
                                  ? Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Theme.of(context)
                                            .disabledColor
                                            .withOpacity(0.3),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
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
  }

  Widget appBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CommonAppbarView(
          onBackClick: () {
            Navigator.pop(context);
          },
          iconData: Icons.arrow_back,
          titleText: "How can we help you?",
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
          child: CommonCard(
            color: Theme.of(context).colorScheme.background,
            radius: 36,
            child: InkWell(
              onTap: () {
                // Navigate to HowDoScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HowDoScreen(),
                  ),
                );
              },
              child: CommonSearchBar(
                iconData: FontAwesomeIcons.search,
                text: "Search help articles",
              ),
            ),
          ),
        ),
      ],
    );
  }
}