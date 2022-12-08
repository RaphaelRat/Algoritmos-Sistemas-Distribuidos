import 'package:get/get.dart';

class LamportController extends GetxController {
  final index = 0.obs;
  final explicacao = '\nSerá exibido aqui os processos e seus respectivos contadores!'.obs;
  final _proceossos = [
    '\nSerá exibido aqui os processos e seus respectivos contadores!',
    'P1: a(1)\nP2: g(1)\nP3:\nP4: p(1)',
    'P1: a(1), b(2)\nP2: g(1)\nP3: k(2)\nP4: p(1), q(2)',
    'P1: a(1), b(2), c(3)\nP2: g(1), h(3)\nP3: k(2), l(3)\nP4: p(1), q(2), r(3)',
    'P1: a(1), b(2), c(3), d(4)\nP2: g(1), h(3)\nP3: k(2), l(3), m(4)\nP4: p(1), q(2), r(3)',
    'P1: a(1), b(2), c(3), d(4), e(5)\nP2: g(1), h(3)\nP3: k(2), l(3), m(4), n(5)\nP4: p(1), q(2), r(3)',
    'P1: a(1), b(2), c(3), d(4), e(5), f(6)\nP2: g(1), h(3), i(6)\nP3: k(2), l(3), m(4), n(5), o(6)\nP4: p(1), q(2), r(3)',
    'P1: a(1), b(2), c(3), d(4), e(5), f(6)\nP2: g(1), h(3), i(6), j(7)\nP3: k(2), l(3), m(4), n(5), o(6)\nP4: p(1), q(2), r(3), s(7)',
  ];

  void nextButtonPressed() {
    index.value++;
    explicacao.value = _proceossos.elementAt(index.value);
  }

  void previewButtonPressed() {
    index.value--;
    explicacao.value = _proceossos.elementAt(index.value);
  }

  void resetButtonPressed() {
    index.value = 0;
    explicacao.value = _proceossos.elementAt(index.value);
  }
}
