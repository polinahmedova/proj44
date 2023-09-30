import 'package:dio/dio.dart';
import 'models/prodResp/prodResp.dart';
import 'models/product/product.dart';

void main(List<String> arguments) async {
  Dio client = Dio();
  String url = 'https://dummyjson.com/products';
  Response<dynamic> response = await client.get(url); 
  ProdResp data = ProdResp.fromJson(response.data);
  List<Product> productMassive = data.products;
  List<Product> resultMassive = [];
  List <String> brandList = ["OPPO"];
  String textResult ="Техника $brand:";
  for (var name in brandList) {
    textResult += '$name;';
  }
  
  resultMassive =
     productMassive.where((el) => el.brand == "Apple").toList();
  for (var element in resultMassive) {
    textResult += '${element.title} за \$${element.price}';
  }
  print(textResult);
}
bool filterCondition(Product product) {
  return product.brand == "Apple";
}