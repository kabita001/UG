// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print, prefer_final_fields, prefer_const_constructors_in_immutables, use_key_in_widget_constructors


import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(String email, String password,
   bool isLogin, BuildContext ctx) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  var _isLogin = true;
  //form key
  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userPassword = '';
  BuildContext ctx;

  void _trySubmit() {
    FocusScope.of(context).unfocus();
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _isLogin, context);
      print(_userPassword);
      print(_userEmail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Welcome To PCPS',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
          ),
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
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
                    SizedBox(
                        height: 180,
                        child: Image.asset(
                        "assets/images/pcps.png",
                          fit: BoxFit.contain,
                        )
                      ),
                      //email  login field
                    SizedBox(height: 30),
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
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "abc@gmail.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onSaved: (value) {
                        _userEmail = value;
                      },
                    ),
                    //password field
                    SizedBox(height: 25),
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
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                    SizedBox(
                      height: 25,
                    ),
                    if (widget.isLoading) CircularProgressIndicator(),
                    if (!widget.isLoading)
                      ElevatedButton(
                          child: Text('Login', style: TextStyle(fontSize: 23),),
                          onPressed: _trySubmit,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      ),),
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
