import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Helper/Repository.dart';
import 'navigation/navigation.dart';
import 'navigation/routes.dart';

Future<void> main() async {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Repository(),
      child: Sizer(builder: (context, orientation, deviceType) {
        return const MyApp();
      }),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Taviraj"),
      debugShowCheckedModeBanner: false,
      navigatorKey: Navigation.instance.navigatorKey,
      onGenerateRoute: generateRoute,
    );
  }
}
