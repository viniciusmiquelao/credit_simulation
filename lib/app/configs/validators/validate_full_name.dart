String? validateFullName(String? input) {
  input = input!.trim();
  if (input.isEmpty || input.length == 1) return 'Digite seu nome do completo';
  return null;
}
