import 'package:flutter/material.dart';

const _tituloAppBar = 'DashBoards';

void main() {
  runApp(Onboarding());
}

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        backgroundColor: Color(0xFF8D77BF),
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    color: Color(0xff0cd016),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          offset: Offset(2.0, 2.0))
                    ]),
                child: Column(
                  children: [
                    Icon(Icons.account_circle_rounded),
                    Text('130'),
                    Text('Contatos'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    color: Color(0xff19c4db),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          offset: Offset(2.0, 2.0))
                    ]),
                child: Column(
                  children: [
                    Icon(Icons.monetization_on),
                    Text('RS 1.500,00'),
                    Text('Transferencias'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFDDD6ED),
    );
  }
}
