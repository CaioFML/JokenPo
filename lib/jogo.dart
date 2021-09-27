import "package:flutter/material.dart";
import "dart:math";

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = AssetImage("images/padrao.png");
  var _message = "Escolha uma opção abaixo";

  void _userChoice(String userChoice) {
    var options = ["pedra", "papel", "tesoura"];
    var number = Random().nextInt(3);
    var appChoice = options[number];

    switch(appChoice){
      case "pedra" :
        setState(() {
          _imageApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel" :
        setState(() {
          _imageApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura" :
        setState(() {
          _imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if(
      userChoice == "pedra" && appChoice == "tesoura" ||
        userChoice == "tesoura" && appChoice == "papel" ||
          userChoice == "papel" && appChoice == "pedra"
    ){
      setState(() {
        _message = "Você ganhou!!! :)";
      });

    }
    else if(
      appChoice == "pedra" && userChoice == "tesoura" ||
        appChoice == "tesoura" && userChoice == "papel" ||
          appChoice == "papel" && userChoice == "pedra"
    ){
      setState(() {
        _message = "Você perdeu!!! :(";
      });
    }

    else {
      setState(() {
        _message = "Empate!!! :o";
      });
    }
  }

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
            Image(image: _imageApp),
            Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                    _message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _userChoice("pedra"),
                  child: Image.asset("images/pedra.png", height: 100)
                ),
                GestureDetector(
                    onTap: () => _userChoice("papel"),
                    child: Image.asset("images/papel.png", height: 100)
                ),
                GestureDetector(
                    onTap: () => _userChoice("tesoura"),
                    child: Image.asset("images/tesoura.png", height: 100)
                )

                // Image.asset("images/pedra.png", height: 100),
                // Image.asset("images/papel.png", height: 100),
                // Image.asset("images/tesoura.png", height: 100)
              ]
            )
          ]
      )
    );
  }
}
