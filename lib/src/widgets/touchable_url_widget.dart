import 'package:flutter/material.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class TouchableUrlImage extends StatelessWidget {
  const TouchableUrlImage(
    this.asset,
    this.url, {
    this.leftMargin: 0,
    this.rightMargin: 0,
    this.topMargin: 0,
    this.bottomMargin: 0,
  });

  final String asset;
  final String url;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.only(
        left: leftMargin,
        right: rightMargin,
        top: topMargin,
        bottom: bottomMargin,
      ),
      child: GestureDetector(
        child: Image.asset(asset),
        onTap: () => getUrl(url),
      ),
    );
  }
}

class TouchableUrlWidget extends StatelessWidget {
  const TouchableUrlWidget(this.widget, this.url,
      {this.leftMargin: 0,
      this.rightMargin: 0,
      this.topMargin: 0,
      this.bottomMargin: 0});

  final Widget widget;
  final String url;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: leftMargin,
        right: rightMargin,
        top: topMargin,
        bottom: bottomMargin,
      ),
      child: GestureDetector(
        child: widget,
        onTap: () => getUrl(url),
      ),
    );
  }
}
