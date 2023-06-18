
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_access/auth%20bloc/auth_bloc.dart';
import 'package:swift_access/constants/images.dart';

import 'page route/detail/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().loadApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, SwiftAccessStates>(
      listener: (context, state) {
        if (state is AuthLoadedState) {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.login, (route) => false);
        }
      },
      child:Image.asset(
         Assets.yelloSplashIMG,
          fit: BoxFit.fill,
          height: size.height,
          width: size.width,
        ),
    );
  }
}
