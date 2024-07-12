unit WindowsLoginRT.UserInfo.Model;

interface

uses
  System.Classes, System.Generics.Collections;

type
  TUserInfoModel = class
  private
    FsAMAccountName: string;
    FDisplayName: string;
    FEmail: string;
    FUserAccountControl: string;


  public
    constructor Create;
    destructor Destroy; override;
    property sAMAccountName: string read FsAMAccountName write FsAMAccountName;
    property EMail: string read FEmail write FEmail;
    property DisplayName: string read FDisplayName write FDisplayName;
    property UserAccountControl: string read FUserAccountControl write FUserAccountControl;

  end;

implementation

{ TSSOUserInformationModel }
uses
  System.SysUtils;

constructor TUserInfoModel.Create;
begin
  inherited;
  FsAMAccountName := EmptyStr;
  FDisplayName := EmptyStr;
  FEmail := EmptyStr;
  FUserAccountControl := EmptyStr;
end;

destructor TUserInfoModel.Destroy;
begin
  inherited;
end;


end.
