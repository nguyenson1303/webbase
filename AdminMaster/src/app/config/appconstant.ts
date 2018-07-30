export class AppConstant {
  // api url
  public static tokenApiUrl: string = "/api/token";
  public static profileApiUrl: string = "/api/account";
  public static menuApiUrl: string = "/api/adminmenu";
  public static listUserApiUrl: string = "/api/account/listuser";
  public static listUserPermissionApiUrl: string = "/api/account/listUserPermission";
  public static checkPermissionApiUrl: string = "/api/account/checkPermission";

  // user api
  public static deleteUserApiUrl: string = "/api/account";
  public static updateUserApiUrl: string = "/api/account";
  public static updateUserInforApiUrl: string = "/api/account/updateUserInfor";
  public static updateUserPermissionApiUrl: string = "/api/account/saveUserPermission";
  public static createUserApiUrl: string = "/api/account";
  public static getUserDetailApiUrl: string = "/api/account/getUserDetail";
  public static getUserProfileApiUrl: string = "/api/account";
  public static getUserInforDetailApiUrl: string = "/api/account/getUserInforDetail";
  public static validateUserApiUrl: string = "/api/account/validateUser";
  public static changePasswordApiUrl: string = "/api/account/changePassword";
  public static validateChangePasswordApiUrl: string = "/api/account/validateChangePassword";
  public static uploadApiUrl: string = "/api/upload";
  public static downloadApiUrl: string = "/api/download";

  // adminpage api
  public static listAdminPageApiUrl: string = "/api/adminpage/listUserPage";
  public static listAdminPageTreeApiUrl: string = "/api/adminpage/listUserPageTree";
  public static deleteAdminPageApiUrl: string = "/api/adminpage";
  public static updateAdminPageApiUrl: string = "/api/adminpage";
  public static createAdminPageApiUrl: string = "/api/adminpage";
  public static getAdminPageDetailApiUrl: string = "/api/adminpage";
  public static validateAdminPageApiUrl: string = "/api/adminpage/validateAdminPage";
  public static updateStatusAdminPageApiUrl: string = "/api/adminpage/updateStatusAdminPage";
  public static listCatalogApiUrl: string = "/api/adminCatalog";
  public static getCatalogDetailApiUrl: string = "/api/adminCatalog";
  public static deleteCatalogApiUrl: string = "/api/adminCatalog";
  public static updateStatusCatalogApiUrl: string = "/api/adminCatalog/updateStatusCatalog";

  // adminpageAction api
  public static listUserPageActionByPageIdApiUrl: string = "/api/adminpageaction/listUserPageAction";
  public static deleteAdminPageActionApiUrl: string = "/api/adminpageaction";
  public static updateAdminPageActionApiUrl: string = "/api/adminpageaction";
  public static createAdminPageActionApiUrl: string = "/api/adminpageaction";
  public static getAdminPageActionDetailApiUrl: string = "/api/adminpageaction";
  public static validateAdminPageActionApiUrl: string = "/api/adminpageaction/validateAdminPageAction";

  // const action on path
  public static viewAction: string = "view";
  public static addAction: string = "add";
  public static deleteAction: string = "del";
  public static editAction: string = "edit";

  // const result Code
  public static successCode: number = 1;
  public static failCode: number = 2;
  public static permissionDeniedCode: number = 3;
  public static notExistCode: number = 4;
  public static duplicateCode: number = 5;
  public static emptyCode: number = 6;
  public static notValidCode: number = 7;
  public static permissionAccessCode: number = 8;

  // const Permission Message
  public static successTitle: string = "Success";
  public static failTitle: string = "Fail";
  public static permissionDeniedTitle: string = "Permission Denied";
  public static notExistTitle: string = "Data not exist";
  public static duplicateTitle: string = "Data is duplicate";
  public static emptyTitle: string = "Data is empty";
  public static notValidTitle: string = "Data invalid";
  public static permissionAccessTitle: string = "OK";
  public static errorTitle: string = "Server error";
  public static confirmTitle: string = "Confirmation";
  public static confirmDeleteContent: string = "Bạn muốn xóa ";
  public static confirmChangeContent: string = "Bạn muốn thay đổi ";
  public static confirmDeleteAvatarContent: string = "Bạn muốn xóa ảnh đại diện ?";

  public static messcreateSuccess: string = "Tạo mới thành công ";
  public static messupdateSuccess: string = "Cập nhật thành công ";
  public static messCreateFail: string = "Tạo mới thất bại ";
  public static messUpdateFail: string = "Cập nhật thất bại ";

  // const keyword
  public static headerBearer: string = "Bearer ";
  public static applicationJsonType: string = "application/json";
  public static currentStorage: string = "CurrentStorage";
  public static currentProfile: string = "CurrentProfile";

  // message const
  public static messErrorCommon: string = "Server Error !";

  // const label
  public static profileLabel: string = "Profile";
  public static logoutLabel: string = "Log out";
  public static settingLabel: string = "Settings";

  // const number
  public static pageIndexDefault: number = 1;
  public static pageSizeDefault: number = 25;
  public static pageSizeMax: number = 100;
  public static numberZero: number = 0;
  public static numberOne: number = 1;
  public static numberNegativeOne: number = -1;

  // const string
  public static stringEmpty: string = "";
  public static paramsDefault: string = "?";
  public static spaceDefault: string = " ";

  // const boolean
  public static falseDefault: boolean = false;
  public static trueDefault: boolean = true;

  // const object local Storage
  public static objectUser: string = "objectUser";
  public static objectUserPermission: string = "objectUserPermission";
  public static objectAdminPage: string = "objectAdminPage";
  public static objectAdminPageAction: string = "objectAdminPageAction";
  public static isInProcess: string = "isInProcess";

  // const upload
  public static avatarUploadFolder: string = "uploads\\avatar\\";
  public static fileKey: string = "Files";
  public static filePath: string = "FilePath";
  public static fileOld: string = "FileOld";
  public static thumbnailSizeKey: string = "ThumbnailSize";
  public static thumbnailSizeValue: number = 150;

  // avatar default
  public static logoDefault: string
    = "data:image/png;base64,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" +
    "Y2qM7dwjUAAAAASUVORK5CYII=";
  public static avatarDefault: string
    = "data:image/png;base64,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" +
    "Afh/rJzd5Ww2OUsAAAAASUVORK5CYII=";
}
