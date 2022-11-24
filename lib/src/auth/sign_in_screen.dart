import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mais_verde/src/auth/components/custom_text_field.dart';
import 'package:mais_verde/src/auth/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
                      children:  [
                        Image.asset("assets/app_imagens/logotipo.png"),
                        SizedBox(
                          height:30,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize:25,
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
                            ],),
                          ),
                        )
                      ]),
       ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 40,
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(45))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomTextField(
                        icon: Icons.email,
                        label: 'Email',
                      ),
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha',
                        isSecret: true,
                      ),
                      SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                            onPressed: () {},
                            child: const Text(
                              'Entrar..',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          )),
                      //Esqueceu a Senha
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(color: Colors.red),
                            )),
                      ),
                      // Divisor
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: const [
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Ou'),
                            ),
                            Expanded(
                                child: Divider(
                              color: Colors.grey,
                              thickness: 2,
                            )),
                          ],
                        ),
                      ),

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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (c){
                                return SignUpScreen();
                              }
                              ),
                            );
                          },
                          child: const Text('Criar conta',
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
