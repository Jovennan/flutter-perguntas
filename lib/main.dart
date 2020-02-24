import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './resultado.dart';
import 'questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 9},
        {'texto': 'Amarelo', 'pontuacao': 8},
        {'texto': 'Verde', 'pontuacao': 7}
      ],
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 8},
        {'texto': 'Gato', 'pontuacao': 9},
        {'texto': 'Papagaio', 'pontuacao': 8},
        {'texto': 'Porco', 'pontuacao': 7},
      ]
    },
    {
      'pergunta': 'Qual é a sua linguagem favorita?',
      'respostas': [
        {'texto': 'Java', 'pontuacao': 7},
        {'texto': 'PHP', 'pontuacao': 9},
        {'texto': 'Python', 'pontuacao': 10},
        {'texto': 'Dart', 'pontuacao': 8},
      ]
    }
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Perguntas'),
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    pergunta: _perguntas[_perguntaSelecionada]['pergunta'],
                    respostas: respostas,
                    quandoResponder: _responder)
                : Resultado(_pontuacaoTotal, _reiniciarQuestionario)));
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
