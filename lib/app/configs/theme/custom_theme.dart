import 'package:flutter/material.dart';

/// Applies a boiller plate banking theme to descendant widgets.
///
/// A theme describes the colors and other choices of an application.
///
/// Descendant widgets obtain the current theme's [CustomThemeData]
/// object using [CustomTheme.of]. When a widget uses [CustomTheme.of],
/// it is automatically rebuilt if the theme later changes, so that the
/// changes can be applied.
///
/// See also:
///
///  * [CustomThemeData], which describes the actual configuration of a theme.
///  * [CustomFlavorThemeDataColors], which define the all app colors.
///  * [ThemeData.fromCustomTheme], which adapt this theme to a [Theme].
class CustomTheme extends InheritedWidget {
  const CustomTheme({
    Key? key,
    required this.child,
    required this.data,
    required this.onUpdate,
  }) : super(key: key, child: child);
  @override
  // ignore: overridden_fields
  final Widget child;
  final CustomThemeData data;
  final void Function(CustomThemeData) onUpdate;
  static CustomThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CustomTheme>()!.data;
  }

  static void update(BuildContext context, CustomThemeData data) {
    context.dependOnInheritedWidgetOfExactType<CustomTheme>()!.onUpdate(data);
  }

  @override
  bool updateShouldNotify(CustomTheme oldWidget) => true;
}

/// Widget subtree within the app. The app will adapt this theme
/// colors and other properties in material's [Theme] of its [MaterialApp] within it.
///
/// This can be used to configure the appearance of the entire app. Widget
/// subtree's within an app can override the app's banking theme by including a [CustomTheme]
/// widget at the top of the subtree.
///
/// Widgets whose appearance should align with the overall theme can obtain the
/// current theme's configuration with [CustomTheme.of].
///
/// The static [CustomTheme.of] method finds the [CustomThemeData]
/// value specified for the nearest [BuildContext] ancestor. This lookup is inexpensive, essentially
/// just a single HashMap access. It can sometimes be a little confusing
/// because [CustomTheme.of] can not see a [CustomTheme] widget that is defined in the
/// current build method's context. To overcome that, create a new custom widget
/// for the subtree that appears below the new [Theme], or insert a widget
/// that creates a new BuildContext, like [Builder].
///
/// In this example, the [Container] widget uses [Theme.of] to retrieve the
/// primary color from the theme's [colorScheme] to draw an amber square.
/// The [Builder] widget separates the parent theme's [BuildContext] from the
/// child's [BuildContext].
///
/// ```dart
/// CustomThemeData(
///   data: CustomThemeData(
///     colors: CustomFlavorThemeDataColors(...),
///   ),
///   child: Builder(
///     builder: (BuildContext context) {
///       return Container(
///         width: 100,
///         height: 100,
///         color: CustomTheme.of(context).colors.primary,
///       );
///     },
///   ),
/// )
/// ```
///
class CustomThemeData {
  CustomThemeData({
    this.colors,
    this.textTheme,
  });
  CustomColorsThemeData? colors;
  CustomTextThemeData? textTheme;

  ThemeData toMaterialTheme() {
    return ThemeData(
      fontFamily: 'Lato',
      //primarySwatch: Colors.grey,
      colorScheme: ColorScheme.light(
        primary: colors!.primary!,
        secondary: colors!.error!,
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: colors!.button),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      unselectedWidgetColor: colors!.gray150,

      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: colors!.text),
        headline2: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: colors!.text),
        headline3: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: colors!.text),
        headline4: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: colors!.text),
        headline5: TextStyle(
            fontSize: 20, fontWeight: FontWeight.normal, color: colors!.text),
        headline6: TextStyle(
            fontSize: 18, fontWeight: FontWeight.normal, color: colors!.text),
        // Used by [TextField] typed text style.
        bodyText1: TextStyle(
          fontSize: 16,
          color: colors!.text,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(
          fontSize: 16,
          color: colors!.text,
        ),
        subtitle1: TextStyle(color: colors!.text),
      ).apply(
        bodyColor: colors!.text,
      ),

      iconTheme: IconThemeData(color: this.colors?.primary),

      // Default Colors
      scaffoldBackgroundColor: colors!.background,
      errorColor: colors!.error,
      canvasColor: Colors.transparent,
      backgroundColor:
          colors!.background, //backgroundColor: this.colors!.foreground,

      //TextField
      hintColor: colors!.text,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors!.primary,
        selectionColor: colors!.primary!.withOpacity(.3),
        selectionHandleColor: colors!.text,
      ),

      toggleableActiveColor: colors!.primary,

      inputDecorationTheme: InputDecorationTheme(
        labelStyle: textTheme!.body1!.copyWith(color: colors!.inputText),
        isDense: true,
        hintStyle: textTheme!.body1!.copyWith(color: colors!.inputText),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colors!.inputText!)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors!.inputText!, width: 1.5),
        ),
      ),

      // Text Button
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontFamily: 'Lato',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.disabled)
                ? colors!.primary!.withOpacity(.6)
                : colors!.text;
          }),
        ),
      ),

      //Button
      buttonTheme: ButtonThemeData(buttonColor: colors!.button),
      disabledColor: colors!.primary!.withOpacity(.6),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return colors!.button!.withOpacity(.6);
            }
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.pressed)) {
              return colors!.button!.withOpacity(.8);
            } //check
            return colors!.button;
          }),
        ),
      ),
    );
  }
}

class CustomColorsThemeData {
  CustomColorsThemeData({
    //Background
    required this.background,

    //Input
    required this.inputUnselected,
    required this.inputSelected,
    required this.inputText,
    required this.inputError,

    //Text
    required this.title,
    required this.text,

    //Button
    required this.button,

    //Palette Color
    required this.gray500,
    required this.gray150,
    required this.gray50,
    required this.primary,
    required this.success,
    required this.error,
    required this.warning,
    required this.info,
  })  :

        //Background
        assert(background != null),

        //Inputs
        assert(inputSelected != null),
        assert(inputUnselected != null),
        assert(inputText != null),
        assert(inputError != null),

        //Text
        assert(title != null),
        assert(text != null),

        //Button
        assert(button != null),

        //Pallete Color
        assert(gray500 != null),
        assert(gray150 != null),
        assert(gray50 != null),
        assert(primary != null),
        assert(success != null),
        assert(error != null),
        assert(warning != null),
        assert(info != null);

  //New Colors
  //Background
  final Color? background;

  //Input
  final Color? inputSelected;
  final Color? inputUnselected;
  final Color? inputText;
  final Color? inputError;

  //Text
  final Color? title;
  final Color? text;

  //Button
  final Color? button;

  //Pallete Color
  final Color? gray500;
  final Color? gray150;
  final Color? gray50;
  final Color? primary;
  final Color? success;
  final Color? error;
  final Color? warning;
  final Color? info;
}

class CustomTextThemeData {
  CustomTextThemeData({
    //Typography
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.subtitle1,
    required this.subtitle2,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.button,
  })  : assert(h1 != null),
        assert(h2 != null),
        assert(h3 != null),
        assert(h4 != null),
        assert(h5 != null),
        assert(subtitle1 != null),
        assert(subtitle2 != null),
        assert(body1 != null),
        assert(body2 != null),
        assert(body3 != null),
        assert(button != null);
  final TextStyle? h1;
  final TextStyle? h2;
  final TextStyle? h3;
  final TextStyle? h4;
  final TextStyle? h5;
  final TextStyle? subtitle1;
  final TextStyle? subtitle2;
  final TextStyle? body1;
  final TextStyle? body2;
  final TextStyle? body3;
  final TextStyle? button;
}
