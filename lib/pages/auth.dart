import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue = '';
  String _passwordValue = '';
  bool _isAcceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SafeArea(
          child: Container(
              margin: EdgeInsets.all(10.0),
              child: ListView(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String v) => _emailValue = v,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: (String v) => _passwordValue = v,
                  ),
                  SwitchListTile(
                    title: Text('Accept terms'),
                    value: _isAcceptedTerms,
                    onChanged: (bool value) {
                      setState(() {
                        _isAcceptedTerms = value;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: RaisedButton(
                        child: Text('LOGIN'),
                        onPressed: () {
                          print(_emailValue);
                          print(_passwordValue);
                          Navigator.pushReplacementNamed(context, '/products');
                        }),
                  )
                ],
              )),
        ));
  }
}
