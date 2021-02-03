unit UChatServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer, Vcl.AppEvnts,
  IdContext, IdTCPConnection, IdGlobal, UTools;

type
  {Custom Record to store the connected user informatin}
  PChatUser = ^ TChatUser;
  TChatUser = record
  Nickname: ShortString;
  IP: ShortString;
  Connection: TidTCPConnection;
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
    procedure IdTCPServerConnect(AContext: TIdContext);
    procedure IdTCPServerExecute(AContext: TIdContext);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FChatServer: TFChatServer;
  userList: TList;

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

procedure TFChatServer.FormCreate(Sender: TObject);
begin
  userList := TList.Create;
end;

procedure TFChatServer.IdTCPServerConnect(AContext: TIdContext);
var
  CurrentConnection: PChatUser;
  Command: String;
  Data: String;
  ContextInput: String;
begin
  AContext.Connection.Socket.WriteLn('What is your name?');
  ContextInput := AContext.Connection.IOHandler.ReadLn(IndyTextEncoding_UTF8);
  Command :=extractmessage(ContextInput);
  AContext.Connection.IOHandler.DefStringEncoding := IndyTextEncoding_UTF8;

  GetMem(CurrentConnection,SizeOf(TChatUser));

  CurrentConnection.Connection := AContext.Connection;
  CurrentConnection.IP := AContext.Connection.Socket.Binding.PeerIP;
  CurrentConnection.Nickname := Command;

  AContext.Data := TObject(CurrentConnection);
  userList.Add(CurrentConnection);


  AContext.Connection.Socket.WriteLn('Hello, ' + Command + '.');
  AContext.Connection.Socket.WriteLn('Would you like to play a game?');

end;

procedure TFChatServer.IdTCPServerExecute(AContext: TIdContext);
var
Command: String;
begin
//do something later
  Command := AContext.Connection.IOHandler.ReadLn(IndyTextEncoding_UTF8);

  AContext.Connection.Socket.WriteLn('you wrote '+Command);
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
