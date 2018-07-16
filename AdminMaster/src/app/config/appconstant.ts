export class AppConstant {
  // api url
  public static tokenApiUrl: string = "/api/token";
  public static profileApiUrl: string = "/api/account";
  public static menuApiUrl: string = "/api/adminmenu";
  public static listUserApiUrl: string = "/api/account/listuser";
  public static checkPermissionApiUrl: string = "/api/account/checkPermission";
  public static deleteUserApiUrl: string = "/api/account";

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
  public static pageSizeDefault: number = 30;
}
