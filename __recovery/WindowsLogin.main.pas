unit WindowsLogin.main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmWindowsLogin = class(TForm)
    btnLogin: TButton;
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
begin
  // cose...
end;

end.
