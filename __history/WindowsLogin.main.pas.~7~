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
    lblDescription: TLabel;
    edtDominio: TEdit;
    lblDomainName: TLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FLocalDBLogin : TLocalDBLogin;
    LoggedIn: boolean;

    function GetLocalDBLogin: TLocalDBLogin;
    property LocalDBLogin: TLocalDBLogin read GetLocalDBLogin write FLocalDBLogin;
  public
    { Public declarations }
  end;

var
  frmWindowsLogin: TfrmWindowsLogin;

implementation

uses
  WindowsLoginRT.UserInfo.Model, WindowsLoginRT.Constants;

{$R *.dfm}

procedure TfrmWindowsLogin.btnLoginClick(Sender: TObject);
var
  LUserInfo: TUserInfoModel;
begin
  if LoggedIn then
  begin
    ShowMessage(ALREADY_LOGGED);
    Exit;
  end;
  LUserInfo := TUserInfoModel.Create;
  try
    LUserInfo := LocalDBLogin.GetLoggedInUser;
    lblUserName.Caption := LUserInfo.DisplayName;
    lblMail.Caption := LUserInfo.EMail;
    lblSAMAccountName.Caption := LUserInfo.sAMAccountName;
    lblUserAccountControl.Caption := LUserInfo.UserAccountControl;
    lblDescription.Caption := LUserInfo.Description;
  finally
    LUserInfo.Free;
  end;
  LoggedIn := true;
end;

procedure TfrmWindowsLogin.FormCreate(Sender: TObject);
begin
  LoggedIn := false;
  edtDominio.Text := DEFAULT_DOMAIN;
end;

function TfrmWindowsLogin.GetLocalDBLogin: TLocalDBLogin;
begin
  if not Assigned(FLocalDBLogin) then
    FLocalDBLogin := TLocalDBLogin.Create(edtDominio.Text);
  Result := FLocalDBLogin;
end;

end.
