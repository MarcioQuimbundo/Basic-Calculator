/*
 * Created by Yudi Setiawan on 12/25/18 2:02 PM
 * Copyright (c) 2018. All right reserved.
 * Last modified 12/25/18 2:02 PM
 */

import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  final double _padding = 16.0;
  final double _buttonFontSize = 20.0;
  final Color _primarySwatchColor = Colors.orange;
  final Color _titleAppBarColor = Colors.white;
  final Color _buttonColorWhite = Colors.white;
  final Color _buttonHighlightColor = Colors.grey[800];
  final Color _buttonColorGrey = Colors.grey[500];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: _primarySwatchColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Basic Calculator",
            style: TextStyle(color: _titleAppBarColor),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(right: _padding, bottom: _padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "0",
                      style: Theme.of(context).textTheme.display2,
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
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "AC",
                              style: TextStyle(
                                color: _primarySwatchColor,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button AC pressed
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Icon(
                              Icons.backspace,
                              color: _buttonColorGrey,
                            ),
                            onPressed: () {
                              // TODO: do something in here when button backspace pressed
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "/",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button divide pressed
                            },
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
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "7",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button 7 pressed
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "8",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button 8 pressed
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "9",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button 9 pressed
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "X",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button multiplication pressed
                            },
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
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "4",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button 4 pressed
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "5",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button 5 pressed
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "6",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button 6 pressed
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "-",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button subtraction pressed
                            },
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
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "1",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button 1 pressed
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button 2 pressed
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "3",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button 3 pressed
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            color: _buttonColorWhite,
                            highlightColor: _buttonHighlightColor,
                            child: Text(
                              "+",
                              style: TextStyle(
                                color: _buttonColorGrey,
                                fontSize: _buttonFontSize,
                              ),
                            ),
                            onPressed: () {
                              // TODO: do something in here when button plus pressed
                            },
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
      ),
    );
  }
}
