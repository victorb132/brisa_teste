# 📱 Flutter Hive API Example

Este projeto é um exemplo de aplicativo Flutter que consome uma API REST, exibe os dados em uma lista e os armazena localmente usando **Hive** para cache. Ele também inclui testes unitários para garantir a confiabilidade da lógica de negócios.

## 📌 Recursos

- 🔗 Consumo da API `https://jsonplaceholder.typicode.com/posts`
- 📦 Armazenamento de dados localmente usando **Hive**
- 🔄 Atualização manual dos dados

## 🚀 Tecnologias Utilizadas

- Flutter
- Hive (armazenamento local)
- HTTP (requisições à API)

## 📂 Estrutura do Projeto

```
/lib
  /src
    /controllers
      posts_controller.dart  # Lógica de negócios
    /models
      post_models.dart       # Modelo de dados
    /screens
      posts_screen.dart      # Tela que exibe os posts
main.dart             # Ponto de entrada do app
```

## 🛠️ Como Clonar e Executar o Projeto

### 1️⃣ Clone o repositório

```sh
git clone https://github.com/victorb132/brisa_teste.git
cd brisa_teste
```

### 2️⃣ Instale as dependências

```sh
flutter pub get
```

### 3️⃣ Execute o aplicativo

```sh
flutter run
```

### 4️⃣ Execute os testes

```sh
flutter test
```

---

**Desenvolvido com ❤️ por [Victor Rodrigues Novais](https://github.com/victorb132)**
