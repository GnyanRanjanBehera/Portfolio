import 'package:flutter/material.dart';
import 'package:portfolio/shared/extension/focus_node_ext.dart';
import 'package:portfolio/shared/widget/text_field_widget.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _obsecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return Form(
      key: _formKey,
      child: Column(
        spacing: h * 0.02,
        children: [
          TextFieldWidget(
            hintText: "Enter email",
            prefixIcon: Icon(Icons.email),
            controller: _emailController,
            focusNode: _emailNode,
            onFieldSubmitted: (value) {
              context.changeFocus(_emailNode, _passwordNode);
            },
          ),
          ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, obValue, _) {
                return TextFieldWidget(
                  hintText: "Enter password",
                  controller: _passwordController,
                  focusNode: _passwordNode,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      _obsecurePassword.value = !_obsecurePassword.value;
                    },
                    child:
                        Icon(obValue ? Icons.visibility : Icons.visibility_off),
                  ),
                  obscureText: obValue,
                  onFieldSubmitted: (value) {},
                );
              }),
        ],
      ),
    );
  }
}
