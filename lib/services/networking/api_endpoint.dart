const baseUrlDev = "https://api.staging.snapmart.ph/v1/";
const baseUrlProd = "https://api.snapmart.ph/v1/";

const baseOms = "https://oms-api.landers.ph";
const basePortal = "https://portal-api.landers.ph";

class UserApi {
  static const users = "/users";
  static const authenticate = "$users/authenticate";
  static const me = "$users/me";
  static const logout = "$users/logout";
  static const sendTokens = "/nms/tokens";
}

class PicklistApi {
  static const pickings = "/pickings";
  static const picklists = "$pickings/picklists";
  static const picklistById = "$picklists/{id}";
  static const picklistItems = "$picklistById/items";
  static const picklistItemsV2 = "$picklists/itemsV2";
  static const reset = "$picklists/items/{id}/reset";

  static const picklistStatuses = "$picklistById/statuses";
  static const picklistBulkStatuses = "$picklistById/bulk-statuses";

  static const scanRecords = "/pickings/order-items/scanned-records";
  static const scanRecordById = "$scanRecords/{id}";

  static const notifications = "$pickings/notifications";

  static const approval = "$pickings/approval-code/verify";
  static const getApprovalCode = "$pickings/approval-code/renew";
}
