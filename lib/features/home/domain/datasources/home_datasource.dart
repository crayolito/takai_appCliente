import 'package:app_sig2024/features/home/domain/entities/historial.dart';
import 'package:app_sig2024/features/home/domain/entities/licencia.dart';
import 'package:app_sig2024/features/home/domain/entities/metaMask.dart';

abstract class HomeDatasource {
  Future<InfoMetaMask> getInfoMetaMask(String apiKeyPrivada);
  Future<List<DataLicencia>> getDataLicencias(String apiKeyPublica);
  Future<List<Historial>> getDataHistorial(String apiKeyPublica);
}
