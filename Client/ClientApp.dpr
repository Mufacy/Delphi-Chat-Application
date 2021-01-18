program ClientApp;

uses
  Vcl.Forms,
  UClientChat in 'UClientChat.pas' {FClientChat};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFClientChat, FClientChat);
  Application.Run;
end.
