import 'item.dart';

class ItemsModel {
  List<OrderItemModel>? items;

  ItemsModel({this.items});

  factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
