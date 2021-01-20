unit UChatServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer, Vcl.AppEvnts,
  IdContext;

type
  TChatThread = class(TThread)
  private
  protected
    procedure Execute; override;
  public
    constructor Create();
  end;

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
    procedure PNLStatusColorDblClick(Sender: TObject);
    procedure IdTCPServerExecute(AContext: TIdContext);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FChatServer: TFChatServer;

implementation

{$R *.dfm}

Constructor TChatTHread.Create();
begin
  //
end;

Procedure TChatTHread.Execute;
begin
  //
end;

procedure TFChatServer.ApplicationEventsMinimize(Sender: TObject);
begin
  Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  TIconMain.Visible := True;
  TIconMain.Animate := True;
  TIconMain.ShowBalloonHint;
end;

procedure TFChatServer.IdTCPServerExecute(AContext: TIdContext);
var
 Data : String;
 Ss : TStringStream;
begin
  {Read Incoming Stream on Server Execute}
  Try
     Data := '';
     Ss := nil;
     Try
       Ss := TStringStream.Create('');
       Ss.Position := 0;
       AContext.Connection.IOHandler.ReadStream(Ss);
     Finally

     End;
    Finally
    End;
end;

procedure TFChatServer.PNLStatusColorDblClick(Sender: TObject);
begin
  {On Double Click Start Server}
  if IDTCPServer.Active then
      Exit;
  try
    IDTCPServer.DefaultPort := 6666;
    IDTCPServer.Active:=True;
    if IDTCPServer.Active then
    begin
      MEMHistory.Lines.Add('Server started '+IdTCPServer.Bindings.Items[0].IP+
                          ':'+IntToStr(IdTCPServer.Bindings.Items[0].Port));
    end
    else
    begin
      MEMHistory.Lines.Add('Could not start server');
      Exit;
    end;
    except
    ON E:EXCEPTION DO
    BEGIN
      MEMHistory.Lines.Add('ERROR.'+E.Message);
      Exit;
    END;
  end;
end;



procedure TFChatServer.TIconMainDblClick(Sender: TObject);
begin
  {Trey Icon on Double Click show window and hide try}
  Show();
  WindowState := wsNormal;
  TIconMain.Visible := False;
  TIconMain.Animate := False;
  Application.BringToFront();
end;

end.
