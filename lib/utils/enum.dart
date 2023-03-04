import 'package:json_annotation/json_annotation.dart';

enum PicklistStatus {
  @JsonValue("created")
  created,

  @JsonValue("paused")
  paused,

  @JsonValue("picking")
  picking,

  @JsonValue("hold")
  hold,

  @JsonValue("cancelled")
  cancelled,

  @JsonValue("picked")
  picked,

  @JsonValue("packed")
  packed,

  @JsonValue("accepted")
  accepted,

  @JsonValue("resolved")
  resolved,
}

List<String> platforms = ["Landers", "Snapmart"];

List<String> orderList = [
  'Food',
  'BEVERAGES',
  'Food Cupboard',
  'Non-Food',
  'HARDLINES',
  'SOFTLINES',
  'SUNDRIES',
  'Pet',
  'WINE & LIQUOR',
  'WINES & LIQUOR',
  'Wines and Liquors',
  'Bakery',
  'HBA',
  'Produce',
  'Chilled',
  'Frozen',
  'Frozen & Chilled',
  'Fresh',
  'Rotisserie',
  'OTHER BUSINESS',
  'N/A',
  'NULL',
  'MEMBERSHIP',
  'PLASTIC BAG',
].map((order) => order.toLowerCase()).toList();

enum QuantityType { increase, decrease }

enum ConfirmType {
  resetPicklist,
  pausePicklist,
}
