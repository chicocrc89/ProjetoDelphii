unit uFrmCadastroServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, uServicos, uControllerServicos;

type
  TFrmCadastroServicos = class(TFrmCadastro)
    edtdescricao: TEdit;
    Label1: TLabel;
    edtobs: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtcusto: TMaskEdit;
    Label4: TLabel;
    edtpreco_venda: TMaskEdit;
  private
    { Private declarations }
  protected
    umactrlservico: ControllerServicos;
    umservico: Servicos;
  public
    { Public declarations }
    procedure ConhecaObj(pObj, pctrl: TObject); Override;
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure CarregaEdt; Override;
    procedure LimpaEdt; Override;
    procedure BloqueiaEdt; Override;
    procedure DesbloqueiaEdt; Override;
  end;

var
  FrmCadastroServicos: TFrmCadastroServicos;

implementation

{$R *.dfm}

{ TFrmCadastroServicos }

procedure TFrmCadastroServicos.BloqueiaEdt;
begin
  inherited;
  self.edtdescricao.Enabled := false;
  self.edtobs.Enabled := false;
  self.edtcusto.Enabled := false;
  self.edtpreco_venda.Enabled := false;
end;

procedure TFrmCadastroServicos.CarregaEdt;
begin
  inherited;
  self.edtdescricao.Text := umservico.getdescricao;
  self.edtobs.Text := umservico.getobs;
  self.edtcusto.Text := Currtostr(umservico.getcusto);
  self.edtpreco_venda.Text := Currtostr(umservico.getpreco_venda);
end;

procedure TFrmCadastroServicos.ConhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umservico := Servicos(pObj);
  umactrlservico := Controllerservicos(pctrl);
  self.edtCodigo.Text := inttostr(self.umservico.getcodigo);
  self.edtCadastro.Text := DateToStr(self.umservico.getCadastro);
  self.edtUlt_alt.Text := DateToStr(self.umservico.getUlt_Alt);
end;

procedure TFrmCadastroServicos.DesbloqueiaEdt;
begin
  inherited;
  self.edtdescricao.Enabled := true;
  self.edtobs.Enabled := true;
  self.edtcusto.Enabled := true;
  self.edtpreco_venda.Enabled := true;
end;

procedure TFrmCadastroServicos.LimpaEdt;
begin
  inherited;
  self.edtdescricao.Clear;
  self.edtobs.Clear;
  self.edtcusto.Clear;
  self.edtpreco_venda.Clear;
end;

procedure TFrmCadastroServicos.Sair;
begin
  inherited;

end;

procedure TFrmCadastroServicos.Salvar;
begin
  inherited;
  if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclusão ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlservico.Excluir(umservico);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if self.edtdescricao.Text = '' then
    begin
      ShowMessage('Campo Descrição precisa ser Preenchido!');
      self.edtdescricao.SetFocus;
    end
    else if self.edtcusto.Text = '' then
    begin
      ShowMessage('Campo Custo precisa ser Preenchido!');
      self.edtcusto.SetFocus;
    end
    else if self.edtpreco_venda.Text = '' then
    begin
      ShowMessage('Campo Preço Venda precisa ser Preenchido!');
      self.edtpreco_venda.SetFocus;
    end
    else
    begin
      umservico.setCodigo(strtoint(self.edtCodigo.Text));
      umservico.setdescricao(self.edtdescricao.Text);
      umservico.setcusto(strtocurr(self.edtcusto.Text));
      umservico.setpreco_venda(strtocurr(self.edtpreco_venda.Text));
      umservico.setCadastro(StrToDate(self.edtCadastro.Text));
      umservico.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
      umactrlservico.Salvar(umservico.clone);
      ShowMessage('Salvo com Sucesso!!!');
      self.Sair;
    end;
  end;
end;

end.
