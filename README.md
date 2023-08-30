# Web App RickAndMorty 

Este web app foi desenvolvido em Flutter e consome a API REST do Rick and Morty para gerar episódios aleatórios com base no número de personagens e locais selecionados pelo usuário. 
Além disso, o web app oferece acesso a informações adicionais por meio de um menu lateral (drawer).

## Conteúdo

- [Requisitos](#requisitos)
- [Instalação](#instalação)
- [Uso](#uso)
  - [Página Principal](#página-principal)
  - [Menu Lateral](#menu-lateral)
    - [Histórico de Episódios](#histórico-de-episódios)
    - [Personagens Disponíveis](#personagens-disponíveis)
    - [Locais Disponíveis](#locais-disponíveis)

## Requisitos

- Flutter SDK instalado no sistema.
- Conexão com a internet para acessar a API REST do Rick and Morty.

## Instalação

1. Clone este repositório para o seu sistema local.
```bash
git clone https://github.com/VictorLaragnoit/RickAndMortyApp.git
```
2. Navegue até o diretório do projeto usando o terminal.
3. Execute o seguinte comando para instalar as dependências:

```bash
flutter pub get
flutter run
```

## Uso

### Página Principal

A página principal do web app oferece a funcionalidade principal de gerar um novo episódio aleatório. O usuário deve especificar o número de personagens e o numero de locais para o episódio. Uma vez preenchidos os campos, o usuário deve clicar no botão "Gerar Episódio" para ver o resultado.

### Menu Lateral

No canto superior esquerdo da página, há um ícone de três risquinhos. Clicar nesse ícone ou deslizar o dedo da parte esquerda lateral da tela para a direita, com isso abrirá o menu lateral, que oferece acesso rápido a informações importantes do app e contém três itens que direcionam para diferentes páginas de informações.

#### Histórico de Episódios

Esta página exibe um histórico dos episódios gerados anteriormente. Caso queira ver mais detalhes do episodio, clique em cima do mesmo e ele abrirá a pagina de especificações daquele episodio em especifico.

#### Personagens Disponíveis

Nesta página, o usuário pode explorar a lista de personagens disponíveis na API do Rick and Morty. Informações como nome, status, espécie e imagem do personagem estão disponíveis.

#### Locais Disponíveis

A página de locais disponíveis oferece uma lista dos locais presentes no universo do Rick and Morty. Detalhes como nome, tipo e dimensão do local são fornecidos.

---
Essa breve documentação devera suprir todas as necessidades para compreender o aplicativo e sua estrutura basica. caso tenha duvidas, não deixe de perguntar. 
Estou a disposição, 

Victor Laragnoit Costa
victor.laragnoit@gmail.com
