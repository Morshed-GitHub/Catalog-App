import 'package:test_project/core/store.dart';
import 'package:test_project/model/products.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // "Singleton" -> Like "static", only one instance/object will be created from this class,
  // which will be shared among all

  static final _CartModel = CartModel._internal();

  CartModel._internal(); // Constructor

  factory CartModel() => _CartModel;

  // Item Field
  late Item _item; // By using '_', we create private data member

  // Collection of IDs - Store Ids of each item
  final List<int> _ItemIDs = [];

/*
Why we use getter setter?
Ans: Three Reasons.
  (i) Clean Code. Better Readability.
  (ii) Private Data Member's Can't Accessed Directly, But Can Be Accessed By Getter & Setter Method
  (iii) In Order To Deny Wrong Input Data. Ex- Negative Number. Also Multiple Conditions Can Be Added
*/

  // Getter (Don't contain parameter's, that's why no -> ())
  Item get item => _item;

  // Setter
  set item(Item newItem) {
    // assert(newItem != null); // condition
    _item = newItem;
  }

  // Get Items in the Cart
  List<Products> get items => _ItemIDs.map((id) => _item.getByID(id)).toList();

  // Get Total Price  // List.fold(InitialValue, (previousValue, element) => (previousValue + element.property));
  num get totalPrice => items.fold(
      0, (previousValue, element) => (previousValue + element.price));

  // Add Item (Replaced By AddMutation)
  // void add(Products item) {
  //   _ItemIDs.add(item.id);
  // }

  // Remove Item (Replaced By RemoveMutation)
  // void remove(Products item) {
  //   _ItemIDs.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Products item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._ItemIDs.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Products item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._ItemIDs.remove(item.id);
  }
}
