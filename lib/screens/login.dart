import 'package:flutter/material.dart';
import 'package:wordpair_generator/navigation/routes.dart';
import 'package:wordpair_generator/requests/authenticator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = Authenticator();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildUsernameField(),
              _buildPasswordField(),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Username',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
      onChanged: (value) {
        _username = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      onChanged: (value) {
        _password = value;
      },
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          try {
            final accessToken = await _auth.authenticate(_username, _password);
            // Store the access token in a secure storage or a global state management system
            navigateTo(context, '/');
          } catch (e) {
            // Show an error message if the authentication failed
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Authentication failed'),
            ));
          }
        }
      },
      child: Text('Login'),
    );
  }
}
