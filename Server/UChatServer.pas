unit UChatServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer, Vcl.AppEvnts;

type
  TFChatServer = class(TForm)
    PNLHistory: TPanel;
    MEMHistory: TMemo;
    PNLStatus: TPanel;
    PNLStatusColor: TPanel;
    IdTCPServer: TIdTCPServer;
    TIconMain: TTrayIcon;
    ApplicationEvents: TApplicationEvents;
    procedure ApplicationEventsMinimize(Sender: TObject);
    procedure TIconMainDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FChatServer: TFChatServer;

implementation

{$R *.dfm}

procedure TFChatServer.ApplicationEventsMinimize(Sender: TObject);
begin
  Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  TIconMain.Visible := True;
  TIconMain.Animate := True;
  TIconMain.ShowBalloonHint;
end;

procedure TFChatServer.TIconMainDblClick(Sender: TObject);
begin
  Show();
  WindowState := wsNormal;
  TIconMain.Visible := False;
  TIconMain.Animate := False;
  Application.BringToFront();
end;

end.
