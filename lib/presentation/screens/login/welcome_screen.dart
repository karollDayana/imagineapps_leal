import 'package:flutter/material.dart';
import 'package:imagineapps_leal/presentation/presentation.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showLogInForm = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.amber,
            ),
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
                    if (!showLogInForm)
                      Column(
                        children: [
                          SizedBox(height: size.height * 0.3),
                          ButtonWidget(text: 'Sign up', onTap: () {}),
                          SizedBox(height: size.height * 0.03),
                          ButtonWidget(
                            text: 'Log in',
                            color: theme.colorScheme.secondaryContainer,
                            onTap: () => setState(() => showLogInForm = true),
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
                      ),
                    if (showLogInForm)
                      Column(
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
                                  onTap: () => setState(() => showLogInForm = false),
                                  child: Icon(Icons.close, color: theme.colorScheme.secondary, size: 30),
                                ),
                                SizedBox(height: size.height * 0.01),
                                const TextFormFieldWidget(hintText: 'Name', keyboardType: TextInputType.emailAddress),
                                SizedBox(height: size.height * 0.05),
                                const TextFormFieldWidget(
                                    hintText: 'Password', keyboardType: TextInputType.text, obscureText: true),
                                SizedBox(height: size.height * 0.125),
                                Center(
                                  child: ButtonWidget(
                                    text: 'Log in',
                                    color: theme.colorScheme.secondaryContainer,
                                    onTap: () => Navigator.of(context).pushNamedAndRemoveUntil('/initScreen', (route) => false),
                                  ),
                                ),
                                SizedBox(height: size.height * 0.07),
                              ],
                            ),
                          ),
                        ],
                      ),
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
