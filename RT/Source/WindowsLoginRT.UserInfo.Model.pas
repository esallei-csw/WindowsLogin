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
    FDescription: string;
    FDistinguishedName: string;
    FObjectSid: string;


  public
    constructor Create;
    destructor Destroy; override;
    property sAMAccountName: string read FsAMAccountName write FsAMAccountName;
    property EMail: string read FEmail write FEmail;
    property DisplayName: string read FDisplayName write FDisplayName;
    property UserAccountControl: string read FUserAccountControl write FUserAccountControl;
    property Description: string read FDescription write FDescription;
    property DistinguishedName: string read FDistinguishedName write FDistinguishedName;
    property ObjectSid: string read FObjectSid write FObjectSid;

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
  FDescription := EmptyStr;
  FDistinguishedName := EmptyStr;
  FObjectSid := EmptyStr;
end;

destructor TUserInfoModel.Destroy;
begin
  inherited;
end;


end.
