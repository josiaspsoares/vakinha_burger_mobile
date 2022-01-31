import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/ui/app_ui.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/custom_app_bar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/custom_button.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: context.textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColorDark,
                        ),
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
                        height: 50,
                      ),
                      Center(
                          child: CustomButton(
                        text: 'ENTRAR',
                        width: context.width,
                        onPressed: () {},
                      )),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não possui uma conta?'),
                          TextButton(
                              onPressed: () {
                                Get.toNamed('/auth/register');
                              },
                              child: const Text(
                                'Cadastre-se',
                                style: AppUI.textBold,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
