import 'package:flutter/material.dart';
import 'package:resubscription/services/parse_service.dart';
import 'package:resubscription/ui/admin/admin_login.dart';
import 'package:resubscription/ui/user/user_form.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ParseService.init();
  runApp(MaterialApp(home: StartupPage()));
}

class StartupPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parse LiveQuery Demo')),
      body: Container(
        padding: EdgeInsets.all(32.0),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Choose your Role:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              child: Text('Admin'),
              onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminLogin()));
              },
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              child: Text('User'),
              onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserForm()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
