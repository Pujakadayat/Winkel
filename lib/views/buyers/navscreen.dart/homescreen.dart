import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/widgets/banner_widget.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/widgets/category_text.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/widgets/search_inputwidget.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/widgets/welcome_textwidget.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WelcomeText(),
    SizedBox(height: 10,),
        SearchInputWidget (),
        BannerWidget(),
       CategoryText()
      ],
    );
  }
  }