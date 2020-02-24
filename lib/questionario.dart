import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final String pergunta;
  final List<Map<String, Object>> respostas;
  final void Function(int) quandoResponder;

  Questionario({
    @required this.pergunta,
    @required this.respostas,
    @required this.quandoResponder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questao(pergunta),
        ...respostas.map((value) {
          return Resposta(
            value['texto'],
            () => quandoResponder(value['pontuacao']),
          );
        }).toList(),
      ],
    );
  }
}
