import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            GestureDetector(
              onTap: () { print("Imagem clicada!"); },
              child: Image.asset("images/papel.png")
            ),
            const Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                    "Escolha uma opção abaixo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("images/pedra.png", height: 100),
                Image.asset("images/papel.png", height: 100),
                Image.asset("images/tesoura.png", height: 100)
              ]
            )
          ]
      )
    );
  }
}
