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

  function VariantToString(const V: variant): string;
  public
  {Public Declarations}
  constructor Create(ABaseDN: string);
  function GetLoggedInUser: TUserInfoModel;


end;

implementation

uses
  ipwldap, System.SysUtils, ComObj, ActiveX, Winapi.Windows, WindowsLoginRT.Constants, Variants;


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
      UserInfo.sAMAccountName := VariantToString(RecordSet.Fields[SAMACCOUNT].Value);
      UserInfo.EMail := VariantToString(RecordSet.Fields[MAIL].Value);
      UserInfo.DisplayName := VariantToString(RecordSet.Fields[DISPLAYNAME].Value);
      UserInfo.UserAccountControl := VariantToString(RecordSet.Fields[USER_ACCOUNT_CTRL].Value);
      UserInfo.Description := VariantToString(RecordSet.Fields[DESCRIPTION].Value);
      UserInfo.DistinguishedName := VariantToString(RecordSet.Fields[DISTINGUISHED_NAME].Value);
      UserInfo.ObjectSid := VariantToString(RecordSet.Fields[OBJECT_SID].Value);

    end
    else
    begin
      raise Exception.Create(USER_NOTFOUND);
    end;
  finally
    CoUninitialize;
  end;
end;

//alcuni attributi di active directory sono composti da multi-valore,
//questa funzione converte qualsiasi attributo in un singolo valore di tipo stringa
function TLocalDBLogin.VariantToString(const V: variant): string;
 var
    I: Integer;
  begin
    Result := '';
    if VarIsArray(V) then
    begin
      for I := VarArrayLowBound(V, 1) to VarArrayHighBound(V, 1) do
      begin
        if Result <> '' then
          Result := Result;
        Result := Result + VarToStr(V[I]);
      end;
    end
    else
    begin
      Result := VarToStr(V);
    end;
  end;



end.
