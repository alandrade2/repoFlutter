import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../models/transferencia.dart';
import 'formTransferencia.dart';

const _tituloAppBar = 'Transferência';

class ListaTransferencia extends StatefulWidget {
  final List<TransferenciaValor> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: ((context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<TransferenciaValor?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
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
                    widget._transferencias.add(
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

class ItemTransferencia extends StatelessWidget {
  final TransferenciaValor _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatValue = NumberFormat.simpleCurrency();
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(
          formatValue.format(_transferencia.valor),
        ),
        subtitle: Text(
          _transferencia.numConta.toString(),
        ),
      ),
    );
  }
}
