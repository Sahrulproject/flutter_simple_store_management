import 'package:flutter/material.dart';
import 'package:kel5_ppkdb3/preference/shared_preference.dart';
import 'package:kel5_ppkdb3/views/login_screen.dart';
import 'package:kel5_ppkdb3/extension/navigation.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        PreferenceHandler.removeLogin();
        context.pushReplacement(LoginScreen());
      },
      child: Text("Keluar"),
    );
  }
}
