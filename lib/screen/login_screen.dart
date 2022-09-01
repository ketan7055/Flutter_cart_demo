import 'package:cart/AppUtils.dart';
import 'package:cart/EncryptData.dart';
import 'package:cart/screen/home_screen.dart';
import 'package:cart/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
  final storage = const FlutterSecureStorage();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isObscure = true;
  String? passwordFiled;
  String? userIDFiled;
  final String USER_ID = "userID";
  final String USER_PASSWORD = "userPassword";
  TextEditingController userControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(
          title:  const Text("Login"),
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
              const Text('Login'),
              const SizedBox(
                height: 50,
              ),
              TextField(
                onChanged: (value) => userIDFiled = value,
                controller: userControl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'useID',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordControl,
                obscureText: _isObscure,
                obscuringCharacter: "*",
                onChanged: (value) => passwordFiled = value,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: const Text('SignUp',
                    style: TextStyle(decoration:TextDecoration.underline,color: Colors.black, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    if(userIDFiled == null || userIDFiled!.isEmpty){
      AppUtils.showAlertDialog(context, 'userId not found.');
      return;
    }
    else if(passwordFiled == null || passwordFiled!.isEmpty){
      AppUtils.showAlertDialog(context, 'Please enter password.');
      return;
    }
    print('userIDFiled : $userIDFiled passwordFiled: $this.passwordFiled');


    final storageUser = await widget.storage.read(key: USER_ID);
    final storagePass = await widget.storage.read(key: USER_PASSWORD);
    print('storageUser:  $storageUser');
    print('storagePass:  $storagePass');

    final decryptedUser = EncryptData.decryptAES(storageUser);
    final decryptedPassword = EncryptData.decryptAES(storagePass);

    print('decryptedUser:  $decryptedUser');
    print('decryptedPassword:  $decryptedPassword');
    if(decryptedUser == userIDFiled && decryptedPassword == passwordFiled) {
      // print('userIDFiled EncryptData : ${EncryptData.encryptAES(userIDFiled)} ');
      // print('userIDFiled decrypt : ${EncryptData.decryptAES(userIDFiled)} ');
      userIDFiled = '';
      passwordFiled = '';
      userControl.clear();
      passwordControl.clear();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }else{
      AppUtils.showAlertDialog(context, 'Incorrect userid or password.');
    }
  }
}
