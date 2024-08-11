import 'package:app_sig2024/features/geolocalizacion/presentation/screens/searchHistorial.screen.dart';
import 'package:app_sig2024/features/geolocalizacion/presentation/screens/searchLicencia.screen.dart';
import 'package:app_sig2024/features/home/presentation/screens/categoriasLicencias.screen.dart';
import 'package:app_sig2024/features/home/presentation/screens/home.screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/searchLicencia',
      builder: (context, state) => const SearchLicenciaScreen()),
  GoRoute(
      path: '/searchHistorial',
      builder: (context, state) => const SearchHistorialScreen()),
  GoRoute(
      path: '/categoriasLicencias',
      builder: (context, state) => const CategoriaLicenciasScreen()),
]);
