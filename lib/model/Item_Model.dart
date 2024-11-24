
class ItemModel {
final String productId, productName, productType,productImage;
final double unitPrice;
final String? productDescription;
int totalQuantity;
ItemModel({
required this.productId,
required this.productName,
required this.productDescription,
required this.productType,
required this.productImage,
required this.unitPrice,
required this.totalQuantity
});
}
