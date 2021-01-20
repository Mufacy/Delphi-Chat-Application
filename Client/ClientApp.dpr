program ClientApp;

uses
  Vcl.Forms,
  UClientChat in 'UClientChat.pas' {FClientChat},
  ULogin in 'ULogin.pas' {FClientLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFClientChat, FClientChat);
  Application.CreateForm(TFClientLogin, FClientLogin);
  WITH FClientLogin DO
  TRY
    ShowModal;
  FINALLY
    Application.Run;
  END;
end.
