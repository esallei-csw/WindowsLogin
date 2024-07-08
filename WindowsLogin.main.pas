unit WindowsLogin.main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmWindowsLogin = class(TForm)
    btnLogin: TButton;
    lblUserName: TLabel;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWindowsLogin: TfrmWindowsLogin;

implementation

{$R *.dfm}

procedure TfrmWindowsLogin.btnLoginClick(Sender: TObject);
var
  UserName: string;
  UserNameLen: DWORD;
begin
  UserNameLen := 256;
  SetLength(UserName, UserNameLen);
  if GetUserName(PChar(UserName), UserNameLen) then
    SetLength(UserName, UserNameLen - 1)
  else
    RaiseLastOSError;
  lblUserName.Caption := UserName;

end;

end.
