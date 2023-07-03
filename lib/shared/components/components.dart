import 'package:flutter/material.dart';

Widget AppButton({
  double width = double.infinity,
  @required Color? backgroundColor,
  @required VoidCallback? function,
  @required String? text,
}) =>
    Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          '${text?.toUpperCase()}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget AppTextForm({
  @required String? label,
  @required IconData? prefixIcon,
  IconData? suffixIcon,
  @required TextEditingController? controller,
  @required TextInputType? textType,
  @required String? Function(String? value)? validator,
  bool isSecure = false,
  String? validateDone,
  String? validateError,
  void Function(String value)? onSubmitted,
  void Function(String value)? onChanged,
  void Function()? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isSecure,
      keyboardType: textType,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: '$label',
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon))
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 3, color: Color.fromRGBO(0, 117, 94, 1)),
        ),
      ),
      validator: validator,
    );
