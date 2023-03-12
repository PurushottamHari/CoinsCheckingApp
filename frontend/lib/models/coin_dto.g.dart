// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDTO _$CoinDTOFromJson(Map<String, dynamic> json) => CoinDTO(
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      price: (json['price'] as num).toDouble(),
      cmcRank: json['cmcRank'] as int,
      percentChange24h: (json['percentChange24h'] as num).toDouble(),
    );

Map<String, dynamic> _$CoinDTOToJson(CoinDTO instance) => <String, dynamic>{
      'name': instance.name,
      'symbol': instance.symbol,
      'price': instance.price,
      'cmcRank': instance.cmcRank,
      'percentChange24h': instance.percentChange24h,
    };
