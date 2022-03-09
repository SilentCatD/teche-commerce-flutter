import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teche_commerce/app.dart';
import 'package:teche_commerce/app_obs.dart';
import 'package:teche_commerce/view/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final BlocObserver appBlocObserver = AppBlocObserver();
  final AppRouter router = AppRouter();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  BlocOverrides.runZoned(
      () => runApp(App(
            router: router,
          )),
      blocObserver: appBlocObserver,
  );
}
