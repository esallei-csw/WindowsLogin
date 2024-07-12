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
  OnCreate = FormCreate
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
  object lblObjectSid: TLabel
    Left = 248
    Top = 152
    Width = 49
    Height = 13
    Caption = 'Object Sid'
  end
  object lblDescription: TLabel
    Left = 248
    Top = 184
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object lblDomainName: TLabel
    Left = 24
    Top = 29
    Width = 65
    Height = 13
    Caption = 'Domain Name'
  end
  object btnLogin: TButton
    Left = 248
    Top = 210
    Width = 153
    Height = 57
    Caption = 'Login'
    TabOrder = 0
    OnClick = btnLoginClick
  end
  object edtDominio: TEdit
    Left = 24
    Top = 53
    Width = 121
    Height = 21
    TabOrder = 1
  end
end
