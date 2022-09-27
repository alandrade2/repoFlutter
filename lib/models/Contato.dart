class Contatos {
  final String name;
  final String cpf;
  final String email;
  final String adress;
  final String phoneNumber;

  Contatos(
    this.name,
    this.cpf,
    this.email,
    this.adress,
    this.phoneNumber,
  );

  @override
  String toString() {
    return 'Nome{Nome: $name, Cpf: $cpf, Telefone: $phoneNumber, E-mail: $email, Telefone: $phoneNumber}';
  }
}
