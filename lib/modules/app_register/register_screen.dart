import 'package:bmi_calculator_app/modules/bmi/bmi_home_screen.dart';
import 'package:bmi_calculator_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/Data-01 1.png', width: 320),
                  AppTextForm(
                    validateError: "Enter Real Name",
                    validateDone: "Enter your Name",
                    onSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    textType: TextInputType.text,
                    prefixIcon: Icons.person,
                    label: "Name",
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Container(
                      height: 80,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF3D4149),
                        border: Border.all(
                          color: Color(0xFFEAEAEA),
                        ),
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: Stack(
                        children: [
                          InternationalPhoneNumberInput(
                            onInputChanged: (value) {},
                            spaceBetweenSelectorAndTextField: 6.0,
                            textFieldController: phoneNumberController,
                            cursorColor: Color(0xFFEAEAEA),
                            formatInput: false,
                            keyboardType: TextInputType.number,
                            onSubmit: () {
                              print(phoneNumberController.text);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Phone Number Important";
                              }
                            },
                            selectorConfig: SelectorConfig(
                                trailingSpace: false,
                                leadingPadding: 10,
                                useEmoji: true,
                                showFlags: true,
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET),
                            inputDecoration: InputDecoration(
                              errorBorder: InputBorder.none,
                              alignLabelWithHint: true,
                              contentPadding:
                                  EdgeInsets.only(bottom: 12.0, left: 0),
                              border: InputBorder.none,
                              hintText: "Phone Number",
                              hintStyle: TextStyle(
                                  color: Color(0xFFEAEAEA), fontSize: 16),
                            ),
                          ),
                          Positioned(
                              left: 90,
                              top: 8,
                              bottom: 8,
                              child: Container(
                                height: 40,
                                width: 1,
                                color: Color(0xFFEAEAEA),
                              ))
                        ],
                      )),
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
                          })),
                  AppTextForm(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: AppButton(
                        text: "REGISTER",
                        backgroundColor: Color.fromRGBO(7, 171, 179, 1),
                        function: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BMIHomeScreen(),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: const Text('Something Wrong!'),
                                duration: const Duration(seconds: 3),
                                action: SnackBarAction(
                                  label: 'WARNING',
                                  onPressed: () {
                                    return;
                                  },
                                )));
                          }
                        }),
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
