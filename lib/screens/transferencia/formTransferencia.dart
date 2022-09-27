import 'package:flutter/material.dart';
import '../../components/editorNumber.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloNumConta = 'Numero da conta';
const _dicaNumConta = '0000';

const _rotuloValor = 'Numero da conta';
const _dicaValor = '0000';

const _textButtonConfirm = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorNumConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              EditorNumber(
                ctlControler: _controladorNumConta,
                ctlRotulo: _rotuloNumConta,
                ctlDica: _dicaNumConta,
              ),
              EditorNumber(
                ctlControler: _controladorValor,
                ctlRotulo: _rotuloValor,
                ctlDica: _dicaValor,
                ctlIcon: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text(_textButtonConfirm),
                onPressed: () {
                  _criaTransferencia(context);
                },
              )
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numConta = int.tryParse(
      _controladorNumConta.text,
    );

    final double? valor = double.parse(
      _controladorValor.text,
    );
    if (numConta != null && valor != null) {
      final transfCriada = TransferenciaValor(
        numConta,
        valor,
      );
      Navigator.pop(context, transfCriada);
    }
  }
}
