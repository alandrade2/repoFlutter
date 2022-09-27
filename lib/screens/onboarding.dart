import 'package:flutter/material.dart';
import '../screens/contatos/listaContato.dart';
import '../screens/transferencia/listaTransferencia.dart';

const _tituloAppBar = 'DashBoards';

class Onboarding extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OnboardingState();
  }
}

class OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8D77BF),
        title: Text(_tituloAppBar),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _FeatureItem(
                  'Contatos',
                  Icons.account_circle_rounded,
                  onClick: () => _listaContatos(context),
                ),
                _FeatureItem(
                  'Transferências',
                  Icons.monetization_on,
                  onClick: () => _listaTransferencias(context),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFDDD6ED),
    );
  }

  void _listaContatos(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ListaContatos(),
    ));
  }

  void _listaTransferencias(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ListaTransferencia(),
    ));
  }
}

class _FeatureItem extends StatelessWidget {
  final String nome;
  final IconData icone;
  final Function onClick;

  _FeatureItem(this.nome, this.icone, {required this.onClick})
      : assert(icone != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            height: 100,
            width: 150,
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icone,
                  color: Colors.purple,
                  size: 20.0,
                ),
                Text(
                  nome,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
