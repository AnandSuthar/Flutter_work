//https://codelabs.developers.google.com/codelabs/mdc-103-flutter/#4
//https://www.youtube.com/watch?v=ju1fr9C4g4U
import 'package:flutter/material.dart';
import 'consts.dart';



class MaterialThemeData {

  static final ThemeData lightThemeBase = ThemeData.light();
  static final ThemeData darkThemeBase = ThemeData.dark();
//  static final ShapeBorder buttonBorder = RoundedRectangleBorder(
//    borderRadius: BorderRadius.circular(20.0),
//  );


  static TextTheme textThemeLight(TextTheme base) {
    return base.copyWith(

      display4: base.display4.copyWith(color: constColors.display4TextColorLight),
      display3: base.display3.copyWith(color: constColors.display3TextColorLight),
      display2: base.display2.copyWith(color: constColors.display2TextColorLight),
      display1: base.display1.copyWith(color: constColors.display1TextColorLight),
      headline: base.headline.copyWith(color: constColors.headlineTextColorLight),
      title: base.title.copyWith(color: constColors.titleTextColorLight),
      subhead: base.subhead.copyWith(
          color: constColors.subheadTextColorLight,
          height: 5.0
      ),
      body2: base.body2.copyWith(color: constColors.body2TextColorLight),
      body1: base.body1.copyWith(color: constColors.body1TextColorLight),
      caption: base.caption.copyWith(color: constColors.captionTextColorLight),
      button: base.button.copyWith(color: constColors.buttonTextColorLight),
      subtitle: base.subtitle.copyWith(color: constColors.subtitleTextColorLight),
      overline: base.overline.copyWith(color: constColors.overlineTextColorLight),

    );
  }
  static TextTheme textThemeDark(TextTheme base) {
    return base.copyWith(

      display4: base.display4.copyWith(color: constColors.display4TextColorDark),
      display3: base.display3.copyWith(color: constColors.display3TextColorDark),
      display2: base.display2.copyWith(color: constColors.display2TextColorDark),
      display1: base.display1.copyWith(color: constColors.display1TextColorDark),
      headline: base.headline.copyWith(color: constColors.headlineTextColorDark),
      title: base.title.copyWith(
        color: constColors.titleTextColorDark,
        decorationColor: Colors.green,
      ),
      subhead: base.subhead.copyWith(color: constColors.subheadTextColorDark),
      body2: base.body2.copyWith(color: constColors.body2TextColorDark),
      body1: base.body1.copyWith(color: constColors.body1TextColorDark),
      caption: base.caption.copyWith(color: constColors.captionTextColorDark),
      button: base.button.copyWith(color: constColors.buttonTextColorDark),
      subtitle: base.subtitle.copyWith(color: constColors.subtitleTextColorDark),
      overline: base.overline.copyWith(color: constColors.overlineTextColorDark),

    );
  }

  static AppBarTheme appBarThemeLight(AppBarTheme base) {
    return base.copyWith(
        elevation: 0
      //textTheme: textThemeLight(base.textTheme)
    );
  }
  static AppBarTheme appBarThemeDark(AppBarTheme base) {
    return base.copyWith(
        elevation: 0
      //textTheme: textThemeDark(base.textTheme)
    );
  }

  static ButtonThemeData buttonThemeLight(ButtonThemeData base){
    return base.copyWith(
      buttonColor: Colors.red,
      highlightColor: Colors.yellow,
      splashColor: Colors.red,
      focusColor: Colors.orange,
      shape: StadiumBorder(),
    );
  }
  static ButtonThemeData buttonThemeDark(ButtonThemeData base) {
    return base.copyWith(
      buttonColor: constColors.darkTitleColor,
      highlightColor: constColors.lightSubtitleColor,
      shape: StadiumBorder(),
    );
  }

  static IconThemeData iconThemeLight(IconThemeData base){
    return base.copyWith(
        color: constColors.darkAccent,
        size: 20.0
    );
  }
  static IconThemeData iconThemeDark(IconThemeData base){
    return base.copyWith(
        color: constColors.lightBG,
        size: 22.0
    );
  }

  static InputDecorationTheme inputDecorationThemeLight(InputDecorationTheme base) {

    TextStyle textStyleLabelLight = TextStyle(
      color: Colors.white,
      //height: -15.0
    );

    return base.copyWith(
      //contentPadding: EdgeInsets.symmetric(vertical: 50.0),
      //contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      //filled: true,
      //fillColor: constColors.textFormFieldFillColorLight,
      focusColor: Colors.redAccent,
      labelStyle: textStyleLabelLight,
      hintStyle: textStyleLabelLight,
      border: InputBorder.none,


//      border: OutlineInputBorder(
//        borderRadius: BorderRadius.all(Radius.circular(20)),
////      borderSide: BorderSide(
////        color: Colors.green
////      )
//      ),
    );
  }
  static InputDecorationTheme inputDecorationThemeDark(InputDecorationTheme base) {

    TextStyle textStyleLabelDark = TextStyle(
        color: Colors.white
    );

    return base.copyWith(
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      //filled: true,
      //fillColor: constColors.textFormFieldFillColorDark,
      labelStyle: textStyleLabelDark,
//      border: OutlineInputBorder(
//        borderRadius: BorderRadius.all(Radius.circular(20)),
////      borderSide: BorderSide(
////        color: Colors.green
////      )
//      ),
    );
  }




  static ThemeData lightTheme = lightThemeBase.copyWith(
      backgroundColor:          constColors.lightBG,
      primaryColor:             constColors.lightPrimary,
      accentColor:              constColors.lightAccent,
      scaffoldBackgroundColor:  constColors.lightBG,
      //cursorColor:              constColors.lightAccent,

      inputDecorationTheme:     inputDecorationThemeLight(lightThemeBase.inputDecorationTheme),
      textTheme:                textThemeLight(lightThemeBase.textTheme),
      buttonTheme:              buttonThemeLight(lightThemeBase.buttonTheme),
      appBarTheme:              appBarThemeLight(lightThemeBase.appBarTheme),
      iconTheme:                iconThemeLight(lightThemeBase.iconTheme)
  );

  static ThemeData darkTheme = darkThemeBase.copyWith(
      backgroundColor:          constColors.darkBG,
      primaryColor:             constColors.darkPrimary,
      accentColor:              constColors.darkAccent,
      scaffoldBackgroundColor:  constColors.darkBG,
      //cursorColor:              constColors.darkAccent,

      inputDecorationTheme:     inputDecorationThemeDark(darkThemeBase.inputDecorationTheme),
      textTheme:                textThemeLight(darkThemeBase.textTheme),
      buttonTheme:              buttonThemeLight(darkThemeBase.buttonTheme),
      appBarTheme:              appBarThemeLight(darkThemeBase.appBarTheme),
      iconTheme:                iconThemeLight(darkThemeBase.iconTheme)
  );


}

