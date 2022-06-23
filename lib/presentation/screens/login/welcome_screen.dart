import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagineapps_leal/locator.dart';
import 'package:imagineapps_leal/presentation/presentation.dart';
import 'package:imagineapps_leal/domain/domain.dart';

class WelcomeScreen extends ConsumerWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final _loginLocator = locator<LoginRepository>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(width: double.infinity, height: double.infinity, color: Colors.amber),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.15),
                    TextWidget(
                      text: 'Welcome!',
                      style: theme.textTheme.headline5?.copyWith(color: theme.colorScheme.secondaryContainer),
                    ),
                    if (!ref.watch(showLogInForm)) const _WelcomeButtons(),
                    if (ref.watch(showLogInForm)) _LoginForm(loginLocator: _loginLocator),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WelcomeButtons extends ConsumerWidget {
  const _WelcomeButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(height: size.height * 0.3),
        ButtonWidget(text: 'Sign up', onTap: () {}),
        SizedBox(height: size.height * 0.03),
        ButtonWidget(
          text: 'Log in',
          color: theme.colorScheme.secondaryContainer,
          onTap: () => ref.read(showLogInForm.notifier).setShowLogInForm(true),
        ),
        SizedBox(height: size.height * 0.04),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: theme.colorScheme.secondary, width: 1.0)),
            ),
            child: TextWidget(
              text: 'Forgot password?',
              style: theme.textTheme.bodyText1?.copyWith(
                color: theme.colorScheme.secondaryContainer,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm({
    Key? key,
    required LoginRepository loginLocator,
  })  : _loginLocator = loginLocator,
        super(key: key);

  final LoginRepository _loginLocator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(height: size.height * 0.335),
        Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer.withOpacity(0.8),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: size.height * 0.02),
              GestureDetector(
                onTap: () => ref.read(showLogInForm.notifier).setShowLogInForm(false),
                child: Icon(Icons.close, color: theme.colorScheme.secondary, size: 30),
              ),
              SizedBox(height: size.height * 0.01),
              TextFormFieldWidget(
                hintText: 'Name',
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => ref.read(name.notifier).setName(value),
              ),
              SizedBox(height: size.height * 0.05),
              TextFormFieldWidget(
                hintText: 'Password',
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (value) => ref.read(password.notifier).setPassword(value),
              ),
              SizedBox(height: size.height * 0.125),
              Center(
                child: ButtonWidget(
                  text: 'Log in',
                  color: theme.colorScheme.secondaryContainer,
                  onTap: () {
                    final bool response = _loginLocator.loginUser(name: ref.watch(name), password: ref.watch(password));

                    if (response) {
                      Navigator.of(context).pushNamedAndRemoveUntil('/initScreen', (route) => false);
                    } else {
                      ref.read(showLogInForm.notifier).setShowLogInForm(false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: TextWidget(
                            text: 'Usuario o contraseña incorrecta',
                            style: theme.textTheme.bodyText1?.copyWith(color: theme.colorScheme.secondaryContainer),
                          ),
                          backgroundColor: theme.colorScheme.primaryContainer,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: size.height * 0.07),
            ],
          ),
        ),
      ],
    );
  }
}
