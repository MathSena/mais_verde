import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../pages_route/app_pages.dart';
import '../../../services/utils_services.dart';
import '../../../services/validators.dart';
import '../../common_widgets/custom_text_field.dart';
import '../controller/auth_controller.dart';
import 'components/forgot_password_dialog.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset("assets/app_images/mais_verde.png"),
                    ),
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticíneos'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        controller: emailController,
                        icon: Icons.email,
                        label: 'Email',
                        validator: emailValidator,
                      ),

                      CustomTextField(
                        controller: passwordController,
                        icon: Icons.lock,
                        label: 'Senha',
                        isSecret: true,
                        validator: passwordValidator,
                      ),

                      SizedBox(
                        height: 50,
                        child: GetX<AuthController>(
                          builder: (authController) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: authController.isLoading.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();

                                      if (_formKey.currentState!.validate()) {
                                        String email = emailController.text;
                                        String password =
                                            passwordController.text;

                                        authController.signIn(
                                            email: email, password: password);
                                      }
                                    },
                              child: authController.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () async {
                            final bool? result = await showDialog(
                              context: context,
                              builder: (_) {
                                return ForgotPasswordDialog(
                                  email: emailController.text,
                                );
                              },
                            );

                            if (result ?? false) {
                              utilsServices.showToast(
                                message:
                                    'Um link de recuperação foi enviado para seu email.',
                              );
                            }
                          },
                          child: const Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Ou'),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Botão de novo usuário
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.green,
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(PagesRoutes.signUpRoute);
                          },
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
