import 'package:critterpedia/generated/l10n.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, @required this.id}) : super(key: key);

  static const routeName = '/profile/:id';
  static var routeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ProfilePage(id: params['id'][0]);
  });

  final String id;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile page'),
      ),
      body: Center(
        child: Text(S.of(context).profileGreetings('${widget.id}')),
      ),
    );
  }
}
