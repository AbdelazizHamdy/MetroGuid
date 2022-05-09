import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:metro_guid/cubit/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_guid/bloc/geolocation/geolocation_bloc.dart';
import 'package:metro_guid/bloc/geolocation/geolocation_event.dart';
import 'package:metro_guid/local/cash_helper.dart';
import 'package:metro_guid/repo/geo_location/geo_location_repo.dart';
import 'package:metro_guid/view/metro_home_screen.dart';
import 'cubit/quantity_cubit.dart';
import 'cubit/state.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CashHelper.init();
  bool? isDark = CashHelper.getData(key: 'isDark');
  runApp(
      EasyLocalization(
        supportedLocales: const
        [
          Locale('en','US'),
          Locale('ar','EG'),
        ],
      path: 'assets/translations',
      saveLocale: true,
      fallbackLocale: const Locale('en','US'),
      child:  const MyApp()
      ));
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key,  this.isDark}) : super(key: key);
    final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..changeAppMode(
        fromShared: isDark,
      ),
      child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.deepOrange,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  elevation: 00.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  subtitle1: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),

                ),
              ),
              darkTheme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light,
                    ),
                    elevation: 20.0,
                    titleTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    iconTheme: const IconThemeData(
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.deepOrange,
                  ),
                  textTheme: const TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    subtitle1: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  scaffoldBackgroundColor: HexColor('333739')),
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              home:  const MetroHome(),
            );
          }),
    );
  }
}
