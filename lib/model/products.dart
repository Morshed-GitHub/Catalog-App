import 'dart:convert';

class Item {
  // "Singleton" -> Like "static", only one instance/ object will shared among all

  static final _Item = Item._();

  Item._(); // Constructor

  factory Item() => _Item;

  // 'static' : In order to use directly
  // 'late' : Initialize later

  // Error: 'lateInitialization' error. This indicates 'late' data type must be
  // initilized before it's use.
  // static late List<Products> items;

  // To solve this error, we have to create the list empty then add....
  static List<Products> items = [];

  // Get items by "id"
  Products getByID(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // Get items by "position"
  Products getByPos(int pos) => items[pos];
}

class Products {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Products(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  // Custom Created
  // // factory: In order to initialize final data members after logic building part or choose
  // // which one will be invoked(called) between two constructors
  // factory Products.fromMap(Map<String, dynamic> map) {
  //   // dynamic: Could be any data type (Not fixed)
  //   return Products(
  //       id: map["id"],
  //       name: map["name"],
  //       desc: map["desc"],
  //       price: map["price"],
  //       color: map["color"],
  //       image: map["image"]);
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": id,
  //     "name": name,
  //     "desc": desc,
  //     "price": price,
  //     "color": color,
  //     "image": image,
  //   };
  // }

  // "Dart Data Class Generator" Created
  Products copyWith({
    int? id,
    String? name,
    String? desc,
    int? price,
    String? color,
    String? image,
  }) {
    return Products(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      id: map["id"] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as int,
      color: map['color'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Products(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Products other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
