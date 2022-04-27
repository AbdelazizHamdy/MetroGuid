class QuantityRepo {
  int quantity  = 1;
  int increaseQuantity(){
    return ++quantity;
  }
  int decreaseQuantity(){
    return --quantity;
  }
}