import 'package:flutter/material.dart';

Widget AppButton({
  double width = double.infinity,
  @required Color? backgroundColor,
  @required VoidCallback? function,
  @required String? text,
}) =>
    Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(7, 171, 179, 1),
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
    Container(
      height: 80,
      child: TextFormField(
        controller: controller,
        obscureText: isSecure,
        keyboardType: textType,
        onFieldSubmitted: onSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: '$label',
          labelStyle: TextStyle(color: Color(0xFFEAEAEA), fontSize: 16),
          prefixIcon: Icon(
            prefixIcon,
            color: Color(0xFFEAEAEA),
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(suffixIcon),
                  color: Color(0xFFEAEAEA),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 1,
              color: Color(0xFFEAEAEA),
            ),
          ),
        ),
        validator: validator,
      ),
    );

Widget HomeGenderCard({
  @required String? label,
  @required IconData? icon,
  @required bool? isMale,
  @required Color? background,
}) =>
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 135.0,
            color: Color(0xFFEAEAEA),
          ),
          const SizedBox(height: 5.0),
          Text(
            "$label",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEAEAEA)),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: background,
      ),
    );

Widget HomeValuesCard({
  @required String? label,
  String? tagOne,
  String? tagTwo,
  @required int? value,
  @required VoidCallback? functionOne,
  @required VoidCallback? functionTwo,
}) =>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Color(0xFF3B4B4).withOpacity(0.3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$label",
            style: TextStyle(
              fontSize: 25.0,
              color: Color(0xFFEAEAEA),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${value}",
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                color: Color(0xFFEAEAEA)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: functionOne,
                heroTag: '$tagOne',
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.remove,
                  color: Color(0xFFEAEAEA),
                ),
                mini: true,
              ),
              FloatingActionButton(
                onPressed: functionTwo,
                heroTag: '$tagTwo',
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.add,
                  color: Color(0xFFEAEAEA),
                ),
                mini: true,
              ),
            ],
          )
        ],
      ),
    );
