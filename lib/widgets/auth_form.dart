import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ug_app/widgets/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(String email, String password, String username, File userImageFile,
      String role, bool isLogin, BuildContext ctx) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final List<String> accountType = ['SUPER', 'ADMIN', 'USER'];
  var _isLogin = true;
  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _selectedValue = '';
  BuildContext ctx;
  File _userImageFile;
  void _pickedImage(File image){
    _userImageFile = image;
  }

  void _trySubmit() {
    FocusScope.of(context).unfocus();
    final isValid = _formKey.currentState.validate();
    if(_userImageFile == null && !_isLogin){
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please Upload image'), backgroundColor: Theme.of(context).errorColor,));
      return;
    }
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(), _userImageFile,
          _selectedValue, _isLogin, context);
      // ignore: avoid_print
      print(_userPassword);
      print(_userEmail);
      print(_userName);
      print(_selectedValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(!_isLogin) UserImagePicker(_pickedImage),
                  TextFormField(
                    key: const ValueKey('email'),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email address'),
                    onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: const ValueKey('username'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter at least 4 characters';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'username'),
                      onSaved: (value) {
                        _userName = value;
                      },
                    ),
                  if (!_isLogin)
                    DropdownButtonFormField(
                      key: ValueKey('role'),
                      items: accountType.map((accountType) {
                        return DropdownMenuItem(
                          value: accountType,
                          child: Text(accountType),
                        );
                      }).toList(),
                      decoration: InputDecoration(labelText: 'Role'),
                      validator: (value) {
                        if (value == null) {
                          return 'Select a Role';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                      onChanged: (newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
                      },
                      value: accountType[2],
                    ),
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 character long';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    RaisedButton(
                        child: Text(_isLogin ? 'Login' : 'Signup'),
                        onPressed: _trySubmit),
                  if (!widget.isLoading)
                    FlatButton(
                      child: Text(_isLogin
                          ? 'Create new account'
                          : 'I already have an account'),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
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
