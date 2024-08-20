import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Importe o pacote Cupertino

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back), // Ícone de voltar
          onPressed: () {
            Navigator.pop(context); // Voltar para a tela anterior
          },
        ),
        title: Text(
          'Categorias',
          style: TextStyle(
            color: Colors.black, // Texto preto
            fontSize: 24, // Tamanho da fonte
            fontWeight: FontWeight.bold, // Texto em negrito
            fontFamily: 'Roboto', // Fonte personalizada (mude se necessário)
          ),
        ),
        backgroundColor: Colors.white38,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          CategoryTile('Anestésicos locais em odontologia'),
          CategoryTile('Biossegurança'),
          CategoryTile('Endodontia'),
          CategoryTile('Periodontia'),
          CategoryTile('Implantes dentários'),
          CategoryTile('Ortodontia'),
          CategoryTile('Odontopediatria'),
          CategoryTile('Estética dental'),
          CategoryTile('Periodontia'),
          CategoryTile('Implantes dentários'),
          CategoryTile('Ortodontia'),
          // Adicione mais categorias conforme necessário
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String categoryName;

  CategoryTile(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        categoryName,
        style: TextStyle(
          color: Colors.cyan, // Texto na cor azul ciano
          fontSize: 19, // Tamanho da fonte aumentado
          fontFamily: 'Roboto', // Fonte personalizada (mude se necessário)
        ),
      ),
      onTap: () {
        // Ação ao clicar na categoria
        // Você pode navegar para uma nova tela com produtos dessa categoria, por exemplo.
      },
    );
  }
}
