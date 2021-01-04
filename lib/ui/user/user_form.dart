import 'package:flutter/material.dart';
import 'package:resubscription/services/parse_service.dart';

class UserForm extends StatefulWidget {
  UserForm({Key key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  String _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter your name'),
                onChanged: (value) {
                  _name = value;
                },
                validator: (value) =>
                    value.isEmpty ? 'You can\'t keep name field empty' : null,
              ),
              RaisedButton(
                child: Text('Subscriber'),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    //TODO: hardcode the admin objectId (from backend) here please
                    await ParseService.subscribeUser(_name, 'dQUBTfm62o');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
