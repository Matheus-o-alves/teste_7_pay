import 'package:teste_7_pay/src/data/models/address_model.dart';

abstract class AdressRequest {
  Future<List<AdressModel>> fetchAdress(String uf, String bairro, String log);
}
