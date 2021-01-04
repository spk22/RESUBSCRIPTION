import 'package:flutter/material.dart';
import 'package:resubscription/services/parse_service.dart';
import 'package:resubscription/ui/admin/control_panel.dart';

class AdminLogin extends StatefulWidget {
  AdminLogin({Key key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 30.0,
        ),
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter test@mail.com'),
                onChanged: (value) {
                  _email = value;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter testapp'),
                obscureText: true,
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: 30.0),
              RaisedButton(
                child: Text('Login'),
                onPressed: () async {
                  await _signIn(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signIn(BuildContext context) async {
    String adminId = await ParseService.login(_email, _password);
    print("adminId: $adminId");
    // navigate to control panel with adminId
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ControlPanel(adminId: adminId)),
    );
  }
}
