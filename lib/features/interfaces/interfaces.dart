import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTypeOptions {
  final String titulo;
  final MapType tipoMapa;
  final String imagen;
  final GestureTapCallback onTap;

  MapTypeOptions({
    required this.titulo,
    required this.tipoMapa,
    required this.imagen,
    required this.onTap,
  });
}

class Category {
  final String categoryTitle;
  final String iconLink;
  final String rutaDireccion;

  Category({
    required this.rutaDireccion,
    required this.categoryTitle,
    required this.iconLink,
  });
}

List<Category> categoriesList = [
  Category(
      categoryTitle: 'Funcionamiento',
      iconLink: "assets/actividadesEconomicas.png",
      rutaDireccion: "/search"),
  Category(
      categoryTitle: 'Sanitaria',
      iconLink: "assets/sanitaria.png",
      rutaDireccion: "/search"),
  Category(
      categoryTitle: 'Ambiental',
      iconLink: "assets/ambiental.png",
      rutaDireccion: "/search"),
  Category(
      categoryTitle: 'Publicidad',
      iconLink: "assets/publicidad.png",
      rutaDireccion: "/search"),
  Category(
      categoryTitle: 'Actividades Económicas',
      iconLink: 'assets/actividadesEconomicas.png',
      rutaDireccion: "/search"),
  Category(
      categoryTitle: 'Uso de Suelo',
      iconLink: 'assets/usoSuelo.png',
      rutaDireccion: "/search"),
  Category(
      categoryTitle: 'Espectáculos Públicos',
      iconLink: 'assets/espectaculoPublicos.png',
      rutaDireccion: "/search"),
  Category(
      categoryTitle: 'Alcohol',
      iconLink: 'assets/Alcohol.png',
      rutaDireccion: "/search"),
];


