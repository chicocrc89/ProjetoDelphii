unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    ImageLogin: TImage;
    Label1: TLabel;
    Label2: TLabel;
    edtusuario: TEdit;
    edtsenha: TEdit;
    Label3: TLabel;
    lblaviso: TLabel;
    btnentrar: TSpeedButton;
    btncancelar: TSpeedButton;
    procedure btncancelarClick(Sender: TObject);
    procedure btnentrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

procedure TFrmLogin.btncancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLogin.btnentrarClick(Sender: TObject);
begin
  if self.edtusuario.Text = '' then
  begin
    //showmessage('Preencha o Campo Usu�rio');
    self.lblaviso.Visible := true;
    self.edtusuario.SetFocus
  end
  else if self.edtsenha.Text = '' then
  begin
    //showmessage('Preencha o Campo Senha');
    self.lblaviso.Visible := true;
    self.edtsenha.SetFocus
  end;
  if (self.edtusuario.Text = 'christian') AND (self.edtsenha.Text = 'sede4085') then
  begin
    close;
  end
  else
  begin
    showmessage('Usu�rio ou Senha Inv�lida');
    self.edtusuario.SetFocus;
  end;
end;

end.
