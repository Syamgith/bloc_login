import 'package:bloc_login/src/blocs/bloc.dart';
import 'package:flutter/material.dart';

import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          SizedBox(
            height: 17.0,
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'password',
              labelText: 'Password',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder<Object>(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Submit'),
          color: Colors.blue,
          onPressed: snapshot.hasError
              ? null
              : () {
                  print('Hi there');
                },
        );
      },
    );
  }
}
