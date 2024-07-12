object frmWindowsLogin: TfrmWindowsLogin
  Left = 0
  Top = 0
  Caption = 'Windows Login'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblUserName: TLabel
    Left = 248
    Top = 56
    Width = 52
    Height = 13
    Caption = 'User Name'
  end
  object lblMail: TLabel
    Left = 248
    Top = 88
    Width = 18
    Height = 13
    Caption = 'Mail'
  end
  object lblSAMAccountName: TLabel
    Left = 248
    Top = 120
    Width = 87
    Height = 13
    Caption = 'SAMAccountName'
  end
  object lblUserAccountControl: TLabel
    Left = 248
    Top = 152
    Width = 96
    Height = 13
    Caption = 'UserAccountControl'
  end
  object btnLogin: TButton
    Left = 248
    Top = 186
    Width = 153
    Height = 57
    Caption = 'Login'
    TabOrder = 0
    OnClick = btnLoginClick
  end
end
