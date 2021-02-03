program ServerApp;

uses
  Vcl.Forms,
  UChatServer in 'UChatServer.pas' {FChatServer},
  UTools in '..\UTools.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := TRue;
  Application.CreateForm(TFChatServer, FChatServer);
  Application.Run;
end.
