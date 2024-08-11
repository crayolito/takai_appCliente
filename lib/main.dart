import 'package:app_sig2024/blocs/auth/authetication_bloc.dart';
import 'package:app_sig2024/config/constant/estilosLetras.constant.dart';
import 'package:app_sig2024/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

EstilosLetras? estilosText;

void main() async {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AutheticationBloc()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    estilosText = EstilosLetras(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
