unit WindowsLoginRT.Logic;

interface

uses
  WindowsLoginRT.UserInfo.Model;

type
  TLocalDBLogin = class
  private
  {Private Declarations}
  FBaseDN: string;
  FUserInfo: TUserInfoModel;

  function GetUserInfo: TUserInfoModel;
  property UserInfo: TUserInfoModel read GetUserInfo write FUserInfo;

  function GetLocalUserName: string;
  procedure SearchLoggedInUser;
  public
  {Public Declarations}
  constructor Create(ABaseDN: string);
  function GetLoggedInUser: TUserInfoModel;


end;

implementation

uses
  ipwldap, System.SysUtils, ComObj, ActiveX, Winapi.Windows, WindowsLoginRT.Constants;


{ TLocalDBLogin }

constructor TLocalDBLogin.Create(ABaseDN: string);
begin
  FBaseDN := ABaseDN;
end;

function TLocalDBLogin.GetLocalUserName: string;
var
  LUserName: string;
  LUserNameLen: DWORD;
begin
  LUserNameLen := 256;
  SetLength(LUserName, LUserNameLen);
  if GetUserName(PChar(LUserName), LUserNameLen) then
    SetLength(LUserName, LUserNameLen - 1)
  else
    RaiseLastOSError;
  Result := LUserName;
end;

function TLocalDBLogin.GetLoggedInUser: TUserInfoModel;
begin
  if not Assigned(FUserInfo) then
    SearchLoggedInUser;
  Result := UserInfo;
end;

function TLocalDBLogin.GetUserInfo: TUserInfoModel;
begin
  if not Assigned(FUserInfo) then
    FUserInfo := TUserInfoModel.Create;
  Result := FUserInfo;
end;

procedure TLocalDBLogin.SearchLoggedInUser;
var
  Filter: string;
  Connection, Command, RecordSet: OLEVariant;
begin
  CoInitialize(nil);
  try

    // Imposta il DN di base e il filtro di ricerca
    Filter := Format(SAMACCOUNT_FORMAT, [GetLocalUserName]);

    // Crea la connessione LDAP
    Connection := CreateOleObject(AD_CONNECTION);
    Connection.Provider := AD_OBJ;
    Connection.Open(AD_PROVIDER);

    // Crea il comando LDAP
    Command := CreateOleObject(ADOBD_COMMAND);
    Command.ActiveConnection := Connection;
    Command.CommandText := Format(COMMAND_STRING, [FBaseDN, Filter]);

    // Esegui la query
    RecordSet := Command.Execute;

    // Verifica i risultati
    if not RecordSet.EOF then
    begin
      UserInfo.sAMAccountName := RecordSet.Fields[SAMACCOUNT].Value;
      UserInfo.EMail := RecordSet.Fields[MAIL].Value;
      UserInfo.DisplayName := RecordSet.Fields[DISPLAYNAME].Value;
      UserInfo.UserAccountControl := RecordSet.Fields[USER_ACCOUNT_CTRL].Value;
    end
    else
    begin
      raise Exception.Create(USER_NOTFOUND);
    end;
  finally
    CoUninitialize;
  end;
end;

end.
