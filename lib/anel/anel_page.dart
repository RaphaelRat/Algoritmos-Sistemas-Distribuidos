import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';
import '../lamport/lamport_page.dart';
import 'anel_controller.dart';

class AnelPage extends GetView<AnelController> {
  AnelPage({super.key});

  static const route = '/anel';
  final textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: IconButton(onPressed: () => Get.offAllNamed(Home.route), icon: Icon(Icons.arrow_back_ios))),
              const SizedBox(width: 16),
              Text('Algorítmo de Anel', style: textTheme.displaySmall),
              const SizedBox(width: 16),
              Expanded(child: TextButton(onPressed: () => Get.offAllNamed(LamportPage.route), child: Text('Algorítmo de Lamport'))),
            ],
          ),
          const SizedBox(height: 32),
          Container(
            alignment: Alignment.topLeft,
            width: 350,
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Get.theme.primaryColor,
            ),
            child: Obx(() => AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Center(
                  key: ValueKey<String>(controller.explicacao.value),
                  child: Text(
                    controller.explicacao.value,
                    style: textTheme.subtitle2?.copyWith(height: 1.7),
                    textAlign: TextAlign.center,
                  ),
                ))),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(64),
                child: Obx(
                  () => AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: Image(
                      image: AssetImage('assets/images/anel/anel${controller.index.value}.png'),
                      key: ValueKey<AssetImage>(AssetImage('assets/images/anel/anel${controller.index.value}.png')),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: Obx(
                  () => controller.index.value == 0
                      ? Container()
                      : ElevatedButton(onPressed: () => controller.previewButtonPressed(), child: Text('Voltar', textAlign: TextAlign.center)),
                ),
              ),
              const SizedBox(width: 32),
              Obx(
                () => AnimatedSwitcher(
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    duration: Duration(milliseconds: controller.index.value == 9 ? 1200 : 0),
                    child: SizedBox(
                      key: ValueKey<int>(controller.index.value),
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () => controller.index.value == 9 ? controller.resetButtonPressed() : controller.nextButtonPressed(),
                          child: controller.index.value == 9 ? Icon(Icons.refresh_outlined) : Text('Avançar', textAlign: TextAlign.center)),
                    )),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
