import 'dart:convert';

import 'package:teste_7_pay/src/data/models/address_model.dart';

import '../../domain/usecases/adress_request.dart';

import 'package:http/http.dart' as http;

class RemoteAdress extends AdressRequest {
  @override
  Future<List<AdressModel>> fetchAdress(
      String uf, String bairro, String log) async {
    try {
      final response = await http
          .get(Uri.parse('https://viacep.com.br/ws/$uf/$bairro/$log/json/'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return List<AdressModel>.from(
            jsonData.map((product) => AdressModel.fromJson(product)));
      } else {
        throw Exception(
            'Erro ao buscar endereço. Código de resposta: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar endereço: $e');
    }
  }
}
