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
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.dstATop,
              ),
              fit: BoxFit.cover,
              image: AssetImage('assets/background.jpg'),
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String v) => _emailValue = v,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
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
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          print(_emailValue);
                          print(_passwordValue);
                          Navigator.pushReplacementNamed(context, '/products');
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
