class OrderIdEntity {
  int? id;
  int? amountCents;
  dynamic shippingData;
  String? currency;

  OrderIdEntity({
    this.id,
    this.amountCents,
    this.shippingData,
    this.currency,
  });
}
