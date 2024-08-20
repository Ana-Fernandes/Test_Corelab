import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Importe o pacote Cupertino
import '../models/product.dart';
import 'category_screen.dart'; // Importe a tela de categorias

class ProductSearchScreen extends StatefulWidget {
  @override
  _ProductSearchScreenState createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  List<Product> _products = [
    Product(
      description: 'Condicionado Ácido Fósforico 36% - AllPrime',
      price: 10.0,
      category: 'Categoria A',
      imageUrl: 'assets/images/product1.png',
    ),
    Product(
      description: 'Condicionado Ácido Fósforico 36% - AllPrime',
      price: 10.0,
      category: 'Categoria A',
      imageUrl: 'assets/images/product1.png',
    ),
    Product(
      description: 'Condicionado Ácido Fósforico 36% - AllPrime',
      price: 20.0,
      category: 'Categoria B',
      imageUrl: 'assets/images/product2.png',
    ),
    Product(
      description: 'Mascara Branca - AllPrime',
      price: 10.0,
      category: 'Categoria A',
      imageUrl: 'assets/images/product1.png',
    ),
    // Adicione mais produtos mockados aqui
  ];

  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _products;
  }

  void _filterProducts(String query) {
    final filtered = _products.where((product) {
      final descriptionLower = product.description.toLowerCase();
      final categoryLower = product.category.toLowerCase();
      final searchLower = query.toLowerCase();

      return descriptionLower.contains(searchLower) ||
          categoryLower.contains(searchLower);
    }).toList();

    setState(() {
      _filteredProducts = filtered;
    });
  }

  void _onBottomNavBarItemTapped(int index) {
    switch (index) {
      case 0:
      // Navegar para a tela inicial (Home)
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
      // Navegar para a tela de categorias
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryScreen()),
        );
        break;
      case 2:
      // Navegar para a tela de anúncio
        Navigator.pushNamed(context, '/advertise');
        break;
      case 3:
      // Navegar para a tela de favoritos
        Navigator.pushNamed(context, '/favorites');
        break;
      case 4:
      // Navegar para a tela de perfil
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Cor de fundo cinza
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        toolbarHeight: 80,
        title: Container(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Buscar...',
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Icon(CupertinoIcons.search, color: Colors.cyan), // Atualizado para Cupertino
            ),
            onChanged: _filterProducts,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: _filteredProducts.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100), // Espaço acima da image
              Image.asset(
                'assets/images/notfound.png', // Imagem de ausência de resultados
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                'Resultado não encontrado',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Não encontramos nenhum resultado \n parecido.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
            : Column(
          children: _filteredProducts.map((product) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: Colors.white,
              child: ListTile(
                leading: Image.asset(
                  product.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text(product.description),
                    SizedBox(height: 8),
                    Text(
                      'R\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Em até 12x de R\$ 290',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'NOVO',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Navegar para a página de detalhes do produto
                },
              ),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomNavBarItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2),
            label: 'Categoria',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled),
            label: 'Anunciar',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
