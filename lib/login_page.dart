import 'package:flutter/material.dart';
import 'package:meuappflutter/view/alunos_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color myWhiteColor = const Color(0xFF979797);
  Color myDarkColor = const Color(0xFF212C34);

  //Password
  bool _showPassword = true;

  void doLogin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //widget logotipo
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset("images/logotipo_firma.png"),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          //widget input entrada de email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              //keyboardAppearance: Brightness.dark,
              maxLength: 30,
              //maxLines: 1,
              cursorColor: Colors.white,
              style: TextStyle(color: myWhiteColor),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                counterStyle: TextStyle(color: myWhiteColor),
                contentPadding: const EdgeInsets.only(left: 17),
                //se o input é só underline ou tem um container
                filled: true,
                fillColor: myDarkColor,
                hintText: 'Informe seu usuário',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(37),
                  borderSide: const BorderSide(
                    style: BorderStyle.none,
                  ),
                ),
                hintStyle: TextStyle(color: myWhiteColor),
              ),
            ),
          ),
          //widget input entrada de senha
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              keyboardAppearance: Brightness.dark,
              maxLength: 40,
              maxLines: 1,
              cursorColor: Colors.white,
              style: TextStyle(color: myWhiteColor),
              obscureText: _showPassword,
              decoration: InputDecoration(
                counterStyle: TextStyle(color: myWhiteColor),
                contentPadding: const EdgeInsets.only(left: 17),
                filled: true,
                fillColor: myDarkColor,
                hintText: 'Informe a senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(37),
                  borderSide: const BorderSide(
                    style: BorderStyle.none,
                  ),
                ),
                hintStyle: TextStyle(color: myWhiteColor),

                ////////////////////
                /////// icone do olho deixar pro final
                suffixIcon: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    child: IconButton(
                      onPressed: null,
                      icon: _showPassword == false
                          ? Icon(
                              Icons.visibility,
                              color: myWhiteColor,
                              size: 18,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: myWhiteColor,
                              size: 18,
                            ),
                    ),
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),
                ///////icone do olho//////////////
                //////////////////////////////////////
              ),
            ),
          ),
          //widget text simples com a frase e fará um link
          const Text(
            'Esqueci minha senha',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          //widget botão de entrar login
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.92,
            height: 45,
            child: ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AlunosPage()),
                );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(12),
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Entrar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
