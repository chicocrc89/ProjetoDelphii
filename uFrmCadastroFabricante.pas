unit uFrmCadastroFabricante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, uFabricantes, uControllerFabricantes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmCadastroFabricante = class(TFrmCadastro)
    Label1: TLabel;
    edtcnpj: TEdit;
    edtfabricante: TEdit;
    Label2: TLabel;
    Label3: TLabel;
  private
    { Private declarations }
  protected
    umfabricante : Fabricantes;
    umactrlfabricante : ControllerFabricantes;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure CarregaEdt; Override;
    procedure LimpaEdt; Override;
    procedure BloqueiaEdt; Override;
    procedure DesbloqueiaEdt; Override;

  end;

var
  FrmCadastroFabricante: TFrmCadastroFabricante;

implementation

{$R *.dfm}
{ TFrmCadastroFabricante }

procedure TFrmCadastroFabricante.BloqueiaEdt;
begin
  inherited;
  self.edtcnpj.Enabled := false;
  self.edtfabricante.Enabled := false;
end;

procedure TFrmCadastroFabricante.CarregaEdt;
begin
  inherited;
  self.edtCodigo.Text := inttostr(umfabricante.getcodigo);
  self.edtfabricante.Text := umfabricante.getfabricante;
  self.edtcnpj.Text := umfabricante.getcnpj;
  self.edtCadastro.Text := DateToStr(umfabricante.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umfabricante.getUlt_Alt);
end;

procedure TFrmCadastroFabricante.ConhecaObj(pObj: TObject; pctrl: TObject);
begin
  inherited;
  umfabricante := Fabricantes (pObj);
  umactrlfabricante := ControllerFabricantes (pctrl);
  self.edtCodigo.Text := inttostr(umfabricante.getcodigo);
  self.edtCadastro.Text := DateToStr(umfabricante.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umfabricante.getUlt_Alt);
end;

procedure TFrmCadastroFabricante.DesbloqueiaEdt;
begin
  inherited;
    self.edtcnpj.Enabled := true;
  self.edtfabricante.Enabled := true;
end;

procedure TFrmCadastroFabricante.LimpaEdt;
begin
  inherited;
  self.edtcnpj.Clear;
  self.edtfabricante.Clear;
end;

procedure TFrmCadastroFabricante.Sair;
begin
  inherited;

end;

procedure TFrmCadastroFabricante.Salvar;
begin
  inherited;
  if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclus�o ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlfabricante.Excluir(umfabricante);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if (self.edtfabricante.Text = '') then
    begin
      ShowMessage('Campo Fabricante precisa ser preenchido!!!');
      self.edtfabricante.SetFocus;
    end
    else
    begin
      umfabricante.setcodigo(strtoint(self.edtcodigo.Text));
      umfabricante.setfabricante(self.edtfabricante.Text);
      umfabricante.setcnpj(self.edtcnpj.Text);
      umfabricante.setCadastro(StrToDate(self.edtCadastro.Text));
      umfabricante.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
      umactrlfabricante.Salvar(umfabricante.clone);
      ShowMessage('Salvo com Sucesso!!!');
      self.Sair;
    end;
  end;
end;

end.
