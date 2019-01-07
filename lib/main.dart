/*
 * Created by Yudi Setiawan on 1/7/19 4:48 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 1/7/19 4:47 PM
 */

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

final Color _primarySwatchColor = Colors.orange;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: _primarySwatchColor),
      home: MainApp(),
    ));

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();

/*@override
  TestingTabState createState() => TestingTabState();*/
}

class TestingTabState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Basic Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: StaggeredGridView.count(
          crossAxisCount: 3,
          scrollDirection: Axis.vertical,
          staggeredTiles: <StaggeredTile>[
            StaggeredTile.count(3, 2),
            StaggeredTile.count(3, 2),
            StaggeredTile.count(3, 2),
          ],
          children: <Widget>[
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class MainAppState extends State<MainApp> {
  final double _padding = 16.0;
  final double _buttonFontSizeCalculator = 24.0;
  final double _buttonFontSizeConverter = 16.0;
  final double _buttonOpacityConverter = 0.5;
  final double _imageSizeConverter = 36.0;
  final double _widthBorderConverter = 0.5;
  final String _titleAppBar = "Basic Calculator";

  final Color _titleAppBarColor = Colors.white;
  final Color _buttonColorWhite = Colors.white;
  final Color _buttonHighlightColor = Colors.grey[800];
  final Color _textColorGrey = Colors.grey;
  final Color _textColorWhite = Colors.white;
  final Color _borderColorConverter = Colors.grey[200];

  int valueA;
  int valueB;
  var sbValue = new StringBuffer();
  String operator;

  void appendSbValue(String str) => setState(() {
        bool isDoCalculate = false;
        String strValue = sbValue.toString();
        String lastCharacter = strValue.substring(strValue.length - 1);
        if ((strValue == "0" && str == "0") ||
            ((lastCharacter == "/" ||
                    lastCharacter == "x" ||
                    lastCharacter == "-" ||
                    lastCharacter == "+") &&
                str == "0")) {
          return;
        } else if (str == "=") {
          isDoCalculate = true;
        } else if (str == "/" || str == "x" || str == "-" || str == "+") {
          if (operator.isEmpty) {
            operator = str;
          } else {
            isDoCalculate = true;
          }
        }

        if (!isDoCalculate) {
          if (sbValue.toString() == "0" && str != "0") {
            if (str != "/" && str != "x" && str != "-" && str != "+") {
              sbValue.clear();
            }
            sbValue.write(str);
          } else {
            sbValue.write(str);
          }
        } else {
          List<String> values = sbValue.toString().split(operator);
          if (values.length == 2 &&
              values[0].isNotEmpty &&
              values[1].isNotEmpty) {
            valueA = int.parse(values[0]);
            valueB = int.parse(values[1]);
            sbValue.clear();
            int total = 0;
            switch (operator) {
              case "/":
                total = valueA ~/ valueB;
                break;
              case "x":
                total = valueA * valueB;
                break;
              case "-":
                total = valueA - valueB;
                break;
              case "+":
                total = valueA + valueB;
            }
            sbValue.write(total);
            if (str == "/" || str == "x" || str == "-" || str == "+") {
              operator = str;
              sbValue.write(str);
            } else {
              operator = "";
            }
          } else {
            String strValue = sbValue.toString();
            String lastCharacter = strValue.substring(strValue.length - 1);
            if (str == "=") {
              if (lastCharacter == "/" ||
                  lastCharacter == "x" ||
                  lastCharacter == "-" ||
                  lastCharacter == "+") {
                operator = "";
                sbValue.clear();
                sbValue.write(strValue.substring(0, strValue.length - 1));
              }
            } else {
              if (str == "/" || str == "x" || str == "-" || str == "+") {
                sbValue.clear();
                sbValue.write(
                    strValue.substring(0, strValue.length - 1) + "" + str);
                operator = str;
              }
            }
          }
        }
      });

  void deleteSbValue() => setState(() {
        String strValue = sbValue.toString();
        if (strValue.length > 0) {
          String lastCharacter = strValue.substring(strValue.length - 1);
          if (lastCharacter == "/" ||
              lastCharacter == "x" ||
              lastCharacter == "-" ||
              lastCharacter == "+") {
            operator = "";
          }
          strValue = strValue.substring(0, strValue.length - 1);
          sbValue.clear();
          sbValue.write(strValue.length == 0 ? "0" : strValue);
        }
      });

  void clearSbValue() => setState(() {
        operator = "";
        sbValue.clear();
        sbValue.write("0");
      });

  @override
  void initState() {
    super.initState();
    sbValue.write("0");
    operator = "";
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildTabBar(),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text(
        _titleAppBar,
        style: TextStyle(
          color: _titleAppBarColor,
        ),
      ),
      bottom: TabBar(
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        tabs: <Widget>[
          Tab(text: "Calculator"),
          Tab(text: "Converter"),
        ],
      ),
    );
  }

  buildTabBar() {
    return TabBarView(
      children: <Widget>[
        buildCalculatorLayout(),
        buildConverterLayout(),
      ],
    );
  }

  buildConverterLayout() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _buttonColorWhite,
                      border: Border.all(
                        color: _borderColorConverter,
                        width: _widthBorderConverter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(_padding),
                          child: Opacity(
                            opacity: _buttonOpacityConverter,
                            child: Image.asset(
                              "assets/icons/icons8_us_dollar_100.png",
                              width: _imageSizeConverter,
                              height: _imageSizeConverter,
                            ),
                          ),
                        ),
                        Text(
                          "Currency",
                          style: TextStyle(
                            color: _textColorGrey,
                            fontSize: _buttonFontSizeConverter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _buttonColorWhite,
                      border: Border.all(
                        color: _borderColorConverter,
                        width: _widthBorderConverter
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(_padding),
                          child: Opacity(
                            opacity: _buttonOpacityConverter,
                            child: Image.asset(
                              "assets/icons/icons8_length_filled_100.png",
                              width: _imageSizeConverter,
                              height: _imageSizeConverter,
                            ),
                          ),
                        ),
                        Text(
                          "Length",
                          style: TextStyle(
                            color: _textColorGrey,
                            fontSize: _buttonFontSizeConverter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _buttonColorWhite,
                      border: Border.all(
                        color: _borderColorConverter,
                        width: _widthBorderConverter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(_padding),
                          child: Opacity(
                            opacity: _buttonOpacityConverter,
                            child: Image.asset(
                              "assets/icons/icons8_map_100.png",
                              width: _imageSizeConverter,
                              height: _imageSizeConverter,
                            ),
                          ),
                        ),
                        Text(
                          "Area",
                          style: TextStyle(
                            color: _textColorGrey,
                            fontSize: _buttonFontSizeConverter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _buttonColorWhite,
                      border: Border.all(
                        color: _borderColorConverter,
                        width: _widthBorderConverter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(_padding),
                          child: Opacity(
                            opacity: _buttonOpacityConverter,
                            child: Image.asset(
                              "assets/icons/icons8_sugar_cube_100.png",
                              width: _imageSizeConverter,
                              height: _imageSizeConverter,
                            ),
                          ),
                        ),
                        Text(
                          "Volume",
                          style: TextStyle(
                            color: _textColorGrey,
                            fontSize: _buttonFontSizeConverter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _buttonColorWhite,
                      border: Border.all(
                        color: _borderColorConverter,
                        width: _widthBorderConverter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(_padding),
                          child: Opacity(
                            opacity: _buttonOpacityConverter,
                            child: Image.asset(
                              "assets/icons/icons8_temperature_100.png",
                              width: _imageSizeConverter,
                              height: _imageSizeConverter,
                            ),
                          ),
                        ),
                        Text(
                          "Temperature",
                          style: TextStyle(
                            color: _textColorGrey,
                            fontSize: _buttonFontSizeConverter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _buttonColorWhite,
                      border: Border.all(
                        color: _borderColorConverter,
                        width: _widthBorderConverter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(_padding),
                          child: Opacity(
                            opacity: _buttonOpacityConverter,
                            child: Image.asset(
                              "assets/icons/icons8_speed_100.png",
                              width: _imageSizeConverter,
                              height: _imageSizeConverter,
                            ),
                          ),
                        ),
                        Text(
                          "Speed",
                          style: TextStyle(
                            color: _textColorGrey,
                            fontSize: _buttonFontSizeConverter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _buttonColorWhite,
                      border: Border.all(
                        color: _borderColorConverter,
                        width: _widthBorderConverter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(_padding),
                          child: Opacity(
                            opacity: _buttonOpacityConverter,
                            child: Image.asset(
                              "assets/icons/icons8_clock_100.png",
                              width: _imageSizeConverter,
                              height: _imageSizeConverter,
                            ),
                          ),
                        ),
                        Text(
                          "Time",
                          style: TextStyle(
                            color: _textColorGrey,
                            fontSize: _buttonFontSizeConverter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _buttonColorWhite,
                      border: Border.all(
                        color: _borderColorConverter,
                        width: _widthBorderConverter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(_padding),
                          child: Opacity(
                            opacity: _buttonOpacityConverter,
                            child: Image.asset(
                              "assets/icons/icons8_weight_100.png",
                              width: _imageSizeConverter,
                              height: _imageSizeConverter,
                            ),
                          ),
                        ),
                        Text(
                          "Mass",
                          style: TextStyle(
                            color: _textColorGrey,
                            fontSize: _buttonFontSizeConverter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildConverterLayoutBak() {
    var size = MediaQuery.of(context).size;

    /* 24 is for notification bar on Android */
    double itemWidth = size.width / 3;
    double itemHeight = (size.height - kToolbarHeight - 24) / 3;

    return SafeArea(
      child: GridView.count(
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: 3,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _widthBorderConverter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_us_dollar_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Currency",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _widthBorderConverter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: RotationTransition(
                      child: Image.asset(
                        "assets/icons/icons8_length_filled_100.png",
                        width: _imageSizeConverter,
                        height: _imageSizeConverter,
                      ),
                      turns: AlwaysStoppedAnimation(45 / 360),
                    ),
                  ),
                ),
                Text(
                  "Length",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _widthBorderConverter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_map_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Area",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _widthBorderConverter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_sugar_cube_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Volume",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _widthBorderConverter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_temperature_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Temperature",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: _buttonColorWhite,
              border: Border.all(
                color: _borderColorConverter,
                width: _widthBorderConverter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_speed_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Speed",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: _borderColorConverter,
                width: _widthBorderConverter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_clock_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Time",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: _borderColorConverter,
                width: _widthBorderConverter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Opacity(
                    opacity: _buttonOpacityConverter,
                    child: Image.asset(
                      "assets/icons/icons8_weight_100.png",
                      width: _imageSizeConverter,
                      height: _imageSizeConverter,
                    ),
                  ),
                ),
                Text(
                  "Mass",
                  style: TextStyle(
                    color: _textColorGrey,
                    fontSize: _buttonFontSizeConverter,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(""),
          )
        ],
      ),
    );
  }

  buildCalculatorLayout() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(_padding),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  AutoSizeText(
                    sbValue.toString(),
                    style: Theme.of(context).textTheme.display2,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: buildRaisedButtonClearCalculator(),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonBackspaceCalculator(),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "/",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "7",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "8",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "9",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "x",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "4",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "5",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "6",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "-",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "1",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "2",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "3",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "+",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "0",
                          labelColor: _textColorGrey,
                          buttonColor: _buttonColorWhite,
                        ),
                      ),
                      /*Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: _buttonColorWhite,
                          highlightColor: _buttonHighlightColor,
                          child: Text(
                            ".",
                            style: TextStyle(
                              color: _buttonColorGrey,
                              fontSize: _buttonFontSize,
                            ),
                          ),
                          onPressed: () {
                            // TODO: do something in here when button . pressed
                          },
                        ),
                      ),*/
                      Expanded(
                        flex: 1,
                        child: buildRaisedButtonGeneralCalculator(
                          label: "=",
                          labelColor: _textColorWhite,
                          buttonColor: _primarySwatchColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  RaisedButton buildRaisedButtonGeneralCalculator({
    String label,
    Color labelColor,
    Color buttonColor,
  }) {
    return RaisedButton(
      color: buttonColor,
      highlightColor: _buttonHighlightColor,
      child: Text(
        label,
        style: TextStyle(
          color: labelColor,
          fontSize: _buttonFontSizeCalculator,
        ),
      ),
      onPressed: () {
        appendSbValue(label);
      },
    );
  }

  RaisedButton buildRaisedButtonBackspaceCalculator() {
    return RaisedButton(
      color: _buttonColorWhite,
      highlightColor: _buttonHighlightColor,
      child: Icon(
        Icons.backspace,
        color: _textColorGrey,
      ),
      onPressed: () {
        deleteSbValue();
      },
    );
  }

  RaisedButton buildRaisedButtonClearCalculator() {
    return RaisedButton(
      color: _buttonColorWhite,
      highlightColor: _buttonHighlightColor,
      child: Text(
        "C",
        style: TextStyle(
          color: _primarySwatchColor,
          fontSize: _buttonFontSizeCalculator,
        ),
      ),
      onPressed: () {
        clearSbValue();
      },
    );
  }
}
