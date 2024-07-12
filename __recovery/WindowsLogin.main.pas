unit WindowsLogin.main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, WindowsLoginRT.Logic;

type
  TfrmWindowsLogin = class(TForm)
    btnLogin: TButton;
    lblUserName: TLabel;
    lblMail: TLabel;
    lblSAMAccountName: TLabel;
    lblUserAccountControl: TLabel;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
    FLocalDBLogin : TLocalDBLogin;

    function GetLocalDBLogin: TLocalDBLogin;
    property LocalDBLogin: TLocalDBLogin read GetLocalDBLogin write FLocalDBLogin;
  public
    { Public declarations }
  end;

var
  frmWindowsLogin: TfrmWindowsLogin;

implementation

uses
  WindowsLoginRT.UserInfo.Model;

{$R *.dfm}

procedure TfrmWindowsLogin.btnLoginClick(Sender: TObject);
var
  LUserInfo: TUserInfoModel;
begin
  LUserInfo := TUserInfoModel.Create;
  try
    LUserInfo := LocalDBLogin.GetLoggedInUser;
    lblUserName.Caption := LUserInfo.DisplayName;
    lblMail.Caption := LUserInfo.EMail;
    lblSAMAccountName.Caption := LUserInfo.sAMAccountName;
    lblUserAccountControl.Caption := LUserInfo.UserAccountControl;
  finally
    LUserInfo.Free;
  end;
end;

function TfrmWindowsLogin.GetLocalDBLogin: TLocalDBLogin;
begin
  if not Assigned(FLocalDBLogin) then
    FLocalDBLogin := TLocalDBLogin.Create('DC=cswdc,DC=local');
  Result := FLocalDBLogin;
end;

end.
