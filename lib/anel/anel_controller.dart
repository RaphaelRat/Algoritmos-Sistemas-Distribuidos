import 'package:get/get.dart';

class AnelController extends GetxController {
  final index = 0.obs;
  final explicacao = 'Será explicado aqui cada passo desse algorítmo de eleção!'.obs;
  final _proceossos = [
    'Será explicado aqui cada passo desse algorítmo de eleção!',
    'P6 é o coordenador,  logo o processo 3 manda uma requisição solicitando recursos para o mesmo.',
    'Entretanto não houve resposta do lado do coordenador,  significando que ele possui falha.',
    'Após pereber a falha do coordenador,  o P3 inicia uma eleição,  mudando seu estado para participante e passando seu Id para seu vizinho (no sentido horário).',
    'Então o  P4 muda seu estado para participante e envia o número do seu Id para seu vizinho,  já que seu identificador é maior do que o recebido.',
    'Com isso,  após mudar seu estado para participante,  o P5 envia seu Id para seu vizinho,  já ignorando o processo que falhou.',
    'Com isso,  o Id recebido pelo 0 foi maior que seu próprio Id,  logo ele mudou seu estado para participante e passou o Id reebido a diante,  até o P2 enviar para P3.',
    'Após o P3 receber o novo Id,  ele percebe que é maior que o seu,  e como já está com estado em participante,  ele só passa adiante,  como o P4, até que chea em P5.',
    'Quando P5 recebe seu próprio Id, ele envia uma mensagem E* (eleito) para todos os processos, junto com os novos membros do anel. E todos removem seu estado de participante.',
    'Agora o P5 é o coordenador :)',
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
