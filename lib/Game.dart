import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Game extends StatefulWidget {
  const Game({ Key? key }) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
 
    var _imageApp =   AssetImage("images/padrao.png");
    var _mensagem = "escolha uma opção abaixo";

    void _opcaoSelecionada(String escolhaUsuario){
      
      var opcoes = ["pedra","papel","tesoura"];
      var numero = Random().nextInt(3);
      var escolhaApp = opcoes[numero];

      print("Escolha do app: "  +  escolhaApp);
      print("Escolha do usuario " + escolhaUsuario);

      //exibiçao aleatoria da imagem
      switch (escolhaApp) {
        case "pedra" : 
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });
        break;
        case "papel" : 
        setState(() {
          this._imageApp = AssetImage("images/papel.png");
        });
        break;
        case "tesoura" : 
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });
        break;
      }
      //validaçao do ganhador
        //usario ganhador
        if(
          (escolhaUsuario == "pedra" && escolhaApp == "tesoura")||
          (escolhaUsuario == "tesoura" && escolhaApp == "papel")||
          (escolhaUsuario == "papel" && escolhaApp == "pedra")

        ){

          setState(() {
            this._mensagem = "Parabéns você ganhou!!!";
          });
          
        }else if (
          (escolhaApp == "pedra" && escolhaUsuario == "tesoura")||
          (escolhaApp == "tesoura" && escolhaUsuario == "papel")||
          (escolhaApp == "papel" && escolhaUsuario == "pedra")
        ){

          setState(() {
            this._mensagem = "Você perdeu!!!";
          });

        }else{
            setState(() {
            this._mensagem = "Empatamos!!!";
          });
        }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32,bottom: 16),
            child: Text(
              "Escolha o App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          
          Image(image: this._imageApp,),
          Padding(
            padding: EdgeInsets.only(top: 32,bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
              onTap:  () =>  _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 100,),
              ),
              GestureDetector(onTap:  () =>  _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", height: 100,),),
              GestureDetector(onTap:  () =>  _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100,),),
              /*
              Image.asset("images/papel.png",height: 100,),
              Image.asset("images/pedra.png",height: 100,),
              Image.asset("images/tesoura.png",height: 100,),
              */
            ],
          )
        ],
      ),
    );
  }
}