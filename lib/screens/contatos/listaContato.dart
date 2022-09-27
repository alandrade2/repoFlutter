import 'package:flutter/material.dart';
import 'package:work_mobile/models/Contato.dart';
import 'formContato.dart';

const _tituloAppBar = 'Lista de Contatos';

class ListaContatos extends StatefulWidget {
  final List<Contatos> _contatos = [];

  @override
  State<StatefulWidget> createState() {
    return ListaContatosState();
  }
}

class ListaContatosState extends State<ListaContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        backgroundColor: Color.fromARGB(255, 51, 202, 20),
      ),
      body: ListView.builder(
        itemCount: widget._contatos.length,
        itemBuilder: ((context, indice) {
          final dadosContato = widget._contatos[indice];
          return ItemContatos(dadosContato);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Contatos?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioContato();
              },
            ),
          );
          future.then(
            (transferenciaRecebida) {
              // debugPrint('Chegou no then do future');
              // debugPrint('$transferenciaRecebida');
              if (transferenciaRecebida != null) {
                setState(
                  () {
                    widget._contatos.add(
                      transferenciaRecebida,
                    );
                  },
                );
              }
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemContatos extends StatelessWidget {
  final Contatos _contatos;

  ItemContatos(this._contatos);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.account_circle_rounded),
        title: Text(
          _contatos.name.toString(),
          style: TextStyle(fontSize: 26, color: Colors.blue),
        ),
        subtitle: Container(
            child: (Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Endereço: ' + _contatos.adress.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Telefone: ' + _contatos.phoneNumber.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Email: ' + _contatos.email.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'CPF: ' + _contatos.cpf.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ))),
      ),
    );
  }
}
