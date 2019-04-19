import 'package:enterprise_app/modals/acessToken.dart';
import 'package:flutter/material.dart';
import 'typeSelection.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'dart:io';
import 'data/rest_ds.dart';



class LoginPage extends StatefulWidget{

  @override
_LoginPageState createState() => _LoginPageState() ;
}

enum FormType {
login,
register
}


class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form = FormType.login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email="";
      
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  // Swap in between our two forms, registering and logging in
  void _formChange () async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: _buildBar(context),
        key: _scaffoldKey,
        body: new Container(
        padding: EdgeInsets.all(16.0),
    child: new SingleChildScrollView(

    child: new Column(
          children: <Widget>[
            _buildImageView(),
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    )
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: const Text('LOGIN', style: TextStyle(color: Colors.white)),
      centerTitle: true,

    );
  }

  Widget _buildImageView(){
    return new Container(
      padding: new EdgeInsets.all(20.0),
      margin: EdgeInsets.only(left:50,top: 50,right: 50,bottom: 20),
      height: 120.0,
      width: 120.0,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new AssetImage(
              'assets/images/starttrip_map.png'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildTextFields() {
    final focus = FocusNode();

    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            margin:EdgeInsets.only(left: 30, top:50,right: 30,bottom: 10),
            child: new TextField(
              /*onFieldSubmitted: (v){
                FocusScope.of(context).requestFocus(focus);
              },*/
            //  autofocus: true,
              controller: _emailFilter,
              //textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                  labelText: 'Enter email address here',
                border: OutlineInputBorder(),



              ),

            ),
          ),
          new Container(
            margin:EdgeInsets.only(left: 30,top: 0,right: 30,bottom: 30),
            child: new TextField(
              controller: _passwordFilter,

              decoration: new InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder()


    ),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    final color = const Color(0xD3D3D3);

    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
          ButtonTheme(
          minWidth: 200.0,
          height: 40,

              child:  new RaisedButton(
               color: Colors.grey,
              child: new Text('LOGIN'),
                  textColor: Colors.white,
                  onPressed: _loginPressed,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0))
          )
          ),

          /*  new FlatButton(
              child: new Text('Dont have an account? Tap here to register.'),
              onPressed: _formChange,
            ),
            new FlatButton(
              child: new Text('Forgot Password?'),
              onPressed: _passwordReset,
            )*/
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Create an Account'),
              onPressed: _createAccountPressed,
            ),
            new FlatButton(
              child: new Text('Have an account? Click here to login.'),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _loginPressed () {
   /* if(_email.isEmpty){
      createSnackBar("Invalid email");

    }
  else */

   //if(check()) {
     if (!validateEmail(_email)) {
       // _email = "";
       createSnackBar("Invalid email");
     }
     else if (_password.length < 4) {
       createSnackBar("Invalid password");
     }
     else{
/*
    AccessToken accessToken =   RestDataSource().login(_email, _password) as AccessToken;
*/

       Future<AccessToken> accessToken = RestDataSource().login(_email, _password);

     }
  // }
   /*else{
     print('The user wants to login with $_email and $_password');

   }
     *//*  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TypeSelection(),
      ),
    );

 */


  }

  void _createAccountPressed () {
    print('The user wants to create an account with $_email and $_password');

  }

  void _passwordReset () {
    print("The user wants a password reset request sent to $_email");
  }


  String _validateName(String value) {
    if (value.isEmpty)
      return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }


  void createSnackBar(String message) {
    final snackBar = new SnackBar(content: new Text(message),
        backgroundColor: Colors.red);

    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(message)));



        }
  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }



/*
  bool check()  {
    var connectivityResult =  (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      print("connectivityResult:$connectivityResult");
      
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("connectivityResult:$connectivityResult");

      // I am connected to a wifi network.
      return true;
    }
    else{
      return false;
    }
  }
*/


/*bool check(){
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
    }
  } on SocketException catch (_) {
    print('not connected');
  }
}*/
}