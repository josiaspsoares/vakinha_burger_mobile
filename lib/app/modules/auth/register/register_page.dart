import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../../core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/ui/widgets/custom_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadatro',
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style: context.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTextFormField(
                    label: 'Nome',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTextFormField(
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTextFormField(
                    label: 'Senha',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTextFormField(
                    label: 'Confirmação de Senha',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: CustomButton(
                    text: 'CADASTRAR',
                    width: context.width,
                    onPressed: () {},
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
