import 'package:flutter/material.dart';
import 'package:fluttercecdivision/2107flutter/stopwatch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = '';
  String email = '';
  bool isloggedin = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLoginForm(),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (text) => text!.isEmpty ? 'Enter Name' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Enter E-Mail Address';
                }
                // ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$
                final regex =
                    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if (!regex.hasMatch(text)) {
                  return 'Enter Valid E-Mail Address';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validate,
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (form?.validate() == true) {
      // logic for validated
      print('validated');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => StopWatch(name: name, email: email)));
    } else {
      print('not validated');
    }
    setState(() {
      isloggedin = true;
      name = _nameController.text;
      email = _emailController.text;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
/*
Create a flutter app to convert distance from unit to another unit
use dropdown button to select the unit. There should be two dropdown buttons
one for from unit and another for to unit. use textfield to enter the distance 
mm, cm, m, km, inch, feet
*/
/*
Create a registration form using flutter with the following fields
1. Name
2. Email
3. Password
4. Confirm Password
5. Phone Number
6. Address
7. 4 subject marks
validate the form using form widget and textformfield widget
use regex to validate email and phone number
pass values from one flutter widget to another widget using getx
calculate total and average of 4 subject marks and display it in the second widget
*/