# BRADEMO - Atividades e Exercícios

Repositório destinado ao envio das atividades da disciplina BRADEMO (IFSP).

## Estrutura

- `aula-02-flutter/`: Exercícios de fixação de Flutter (Widgets básicos, Layouts, MediaQuery e Componentes).
- `aula-02-exercicios-slides/`: Exercícios propostos ao final dos slides da Aula 2 - Introdução ao Flutter.
  Cada exercício é um projeto Flutter independente, com o seu próprio `pubspec.yaml` e `lib/main.dart`.

## Aula 2 - Exercícios dos slides

| Projeto | Exercício | Widgets estudados |
| --- | --- | --- |
| `exercicio_01_container_icon_text/` | Reproduzir a interface "Flutter is Fun!" | Container, Colors, Icon, Text |
| `exercicio_02_barra_de_botoes/` | Barra de botões CALL / ROUTE / SHARE | Row, Column, Icon, Text, Container |
| `exercicio_03_stack_positioned/` | Containers coloridos sobrepostos em pilha | Stack, Positioned, Container, Colors, Text |
| `exercicio_04_imagens_sizedbox/` | Duas imagens de tamanhos diferentes separadas por um SizedBox | Image, SizedBox, FittedBox |
| `exercicio_05_layout_tutorial/` | Tutorial de layout (Oeschinen Lake Campground) | Row, Column, Expanded, Image, ListView |

## Como executar

Cada projeto roda de forma independente. Entre na pasta do exercício e execute:

```bash
cd aula-02-exercicios-slides/exercicio_01_container_icon_text
flutter pub get
flutter run -d chrome
```

Os exercícios 4 e 5 usam imagens locais, guardadas na pasta `images/` de cada
projeto e declaradas em `assets:` no respectivo `pubspec.yaml`.
