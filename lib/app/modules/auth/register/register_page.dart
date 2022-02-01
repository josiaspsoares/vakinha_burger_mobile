import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:vakinha_burger_mobile/app/core/ui/app_state.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/ui/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends AppState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

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
              key: _formKey,
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
                  CustomTextFormField(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.required('Nome Obrigatório'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    label: 'Email',
                    controller: _emailEC,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Email Obrigatório'),
                        Validatorless.email('Email Inválido'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    label: 'Senha',
                    controller: _passwordEC,
                    obscureText: true,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Senha Obrigatória'),
                        Validatorless.min(
                            6, 'Senha deve ter no mínimo 6 caracteres'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    label: 'Confirmação de Senha',
                    obscureText: true,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required(
                            'Confirmação de Senha Obrigatória'),
                        Validatorless.compare(
                            _passwordEC, 'Senhas não conferem'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: CustomButton(
                    text: 'CADASTRAR',
                    width: context.width,
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        controller.register(
                          name: _nameEC.text,
                          email: _emailEC.text,
                          password: _passwordEC.text,
                        );
                      }
                    },
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
