import 'package:flutter_riverpod/flutter_riverpod.dart';

final name = StateNotifierProvider<Name, String>((ref) {
  return Name();
});

class Name extends StateNotifier<String> {
  Name() : super('');
  void setName(String value) => state = value;
}

final password = StateNotifierProvider<Password, String>((ref) {
  return Password();
});

class Password extends StateNotifier<String> {
  Password() : super('');
  void setPassword(String value) => state = value;
}

final showLogInForm = StateNotifierProvider<ShowLogInForm, bool>((ref) {
  return ShowLogInForm();
});

class ShowLogInForm extends StateNotifier<bool> {
  ShowLogInForm() : super(false);
  void setShowLogInForm(bool value) => state = value;
}
