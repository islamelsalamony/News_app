import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:novanews/features/home/data/model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  final supabase = Supabase.instance.client;
  Future<void> getAllProduct() async {
    emit(ProductLoading());
    try {
      final response = await supabase
          .from("products")
          .select()
          .order("created_at", ascending: false);
      final products = response
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
      emit(ProductSuccess(products: products));
    } catch (e) {
      emit(ProductError(error: e.toString()));
    }
  }

  addProduct({
    required String title,
    required String image,
    required String details,
    required String category,
  }) async {
    try {
      emit(ProductLoading());
      await supabase.from("products").insert({
        "Title": title,
        "Category": category,
        "Details": details,
        "Image": image,
      });
      emit(AddProductSuccess());
      await getAllProduct();
    } catch (e) {
      emit(ProductError(error: e.toString()));
    }
  }
}
