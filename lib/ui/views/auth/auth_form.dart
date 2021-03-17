import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart' as V;

class AuthForm extends StatefulWidget {

  bool isLoading;
  final Function submitAuthForm;
  AuthForm(this.submitAuthForm, this.isLoading);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _userEmail = "";
  String _username = "";
  String _userPassword = "";
  bool _isLogin = true;

  final passwordValidator = V.MultiValidator([
    V.RequiredValidator(errorText: 'password is required'),
    V.MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
    V.PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);
  final emailValidator = V.MultiValidator([
    V.RequiredValidator(errorText: 'email is required'),
    V.EmailValidator(errorText: 'insert valid email address'),
  ]);
  final usernameValidator = V.MultiValidator([
    V.RequiredValidator(errorText: 'email is required'),
    V.MinLengthValidator(4, errorText: 'username must be at least 4 character long'),
  ]);

  void _trySubmit() {
    if(_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();

      _formKey.currentState.save();
      widget.submitAuthForm(_userEmail, _userPassword, _username, _isLogin);
      print(_userPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField( // email
                  key: ValueKey("email"),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                  ),
                  validator: emailValidator,
                  onSaved: (value) => _userEmail = value,
                ),
                if(!_isLogin)
                  TextFormField( // username
                    key: ValueKey("username"),
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: usernameValidator,
                    onSaved: (value) => _username = value,
                  ),
                TextFormField( // password
                  key: ValueKey("password"),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                  ),
                  validator: passwordValidator,
                  onSaved: (value) => _userPassword = value,
                ),
                SizedBox(height: 12,),
                if(widget.isLoading)
                  CircularProgressIndicator(),
                if(!widget.isLoading)
                  ElevatedButton(
                      child: Text(_isLogin ? "Login": "Signup"),
                      onPressed: _trySubmit
                  ),
                if(!widget.isLoading)
                  TextButton(
                      child: Text(_isLogin ? "Create New Account.": "I already have an account."),
                      onPressed: () => setState( ()=> _isLogin = !_isLogin)
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
