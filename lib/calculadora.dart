import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _output = '0';
  String _input = '';
  String _previousInput = '';
  String _operator = '';

  // Função para atualizar a tela com os números e operadores
  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _input = '';
        _output = '0';
      } else if (buttonText == 'DEL') {
        _input = _input.substring(0, _input.length - 1);
      } else if (buttonText == '=') {
        _previousInput = _input;
        try {
          _output = _calculateResult();
        } catch (e) {
          _output = 'Erro';
        }
      } else {
        _input += buttonText;
      }
    });
  }

  // Função para calcular o resultado
  String _calculateResult() {
    String result = _input;

    try {
      result = _input;
      if (_input.contains('+')) {
        var parts = _input.split('+');
        var sum = double.parse(parts[0]) + double.parse(parts[1]);
        result = sum.toString();
      } else if (_input.contains('-')) {
        var parts = _input.split('-');
        var difference = double.parse(parts[0]) - double.parse(parts[1]);
        result = difference.toString();
      } else if (_input.contains('*')) {
        var parts = _input.split('*');
        var product = double.parse(parts[0]) * double.parse(parts[1]);
        result = product.toString();
      } else if (_input.contains('/')) {
        var parts = _input.split('/');
        var quotient = double.parse(parts[0]) / double.parse(parts[1]);
        result = quotient.toString();
      }
    } catch (e) {
      return 'Erro';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Flutter'),
        backgroundColor: Colors.pink,  // Cor da AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // Área de exibição
              Text(
                _input,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.pink),
              ),
              SizedBox(height: 20),
              Text(
                _output,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.pink),
              ),
              SizedBox(height: 20),

              // Teclado da calculadora
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _buttons.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      _buttonPressed(_buttons[index]);
                    },
                    child: Text(
                      _buttons[index],
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 244, 129, 217),  // Cor do botão
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Lista constante dos botões da calculadora
  static const List<String> _buttons = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
    'DEL'
  ];
}

