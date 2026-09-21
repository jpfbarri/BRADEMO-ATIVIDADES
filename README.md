# BRADEMO - Atividades e Exercícios

Repositório destinado ao envio das atividades da disciplina BRADEMO (IFSP).

## Estrutura

- `aula-02-flutter/`: Exercícios de fixação de Flutter (Widgets básicos, Layouts, MediaQuery e Componentes).
- `aula-02-exercicios-slides/`: Exercícios propostos ao final dos slides da Aula 2 - Introdução ao Flutter.

## Aula 2 - Exercícios dos slides

| Arquivo | Exercício | Widgets estudados |
| --- | --- | --- |
| `exercicio_01_container_icon_text.dart` | Reproduzir a interface "Flutter is Fun!" | Container, Colors, Icon, Text |
| `exercicio_02_barra_de_botoes.dart` | Barra de botões CALL / ROUTE / SHARE | Row, Column, Icon, Text, Container |
| `exercicio_03_stack_positioned.dart` | Containers coloridos sobrepostos em pilha | Stack, Positioned, Container, Colors, Text |
| `exercicio_04_imagens_sizedbox.dart` | Duas imagens de tamanhos diferentes separadas por um SizedBox | Image, SizedBox, FittedBox |
| `exercicio_05_layout_tutorial.dart` | Tutorial de layout (Oeschinen Lake Campground) | Row, Column, Expanded, Image, ListView |

## Como executar

Cada arquivo `.dart` é autocontido e possui o seu próprio `main()`. Com o
Flutter instalado, execute a partir da raiz do repositório:

```bash
flutter pub get
flutter run -t aula-02-exercicios-slides/exercicio_01_container_icon_text.dart
```

> Os exercícios 4 e 5 usam imagens locais da pasta `images/`, declaradas em
> `assets:` no `pubspec.yaml`. Não é necessário estar conectado.

A pasta `web/` (e `lib/`, `test/`, `.metadata`) é gerada pelo `flutter create`
apenas para permitir a execução local e está no `.gitignore`. Se o repositório
for clonado do zero, rode `flutter create --platforms=web .` antes do
`flutter run`.
