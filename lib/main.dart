import 'package:coin_gecko/core/routing/app_router.dart';
import 'package:coin_gecko/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.homeScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
