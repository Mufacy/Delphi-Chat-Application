object FClientChat: TFClientChat
  Left = 0
  Top = 0
  Caption = '-NullEdge- Client Chat'
  ClientHeight = 392
  ClientWidth = 660
  Color = 3419703
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object IdTCPClient: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 600
    Top = 8
  end
end
