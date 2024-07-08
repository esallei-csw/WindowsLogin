program WindowsLogin;

uses
  Vcl.Forms,
  WindowsLogin.main in 'WindowsLogin.main.pas' {frmWindowsLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmWindowsLogin, frmWindowsLogin);
  Application.Run;
end.
