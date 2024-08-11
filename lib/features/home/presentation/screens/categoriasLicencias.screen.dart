import 'package:animate_do/animate_do.dart';
import 'package:app_sig2024/config/constant/paletaColores.constant.dart';
import 'package:app_sig2024/features/interfaces/interfaces.dart';
import 'package:app_sig2024/main.dart';
import 'package:flutter/material.dart';

class CategoriaLicenciasScreen extends StatelessWidget {
  const CategoriaLicenciasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/categoriasScreen.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          children: [
            // CATEGORIAS DE OFRECE DISTRITO 7
            CategoriesContainer(),
            // TITULO DE PRESENTACION SCREEN
            PresentationContainer(),
          ],
        ),
      ),
    );
  }
}

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
        top: size.height * 0.33,
        left: 0,
        right: 0,
        child: SizedBox(
          width: size.width,
          height: size.height * 0.665,
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: categoriesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                final category = categoriesList[index];
                return FadeInLeft(child: ItemCategory(category: category));
              }),
        ));
  }
}

class PresentationContainer extends StatelessWidget {
  const PresentationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    BoxDecoration decoration = BoxDecoration(
        color: kTerciaryColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: kPrimaryColor, width: 4));
    return Positioned(
        top: size.height * 0.27,
        left: 0,
        right: 0,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          width: size.width,
          height: size.height * 0.075,
          decoration: decoration,
          child: Text(
            "LICENCIAS",
            style: estilosText!.tituloVentanaCategorias,
          ),
        ));
  }
}

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    BoxDecoration decoration = BoxDecoration(
      color: kTerciaryColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: kPrimaryColor, width: 4),
    );

    void onTap() async {}

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.07, vertical: size.height * 0.02),
        padding: const EdgeInsets.all(10),
        decoration: decoration,
        child: Column(
          children: [
            Container(
              width: size.width * 0.2,
              height: size.height * 0.08,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(category.iconLink)),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              textAlign: TextAlign.center,
              category.categoryTitle,
              style: estilosText!.subtituloVentanaCategorias,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
