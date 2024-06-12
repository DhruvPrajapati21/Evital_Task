import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:evital_project/Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoginAttempted = false;
  var _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Evital",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            autovalidateMode: _isLoginAttempted
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/images/Logo_Final.png",
                    height: 100,
                    width: 150,
                  ),
                ),
                SizedBox(height: 55),
                Card(
                  color: Color(hexColor('#5F9EA0')),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/Login_Final.png",
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(height: 0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Login to your account',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                            controller: _mobileController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              prefixIcon: const Icon(Icons.phone_android,
                                  color: Colors.white),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your mobile number";
                              } else if (value.length != 10) {
                                return "Mobile number must be exactly 10 digits";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)),
                              prefixIcon: const Icon(Icons.lock_outline_rounded,
                                  color: Colors.white),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: _passwordVisible
                                    ? const Icon(Icons.visibility_off,
                                    color: Colors.white)
                                    : const Icon(Icons.visibility,
                                    color: Colors.white),
                              ),
                            ),
                            obscureText: _passwordVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your Password";
                              } else if (value.length < 8) {
                                return "Password must be at least 8 characters long";
                              } else if (!RegExp(
                                  r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+={};:<>|./?,-]).{8,}$')
                                  .hasMatch(value)) {
                                return "Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                _isLoginAttempted = true;
                              });

                              if (_formKey.currentState!.validate()) {
                                if (_mobileController.text == "9033006262" &&
                                    _passwordController.text == "eVital@12") {
                                  Fluttertoast.showToast(
                                    msg: "Successfully Login",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 11.0,
                                  );

                                  SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                                  await prefs.setBool('isLoggedIn', true);

                                  _mobileController.clear();
                                  _passwordController.clear();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Please enter valid authentication",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 11.0,
                                  );
                                }
                              } else {
                                setState(() {
                                  _isLoginAttempted = true;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan,
                              padding:
                              const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalcolor = int.parse(newColor);
  return finalcolor;
}
