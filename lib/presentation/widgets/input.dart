import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final InputBorder? focusedBorder;
  final String? Function(String?)? validator;
  final bool? isPassword;

  const Input(
      {Key? key,
      required this.label,
      required this.controller,
      this.focusedBorder,
      this.validator,
      this.isPassword = false})
      : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  get label => widget.label;
  get controller => widget.controller;
  get focusedBorder => widget.focusedBorder;
  get validator => widget.validator;
  get isPassword => widget.isPassword;

  late bool _isPasswordObscure = isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          key: Key(label.toLowerCase()),
          controller: controller,
          validator: validator,
          obscureText: _isPasswordObscure,
          decoration: InputDecoration(
              focusedBorder: focusedBorder,
              labelText: label,
              labelStyle: const TextStyle(color: Colors.grey),
              suffixIcon: isPassword!
                  ? IconButton(
                      icon: _isPasswordObscure
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            ),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      })
                  : null),
        ));
  }
}
