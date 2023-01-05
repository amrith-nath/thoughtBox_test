import 'package:flutter/material.dart';
import 'package:thoughtbox_test/views/activity/activity.dart';
import 'package:thoughtbox_test/views/job_list/job_list.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  ValueNotifier<int> navigationNotify = ValueNotifier(0);

  final List<Widget> homeWidgets = [
    JobListScreen(),
    ActivityScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: navigationNotify,
          builder: (context, value, _) {
            return homeWidgets[value];
          }),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: navigationNotify,
          builder: (context, index, _) {
            return BottomNavigationBar(
                currentIndex: navigationNotify.value,
                onTap: (newvalue) {
                  navigationNotify.value = newvalue;
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.local_activity,
                    ),
                    label: 'Activity',
                  )
                ]);
          }),
    );
  }
}
