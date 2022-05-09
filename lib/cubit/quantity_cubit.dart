
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_guid/cubit/quantity_repo.dart';
import 'package:metro_guid/cubit/state.dart';

class QuantityCubit extends Cubit<QuantityState>{
  QuantityCubit() : super(QuantityState(1));
  QuantityRepo _quantityRepo = QuantityRepo();
  increaseQuantity (){
    int quantity = _quantityRepo.increaseQuantity();
    emit(QuantityState(quantity));
  }
  decreaseQuantity (){
    int quantity = _quantityRepo.decreaseQuantity();

    emit(QuantityState(quantity));
  }

}
class QuantityState {
  int quantity = 1 ;
  QuantityState(this.quantity);
}