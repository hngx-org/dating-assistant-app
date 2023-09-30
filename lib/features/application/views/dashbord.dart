import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/features/application/provider/dashboard_nav_notifier.dart';
import 'package:dating_assitant_app/features/application/widgets/dashborad_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexProvider = ref.watch(dashboardNavIndexProvider);
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: appScreens(index: indexProvider),
        bottomNavigationBar: Container(
          // height: 58,
          decoration: BoxDecoration(
            color: ProjectColors.white,
            boxShadow: [
              BoxShadow(
                color: ProjectColors.black.withOpacity(0.2),
                offset: const Offset(0, -2),
                blurRadius: 5,
              )
            ]
          ),
          child: BottomNavigationBar(
            currentIndex: indexProvider,
            onTap: (value) => ref.read(dashboardNavIndexProvider.notifier).changeIndex(value),
            elevation: 0,
            items: bottomTabs,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedItemColor: ProjectColors.black,
            unselectedItemColor: ProjectColors.grey,
          ),
        ),
      ),
    );
  }
}

