String? validateAmount(String? input) {
  input = input!
      .replaceAll('R\$ ', '')
      .replaceAll('.', '')
      .replaceAll(',', '.')
      .trim();

  if (input.isEmpty) return 'Digite um valor';
  final valueInDouble = double.parse(input);
  if (valueInDouble < 500.00) return 'O valor deve ser maior que R\$ 500';
  if (valueInDouble > 300000.00)
    return 'O valor deve ser menor que R\$ 300.000';
  return null;
}
