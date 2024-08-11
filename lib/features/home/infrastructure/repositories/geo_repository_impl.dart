import 'package:app_sig2024/features/home/domain/datasources/home_datasource.dart';
import 'package:app_sig2024/features/home/domain/entities/historial.dart';
import 'package:app_sig2024/features/home/domain/entities/licencia.dart';
import 'package:app_sig2024/features/home/domain/entities/metaMask.dart';
import 'package:app_sig2024/features/home/domain/repositories/geo_repository.dart';
import 'package:app_sig2024/features/home/infrastructure/datasources/geo_datasource_impl.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDatasource datasource;

  HomeRepositoryImpl({HomeDatasource? datasource})
      : datasource = datasource ?? HomeDatasourceImpl();

  @override
  Future<List<Historial>> getDataHistorial(String apiKeyPublica) async {
    return await datasource.getDataHistorial(apiKeyPublica);
  }

  @override
  Future<List<DataLicencia>> getDataLicencias(String apiKeyPublica) async {
    return await datasource.getDataLicencias(apiKeyPublica);
  }

  @override
  Future<InfoMetaMask> getInfoMetaMask(String apiKeyPrivada) async {
    return await datasource.getInfoMetaMask(apiKeyPrivada);
  }
}
