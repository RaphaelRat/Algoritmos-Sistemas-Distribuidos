import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'anel/anel_page.dart';
import 'lamport/lamport_page.dart';

class Home extends StatelessWidget {
  Home({super.key});
  static const route = '/';
  final textTheme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text('Trabalho final de Sistemas Distribuídos', style: textTheme.displaySmall),
              const SizedBox(height: 8),
              Text('Por: Raphael Abreu e Yan Bentes', style: textTheme.displaySmall?.copyWith(fontSize: 20)),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
            ),
            width: 720,
            child: Text(
                ' Para o trabalho final da disciplina, foi proposto a implementacao dos algorítmos de Relógio de '
                'Lamport e de Eleição - Anel. Para isso, vamos entender melhor cada algorítmo:',
                style: textTheme.labelLarge),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardLamport(),
              const SizedBox(width: 20),
              cardAnel(),
            ],
          ),
        ],
      ),
    );
  }

  Column cardLamport() {
    return Column(
      children: [
        Container(
          width: 350,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black,
          ),
          child: Text(
            'Algorítmo de Relógio de Lamport',
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Container(
            width: 334,
            height: 220,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
              color: Colors.black26,
            ),
            child: Column(
              children: [
                Text(
                  'No algoritmo de Lamport, as requests de seção crítica são executadas em ordem crescente de timestamps, ou seja, uma solicitação com timestamp menor terá permissão para executar a seção crítica primeiro do que uma solicitação com timestamp maior. Clique abaixo e acesse a implementação.',
                  style: textTheme.labelLarge,
                ),
                const SizedBox(height: 16),
                Expanded(
                    child: Center(child: ElevatedButton(onPressed: () => Get.toNamed(LamportPage.route), child: const Text('Algorítmo de Lamport')))),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column cardAnel() {
    return Column(
      children: [
        Container(
          width: 350,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black,
          ),
          child: Text(
            'Algorítmo de Eleição Anél',
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Container(
            width: 334,
            height: 220,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
              color: Colors.black26,
            ),
            child: Column(
              children: [
                Text(
                  'O algoritmo em anel serve para eleger um líder se os processos estiverem dispostos em um anel. Cada processo deve conhecer seu vizinho à direita e à esquerda e deve ter um identificador numérico, único, fixo e atribuído antes do início da eleição. Clique abaixo e acesse a implementação.',
                  style: textTheme.labelLarge,
                ),
                const SizedBox(height: 16),
                Expanded(child: Center(child: ElevatedButton(onPressed: () => Get.toNamed(AnelPage.route), child: const Text('Algorítmo de Anél')))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
