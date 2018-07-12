export class AppConstant {
  // api url
  public static tokenApiUrl: string = "/api/token";
  public static profileApiUrl: string = "/api/account";
  public static menuApiUrl: string = "/api/adminmenu";
  public static listUserApiUrl: string = "/api/account/listuser";

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
