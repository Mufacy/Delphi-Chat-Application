program ServerApp;

uses
  Vcl.Forms,
  UChatServer in 'UChatServer.pas' {FChatServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFChatServer, FChatServer);
  Application.Run;
end.
