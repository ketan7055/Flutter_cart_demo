import 'package:cart/AppUtils.dart';
import 'package:cart/EncryptData.dart';
import 'package:cart/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
  final storage = const FlutterSecureStorage();
}

class _SignupScreenState extends State<SignupScreen> {
  var _isObscure = true;
  String? passwordFiled;
  String? confirmPasswordFiled;
  String? userIDFiled;
  final String USER_ID = "userID";
  final String USER_PASSWORD = "userPassword";

  @override
  Widget build(BuildContext context) {
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

    return MaterialApp(

      home: Scaffold(
        appBar:  AppBar(
          title:  const Text("Signup"),
          leading:  IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/login_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) => userIDFiled = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'useID',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: _isObscure,
                obscuringCharacter: "*",
                onChanged: (value) => passwordFiled = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: _isObscure,
                obscuringCharacter: "*",
                onChanged: (value) => confirmPasswordFiled = value,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    login(userIDFiled, passwordFiled, confirmPasswordFiled,widget.storage);
                  },
                  child: const Text("Sign Up"))
            ],
          ),
        ),
      ),
    );

  }

  void login(String? userIDFiled, String? passwordFiled,
      String? confirmPasswordField,
      FlutterSecureStorage storage) async {
    if(userIDFiled == null || userIDFiled.isEmpty){
      AppUtils.showAlertDialog(context, 'userId not found.');
      return;
    }
    else if(passwordFiled == null || passwordFiled.isEmpty){
      AppUtils.showAlertDialog(context, 'Please enter password.');
      return;
    }
    else if(passwordFiled != confirmPasswordField){
      AppUtils.showAlertDialog(context, 'Please are not matching.');
      return;
    }
    print('userIDFiled : $userIDFiled passwordFiled: $passwordFiled');
    final encryptedUser = EncryptData.encryptAES(userIDFiled);
    final encryptedPassword = EncryptData.encryptAES(passwordFiled);
    // EncryptData.decryptAES(userIDFiled);
    await widget.storage.write(key: USER_ID, value: encryptedUser);
    await widget.storage.write(key: USER_PASSWORD, value: encryptedPassword);

    userIDFiled = '';
    passwordFiled = '';
    confirmPasswordFiled = '';
    // print('userIDFiled EncryptData : ${EncryptData.encryptAES(userIDFiled)} ');
    // print('userIDFiled decrypt : ${EncryptData.decryptAES(userIDFiled)} ');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }


}

