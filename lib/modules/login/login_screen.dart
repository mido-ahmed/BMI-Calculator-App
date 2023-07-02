import 'package:bmi_calculator_app/modules/bmi/bmi_home_screen.dart';
import 'package:bmi_calculator_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      'https://play-lh.googleusercontent.com/c8fb2ryOVMPC4bbtyeq16-bISTi-K7wRECf6xh_U0OLUhxOtRAVdH5RzEjGdQ78KVaI',
                      width: 250),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: AppTextForm(
                        validateError: "Enter correct email",
                        validateDone: "Enter your Email",
                        onSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        textType: TextInputType.emailAddress,
                        prefixIcon: Icons.email,
                        label: "Email Address",
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your Email Address";
                          } else {
                            return null;
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: AppTextForm(
                      validateError:
                          "Please Make it more secure and should have #",
                      validateDone: "Enter your Password",
                      onSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (String value) {
                        print(value);
                      },
                      isSecure: isPasswordShow,
                      textType: TextInputType.visiblePassword,
                      prefixIcon: Icons.lock,
                      suffixIcon: isPasswordShow
                          ? Icons.visibility
                          : Icons.visibility_off,
                      suffixPressed: () {
                        setState(() {
                          isPasswordShow = !isPasswordShow;
                        });
                      },
                      label: "Password",
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Password";
                        } else if (value.length < 8 && !value.contains("#")) {
                          return "Please Make it more secure and should have #";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: AppButton(
                        text: "login",
                        backgroundColor: Color.fromRGBO(0, 117, 94, 1),
                        function: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BMIHomeScreen(),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                  'Enter Your informations correctly'),
                              duration: const Duration(seconds: 3),
                              action: SnackBarAction(
                                label: 'WARNING',
                                onPressed: () {
                                  return;
                                },
                              ),
                            ));
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Register Now',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
