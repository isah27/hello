import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/models/user_model.dart';
import 'package:swift_access/page%20route/detail/route.dart';
import 'package:swift_access/repo/auth%20repository/auth_repo.dart';
import 'package:swift_access/repo/auth%20repository/local%20repo/expense_db.dart';

import 'auth bloc/auth_bloc.dart';

// void main() {
//   runApp(DevicePreview(
//       enabled: true,
//       builder: (context) {
//         return const MyApp();
//       }));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
//  localUser= await DataBaseHelper.instance.fetchUser();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthBloc(UserRepository()),
            ),
          ],
          child: MaterialApp(
            title: 'Swift Access',
            debugShowCheckedModeBanner: false,

            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: Colors.amber,
            ),
            onGenerateRoute: AppRoute.onGeneratedRoute,
          ),
        );
      },
    );
  }
}
