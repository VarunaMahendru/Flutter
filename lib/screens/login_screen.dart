import 'package:flutter/material.dart';
import 'package:enterprise_app/styles/colors.dart';

class LoginScreen extends StatelessWidget{

  LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(

        body: new Container(
            child: new Padding(
                padding: new EdgeInsets.fromLTRB(32.0, MediaQuery.of(context).padding.top + 32.0, 32.0, 32.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: new Center(
                        child: new FlutterLogo(
                          colors: colorStyles['primary'],
                          size: 200.0,
                        ),
                      ),
                    ),
                   // new LoginForm()
                  ],
                )
            )
        )
    );
  }

}