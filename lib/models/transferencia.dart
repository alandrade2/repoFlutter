
class TransferenciaValor {
  final int numConta;
  final double valor;

  TransferenciaValor(
    this.numConta,
    this.valor,
  );

  @override
  String toDouble() {
    return 'Transferencia {Conta: $numConta, Valor: $valor}';
  }
}
