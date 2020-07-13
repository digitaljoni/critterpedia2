import 'package:flutter/material.dart';

class SectionTextWidget extends StatelessWidget {
  const SectionTextWidget({
    Key key,
    this.title,
    @required this.info,
  }) : super(key: key);

  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: title,
      child: Center(
        child: Text(
          info,
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.normal,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    Key key,
    this.title,
    @required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        title != null
            ? Padding(
                padding: EdgeInsets.only(
                  bottom: 4.0,
                ),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              )
            : SizedBox(),
        Card(
          margin: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          child: Container(
            padding: EdgeInsets.all(
              10.0,
            ),
            width: double.infinity,
            child: child,
          ),
        ),
      ],
    );
  }
}
