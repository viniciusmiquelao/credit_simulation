String? validateEmail(String? input) {
  if (input!.isEmpty) return 'Digite seu e-mail';
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(input)) return 'Email inválido';
  return null;
}
