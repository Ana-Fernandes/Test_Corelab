## Descrição

O **Product Search App** é um aplicativo Flutter que permite aos usuários buscar e visualizar produtos. A aplicação exibe uma lista de produtos com descrições, preços e imagens. Os usuários podem buscar produtos por descrição ou categoria. Se não houver resultados, uma mensagem informativa será exibida.

## Funcionalidades

- **Busca de Produtos**: Os usuários podem procurar produtos por descrição ou categoria.
- **Visualização de Produtos**: A lista de produtos é exibida com imagem, descrição e preço.
- **Mensagem de Ausência de Resultados**: Exibe uma imagem e mensagem quando nenhum resultado é encontrado.
- **Navegação**: O app possui uma barra de navegação inferior para acesso rápido às principais seções.

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento de aplicativos móveis.
- **Dart**: Linguagem de programação usada pelo Flutter.

## Estrutura do Projeto

- **lib**: Contém o código-fonte do aplicativo.
    - **models/product.dart**: Definição do modelo de produto.
    - **screens/product_search_screen.dart**: Tela principal de busca de produtos.
    - **screens/category_screen.dart**: Tela de categorias.
- **assets**: Contém as imagens usadas no aplicativo.
    - **images/notfound.png**: Imagem exibida quando nenhum resultado é encontrado.
    - **images/product1.png**: Imagem do produto 1.
    - **images/product2.png**: Imagem do produto 2.