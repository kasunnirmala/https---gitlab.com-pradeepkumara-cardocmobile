import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:cardoc/main.dart';
import 'package:cardoc/util/app_router.dart';
import 'package:cardoc/util/app_router.gr.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeBaseScreenController extends GetxController {
  Rx<int> selectedIndex = 1.obs;
  List<TabItem> items = [
    const TabItem(
      icon: FontAwesomeIcons.magnifyingGlass,
      title: "Explore",
    ),
    const TabItem(
      icon: FontAwesomeIcons.house,
      title: "Home",
    ),
    const TabItem(
      icon: FontAwesomeIcons.user,
      title: "Profile",
    ),
    const TabItem(
      icon: FontAwesomeIcons.warehouse,
      title: "Company",
    )
  ];

  void onNavigationChanged(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 1:
        getIt<AppRouter>().replace(const HomeRoute());
        break;
      case 3:
        getIt<AppRouter>().replace(CompanyRoute(isEditable: true));
        break;
      default:
        getIt<AppRouter>().replace(const HomeRoute());
    }
  }
}
