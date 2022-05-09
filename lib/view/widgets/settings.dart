import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../cubit/app_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text('Language'.tr().toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text('Dark Mode'.tr().toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
             const SizedBox(height: 0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: ToggleSwitch(
                    initialLabelIndex: 0,
                    totalSwitches: 3,
                    fontSize: 16,
                    labels: const ['English','French' , 'العربية'],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ),
                  SizedBox(width: width * 0.2,),
                Expanded(
                  child: Container(
                    child: IconButton(
                        onPressed: (){
                          AppCubit.get(context).changeAppMode();
                        },
                        icon: const Icon(Icons.brightness_4_outlined),
                        color: Colors.deepOrange),
                  ),
                ),
              ],
            ),
                TextButton(onPressed: (){
                  context.locale = const Locale('en','US');
                },
                    child: const Text('EN')),
                TextButton(onPressed: (){
                  context.locale = const Locale('ar','EG');
                },
                    child: const Text('AR'))
          ]),
        ),
      ),
    );
  }
}
