unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFClientLogin = class(TForm)
    LBLNickName: TLabeledEdit;
    LBLServer: TLabeledEdit;
    BTNLogin: TButton;
    IMGLogin: TImage;
    procedure BTNLoginClick(Sender: TObject);
    procedure IMGLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClientLogin: TFClientLogin;

implementation

{$R *.dfm}

USES UClientChat;

procedure TFClientLogin.BTNLoginClick(Sender: TObject);
begin
  TRY
    FClientChat.IdTCPClient.Host := LBLServer.Text;
    FClientChat.IdTCPClient.Connect;
  FINALLY

  END;
end;

procedure TFClientLogin.IMGLoginClick(Sender: TObject);
begin
  ShowMessage('chat applicaiton developed'+sLineBreak+
              'by Mohamad Mouaz Al Midani Aka NullEdge'+sLineBreak+
              'Github: https://github.com/Null-Edge');
end;

end.
