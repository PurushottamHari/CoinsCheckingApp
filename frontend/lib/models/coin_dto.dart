// external
import 'package:json_annotation/json_annotation.dart';

part 'coin_dto.g.dart';

@JsonSerializable()
class CoinDTO {
  String name;
  String symbol;
  double price;
  int cmcRank;
  double percentChange24h;

  CoinDTO({required this.name, required this.symbol, required this.price, required this.cmcRank, required this.percentChange24h});

  factory CoinDTO.fromJson(Map<String,dynamic> data) => _$CoinDTOFromJson(data);

  Map<String,dynamic> toJson() => _$CoinDTOToJson(this);
}