import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRawInputField extends StatefulWidget {
  String labeText;
  bool isPass;
  TextEditingController fieldController;
  TextInputType inputType;

  CustomRawInputField(
      {@required this.labeText,
      @required this.isPass,
      @required this.fieldController,
      this.inputType});
  @override
  _CustomRawInputFieldState createState() => _CustomRawInputFieldState();
}

class _CustomRawInputFieldState extends State<CustomRawInputField> {
  bool isHide = false;

  @override
  void initState() {
    if (this.widget.isPass == true) {
      isHide = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        cursorColor: Colors.blue[900],
        // maxLength: 20,
        obscureText: (isHide == true) ? true : false,
        controller: this.widget.fieldController,
        validator: validatePass,
        keyboardType: (this.widget.inputType == null)
            ? TextInputType.text
            : this.widget.inputType,
        decoration: InputDecoration(
          labelText: this.widget.labeText,
          labelStyle: TextStyle(color: Colors.blue[900]),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[900],
            ),
          ),
          suffixIcon: (this.widget.isPass == true)
              ? IconButton(
                  icon: Icon(
                    (isHide == true) ? Icons.visibility : Icons.visibility_off,
                    color: Colors.blue[800],
                  ),
                  onPressed: () {
                    setState(() {
                      isHide = !isHide;
                    });
                  })
              : null,
        ),
      ),
    );
  }

  String validatePass(String value) {
    dynamic error;
    if (value.isEmpty) {
      error = "This field can't be empty";
    } else {
      error = null;
    }
    return error;
  }
}
