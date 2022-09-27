import 'package:flutter/material.dart';
import '../../components/editorNumber.dart';
import '../../components/editorString.dart';
import '../../models/Contato.dart';

const _tituloAppBar = 'Cadastro Contato';

const _rotulonome = 'Nome';
const _dicanome = 'Digite Seu nome';

const _rotuloEndereco = 'Endereço';
const _dicaEndereco = 'Digite seu endereço';

const _rotuloTelefone = 'Telefone';
const _dicaTelefone = '(00) 0 0000-0000';

const _rotuloEmail = 'Email';
const _dicaEmail = 'email@email.com';

const _rotuloCpf = 'CPF';
const _dicaCpf = '000.000.000-00';

const _textButtonConfirm = 'Confirmar';

class FormularioContato extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioContatoState();
  }
}

class FormularioContatoState extends State<FormularioContato> {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEndereco = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorCPF = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
          backgroundColor: Color.fromARGB(255, 51, 202, 20),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              EditorString(
                ctlControler: _controladorNome,
                ctlRotulo: _rotulonome,
                ctlDica: _dicanome,
              ),
              EditorString(
                ctlControler: _controladorEndereco,
                ctlRotulo: _rotuloEndereco,
                ctlDica: _dicaEndereco,
              ),
              EditorNumber(
                ctlControler: _controladorTelefone,
                ctlRotulo: _rotuloTelefone,
                ctlDica: _dicaTelefone,
              ),
              EditorString(
                ctlControler: _controladorEmail,
                ctlRotulo: _rotuloEmail,
                ctlDica: _dicaEmail,
              ),
              EditorNumber(
                ctlControler: _controladorCPF,
                ctlRotulo: _rotuloCpf,
                ctlDica: _dicaCpf,
              ),
              ElevatedButton(
                child: Text(_textButtonConfirm),
                onPressed: () {
                  _criaContato(context);
                },
              )
            ],
          ),
        ));
  }

  void _criaContato(BuildContext context) {
    final String? name = (_controladorNome.text);
    final String? cpf = (_controladorCPF.text);
    final String? email = (_controladorEmail.text);
    final String? adress = (_controladorEndereco.text);
    final String? phoneNumber = (_controladorTelefone.text);

    if (name != null &&
        cpf != null &&
        email != null &&
        adress != null &&
        phoneNumber != null) {
      final novoContato = Contatos(name, cpf, email, adress, phoneNumber);

      Navigator.pop(context, novoContato);
    }
  }
}
