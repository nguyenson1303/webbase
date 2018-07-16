export class AppConstant {
  // api url
  public static tokenApiUrl: string = "/api/token";
  public static profileApiUrl: string = "/api/account";
  public static menuApiUrl: string = "/api/adminmenu";
  public static listUserApiUrl: string = "/api/account/listuser";
  public static checkPermissionApiUrl: string = "/api/account/checkPermission";

  // const action on path
  public static viewAction: string = "view";
  public static addAction: string = "add";
  public static deleteAction: string = "del";
  public static editAction: string = "edit";

  // const Permission Code
  public static permissionAccessCode: number = 8;
  public static permissionDeniedCode: number = 3;

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
