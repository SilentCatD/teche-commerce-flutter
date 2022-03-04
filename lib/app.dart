import 'package:flutter/material.dart';
import 'package:teche_commerce/view/app_router.dart';
import 'package:teche_commerce/view/theme/theme.dart';

class App extends StatefulWidget {
  const App({Key? key, required this.router}) : super(key: key);
  final AppRouter router;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        onGenerateRoute: widget.router.onGenerateRoute,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.router.dispose();
  }

}
