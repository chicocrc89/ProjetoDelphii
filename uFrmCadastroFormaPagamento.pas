unit uFrmCadastroFormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls, Vcl.Buttons,
  uFormaPagamentos, uControllerFormaPagamentos;

type
  TFrmCadastroFormaPagamento = class(TFrmCadastro)
    Label1: TLabel;
    edtformapag: TEdit;
  private
    { Private declarations }
  protected
    umactrlformapagamento: ControllerFormaPagamentos;
    umaformapagamento: FormaPagamentos;
  public
    procedure ConhecaObj(pObj, pctrl: TObject); Override;
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure CarregaEdt; Override;
    procedure LimpaEdt; Override;
    procedure BloqueiaEdt; Override;
    procedure DesbloqueiaEdt; Override;
  end;

var
  FrmCadastroFormaPagamento: TFrmCadastroFormaPagamento;

implementation

{$R *.dfm}
{ TFrmCadastroFormaPagamento }

procedure TFrmCadastroFormaPagamento.BloqueiaEdt;
begin
  inherited;
  self.edtformapag.Enabled := false;
end;

procedure TFrmCadastroFormaPagamento.CarregaEdt;
begin
  inherited;
  self.edtCodigo.Text := inttostr(umaformapagamento.getCodigo);
  self.edtformapag.Text := umaformapagamento.getpagamento;
  self.edtCadastro.Text := DateToStr(umaformapagamento.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umaformapagamento.getUlt_Alt);
end;

procedure TFrmCadastroFormaPagamento.ConhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umaformapagamento := FormaPagamentos(pObj);
  umactrlformapagamento := ControllerFormaPagamentos(pctrl);
  self.edtCodigo.Text := inttostr(umaformapagamento.getCodigo);
  self.edtCadastro.Text := DateToStr(umaformapagamento.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umaformapagamento.getUlt_Alt);
end;

procedure TFrmCadastroFormaPagamento.DesbloqueiaEdt;
begin
  inherited;
  self.edtformapag.Enabled := true;
end;

procedure TFrmCadastroFormaPagamento.LimpaEdt;
begin
  inherited;
  self.edtformapag.Clear;
end;

procedure TFrmCadastroFormaPagamento.Sair;
begin
  inherited;

end;

procedure TFrmCadastroFormaPagamento.Salvar;
begin
  inherited;
  if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclus�o ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlformapagamento.Excluir(umaformapagamento);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if (self.edtformapag.Text = '') then
    begin
      ShowMessage('Campo Forma de Pagamento precisa ser preenchido!!!');
      self.edtformapag.SetFocus;
    end
    else
    begin
      umaformapagamento.setcodigo(strtoint(self.edtCodigo.Text));
      umaformapagamento.setpagamento(self.edtformapag.Text);
      umaformapagamento.setCadastro(StrToDate(self.edtCadastro.Text));
      umaformapagamento.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
      umactrlformapagamento.Salvar(umaformapagamento.clone);
      ShowMessage('Salvo com Sucesso!!!');
      self.Sair;
    end;
  end;
end;

end.
