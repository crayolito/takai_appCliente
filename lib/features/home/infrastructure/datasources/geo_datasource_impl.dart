import 'package:app_sig2024/features/home/domain/datasources/home_datasource.dart';
import 'package:app_sig2024/features/home/domain/entities/historial.dart';
import 'package:app_sig2024/features/home/domain/entities/licencia.dart';
import 'package:app_sig2024/features/home/domain/entities/metaMask.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

class HomeDatasourceImpl extends HomeDatasource {
  final dio = Dio();

  @override
  Future<List<Historial>> getDataHistorial(String apiKeyPublica) async {
    // TODO: implement getDataHistorial
    throw UnimplementedError();
  }

  @override
  Future<List<DataLicencia>> getDataLicencias(String apiKeyPublica) async {
    // TODO: implement getDataLicencias
    throw UnimplementedError();
  }

  @override
  Future<InfoMetaMask> getInfoMetaMask(String apiKeyPrivada) async {
    final httpClient = http.Client();
    var apiUrl =
        "https://eth-sepolia.g.alchemy.com/v2/cic5oYDCmkNc6gLo2R8YTjPuPw3ZvDNp"; // Reemplazar con tu API

    var ethClient = Web3Client(apiUrl, httpClient);
    final credentials = EthPrivateKey.fromHex(apiKeyPrivada);

    try {
      // Obtener la dirección asociada a las credenciales
      final address = credentials.address;

      // Obtener el balance de la dirección
      final balance = await ethClient.getBalance(address);
      final cantidadEth = balance.getValueInUnit(EtherUnit.ether).toDouble();

      // Obtener las cantidades en BOB y USD
      final cantidadBS = convertirEthABolivianos(cantidadEth);
      final cantidadUSB = convertirEthADolares(cantidadEth);

      // Crear y devolver una instancia de InfoMetaMask con la información obtenida
      return InfoMetaMask(
        addressPublica: address.hexEip55,
        addressPrivada: apiKeyPrivada,
        cantidadETH: cantidadEth.toString(),
        cantidadBS: cantidadBS.toString(),
        cantidadUSB: cantidadUSB.toString(),
      );
    } catch (e) {
      // Manejar errores
      print('Error: $e');
      throw Exception('Error al obtener la información de MetaMask');
    } finally {
      // Cerrar el cliente después de usarlo
      ethClient.dispose();
    }
  }

  double convertirEthABolivianos(double cantidadEth) {
    const tasaBolivianos = 24000.0; // Tasa de cambio aproximada de ETH a BOB
    return cantidadEth * tasaBolivianos;
  }

  double convertirEthADolares(double cantidadEth) {
    const tasaDolares = 3000.0; // Tasa de cambio aproximada de ETH a USD
    return cantidadEth * tasaDolares;
  }
}
