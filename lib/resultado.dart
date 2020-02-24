import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 22) {
      return 'Parabéns';
    } else if (pontuacao < 25) {
      return 'Muito Bom!';
    } else if (pontuacao < 27) {
      return 'Impressionante!!!';
    } else {
      return 'Nível Jedi :)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          onPressed: reiniciarQuestionario,
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          textColor: Colors.blueAccent,
        )
      ],
    );
  }
}
