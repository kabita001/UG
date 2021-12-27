// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

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

      print(_userPassword);
      print(_userEmail);
      print(_userName);
      print(_selectedValue);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
                    //email Field
                    TextFormField(
                      key: const ValueKey('email'),
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email address',
                        prefixIcon: const Icon(Icons.mail_outline),
                          contentPadding: const EdgeInsets.fromLTRB(30, 20, 25, 20),
                          hintText: "abc@gmail.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                      ),
                      onSaved: (value) {
                        _userEmail = value;
                      },
                    ),
                    //User Name Field
                    SizedBox(height: 20),
                      TextFormField(
                        key: const ValueKey('username'),
                        validator: (value) {
                          if (value.isEmpty || value.length < 4) {
                            return 'Please enter at least 4 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'UserName',
                          prefixIcon: const Icon(Icons.account_circle_outlined),
                          contentPadding: const EdgeInsets.fromLTRB(30, 20, 25, 20),
                          hintText: "User Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onSaved: (value) {
                          _userName = value;
                        },
                      ),
                      //Role Field
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        key: ValueKey('role'),
                        items: accountType.map((accountType) {
                          return DropdownMenuItem(
                            value: accountType,
                            child: Text(accountType),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Role',
                          prefixIcon: const Icon(Icons.account_box_outlined),
                          contentPadding: const EdgeInsets.fromLTRB(30, 20, 25, 20),
                          hintText: "role",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
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
                      //password field
                      SizedBox(height: 20),
                      TextFormField(
                        key: const ValueKey('password'),
                        validator: (value) {
                          if (value.isEmpty || value.length < 7) {
                            return 'Password must be at least 7 character long';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.vpn_key),
                          contentPadding: const EdgeInsets.fromLTRB(30, 20, 25, 20),
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: true,
                        onSaved: (value) {
                          _userPassword = value;
                        },
                      ),
                      // signup button
                      SizedBox(height: 20),
                      if(widget.isLoading)
                        const CircularProgressIndicator(),
                      if(!widget.isLoading)
                        ElevatedButton(child: Text('Signup', style: TextStyle(fontSize: 23),), 
                        onPressed: _trySubmit,
                        style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        ),
                      )
                    ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
