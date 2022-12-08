import 'package:get/get.dart';

import 'anel/anel_controller.dart';
import 'anel/anel_page.dart';
import 'home.dart';
import 'lamport/lamport_page.dart';
import 'lamport/lampor_controller.dart';

List<GetPage> getAppPages() {
  return [
    GetPage<void>(name: Home.route, page: () => Home(), transition: Transition.fadeIn),
    GetPage<void>(
      name: LamportPage.route,
      page: () => LamportPage(),
      transition: Transition.fadeIn,
      binding: BindingsBuilder(
        () => Get.lazyPut(() => LamportController()),
      ),
    ),
    GetPage<void>(
      name: AnelPage.route,
      page: () => AnelPage(),
      transition: Transition.fadeIn,
      binding: BindingsBuilder(
        () => Get.lazyPut(() => AnelController()),
      ),
    ),
  ];
}
