import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../anel/anel_page.dart';
import '../home.dart';
import 'lampor_controller.dart';

class LamportPage extends GetView<LamportController> {
  LamportPage({super.key});

  static const route = '/lamport';
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
              Text('Algorítmo de Lamport', style: textTheme.displaySmall),
              const SizedBox(width: 16),
              Expanded(child: TextButton(onPressed: () => Get.offAllNamed(AnelPage.route), child: Text('Algorítmo de Anel'))),
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
                child: Container(
                  key: ValueKey<String>(controller.explicacao.value),
                  width: double.infinity,
                  child: Text(controller.explicacao.value, style: textTheme.subtitle2?.copyWith(height: 1.7)),
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
                      image: AssetImage('assets/images/lamport/lamport${controller.index.value}.png'),
                      key: ValueKey<AssetImage>(AssetImage('assets/images/lamport/lamport${controller.index.value}.png')),
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
                    duration: Duration(milliseconds: controller.index.value == 7 ? 1200 : 0),
                    child: SizedBox(
                      key: ValueKey<int>(controller.index.value),
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () => controller.index.value == 7 ? controller.resetButtonPressed() : controller.nextButtonPressed(),
                          child: controller.index.value == 7 ? Icon(Icons.refresh_outlined) : Text('Avançar', textAlign: TextAlign.center)),
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
