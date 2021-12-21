import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  RegistrationForm(this.submitFn, this.isLoading);
  final bool isLoading;
  final void Function(String email, String password, String username, String role, BuildContext ctx) submitFn;

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final List<String> accountType = ['SUPER', 'ADMIN', 'USER'];
  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _selectedValue = '';
  BuildContext ctx;


  void _trySubmit() {
    FocusScope.of(context).unfocus();
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(),_userPassword.trim(),_userName.trim(),_selectedValue, context);
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
                        if(value == null){
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
                  if(widget.isLoading)
                    CircularProgressIndicator(),
                  if(!widget.isLoading)
                    RaisedButton(child: Text('Signup'), onPressed: _trySubmit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
