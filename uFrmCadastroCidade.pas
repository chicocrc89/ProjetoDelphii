unit uFrmCadastroCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls,
  uFrmConsultaEstado,
  uControllerCidades, uCidades, Vcl.Buttons, uEstados, uControllerEstados;

type
  TFrmCadastroCidade = class(TFrmCadastro)
    Label1: TLabel;
    edtcidade: TEdit;
    Label2: TLabel;
    edtddd: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtcodestado: TEdit;
    edtestado: TEdit;
    Label5: TLabel;
    edtuf: TEdit;
    lblobrigatorioo: TLabel;
    Label8: TLabel;
    btnPesqestado: TSpeedButton;
    lblobrigatorio: TLabel;
    procedure btnpesquisarClick(Sender: TObject);
    procedure edtcodestadoExit(Sender: TObject);
    procedure btnPesqestadoClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umfrmconsultaestado: TFrmConsultaEstado;
    umactrlcidade: ControllerCidades;
    umacidade: Cidades;
  public

    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure CarregaEdt; Override;
    procedure LimpaEdt; Override;
    procedure BloqueiaEdt; Override;
    procedure DesbloqueiaEdt; Override;
    procedure SetFrmConsulta(pObj: TObject);
  end;

var
  FrmCadastroCidade: TFrmCadastroCidade;

implementation

{$R *.dfm}
{ TFrmCadastroCidade }

procedure TFrmCadastroCidade.BloqueiaEdt;
begin
  inherited;
  self.edtcidade.Enabled := false;
  self.edtddd.Enabled := false;
  self.edtcodestado.Enabled := false;
  self.edtestado.Enabled := false;
  self.edtuf.Enabled := false;
end;

procedure TFrmCadastroCidade.btnPesqestadoClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultaestado.btnSair.Caption;
  umfrmconsultaestado.btnSair.Caption := 'SELECIONAR';
  umfrmconsultaestado.ConhecaObj(umacidade.getumestado, umactrlcidade.getctrlestado);
  umfrmconsultaestado.ShowModal;

  umfrmconsultaestado.btnSair.Caption := mbotao;
  self.edtcodestado.Text := inttostr(umacidade.getumestado.getcodigo);
  self.edtestado.Text := umacidade.getumestado.getestado;
  self.edtuf.Text := umacidade.getumestado.getuf;
end;

procedure TFrmCadastroCidade.btnpesquisarClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultaestado.btnSair.Caption;
  umfrmconsultaestado.btnSair.Caption := 'SELECIONAR';
  umfrmconsultaestado.ConhecaObj(umacidade.getumestado, umactrlcidade.getctrlestado);
  umfrmconsultaestado.ShowModal;

  umfrmconsultaestado.btnSair.Caption := mbotao;
  self.edtcodestado.Text := inttostr(umacidade.getumestado.getcodigo);
  self.edtestado.Text := umacidade.getumestado.getestado;
  self.edtuf.Text := umacidade.getumestado.getuf;
end;

procedure TFrmCadastroCidade.CarregaEdt;
begin
  inherited;
  self.edtCodigo.Text := inttostr(umacidade.getcodigo);
  self.edtcidade.Text := umacidade.getcidade;
  self.edtddd.Text := umacidade.getDDD;
  self.edtcodestado.Text := inttostr(umacidade.getumestado.getcodigo);
  self.edtestado.Text := umacidade.getumestado.getestado;
  self.edtuf.Text := umacidade.getumestado.getuf;
  self.edtCadastro.Text := DateToStr(umacidade.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umacidade.getUlt_Alt);
end;

procedure TFrmCadastroCidade.ConhecaObj(pObj: TObject; pctrl: TObject);
begin
  inherited;
  umacidade := Cidades(pObj);
  umactrlcidade := ControllerCidades(pctrl);
  self.edtCodigo.Text := inttostr(self.umacidade.getcodigo);
  self.edtCadastro.Text := DateToStr(self.umacidade.getCadastro);
  self.edtUlt_alt.Text := DateToStr(self.umacidade.getUlt_Alt);
end;

procedure TFrmCadastroCidade.DesbloqueiaEdt;
begin
  inherited;
  self.edtcidade.Enabled := true;
  self.edtddd.Enabled := true;
  self.edtcodestado.Enabled := true;
  self.edtestado.Enabled := true;
  self.edtuf.Enabled := true;
end;

procedure TFrmCadastroCidade.edtcodestadoExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlcidade.getctrlestado.Pesquisar(self.edtcodestado.Text);

  umactrlcidade.getctrlestado.Carregar(umacidade.getumestado);

  self.edtcodestado.Text := inttostr(umacidade.getumestado.getcodigo);
  self.edtestado.Text := umacidade.getumestado.getestado;
  self.edtuf.Text := umacidade.getumestado.getuf;
  if self.edtcodestado.Text = inttostr(0) then
  begin
    ShowMessage('Estado n�o Encontrado!');
    self.edtcodestado.SetFocus;
  end;
end;

procedure TFrmCadastroCidade.LimpaEdt;
begin
  inherited;
  self.edtcidade.clear;
  self.edtddd.clear;
  self.edtcodestado.clear;
  self.edtestado.clear;
  self.edtuf.clear;
end;

procedure TFrmCadastroCidade.Sair;
begin
  inherited;

end;

procedure TFrmCadastroCidade.Salvar;
begin
  inherited;
  if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclus�o ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlcidade.Excluir(umacidade);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if (self.edtcidade.Text = '') then
    begin
      ShowMessage('Campo Cidade precisa ser preenchido!!!');
      self.edtcidade.SetFocus;
    end
    else if (self.edtddd.Text = '') then
    begin
      ShowMessage('Campo DDD precisa ser preenchido!!!');
      self.edtddd.SetFocus
    end
    else if (self.edtcodestado.Text = '') then
    begin
      ShowMessage('� necessario Selecionar um Estado!!!!');
      self.edtcodestado.SetFocus;
    end
    else
    begin
      umacidade.setcodigo(strtoint(self.edtCodigo.Text));
      umacidade.setcidade(self.edtcidade.Text);
      umacidade.setddd(self.edtddd.Text);
      umacidade.getumestado.setcodigo(strtoint(self.edtcodestado.Text));
      umacidade.getumestado.setestado(self.edtestado.Text);
      umacidade.getumestado.setuf(self.edtuf.Text);
      umacidade.setCadastro(StrToDate(self.edtCadastro.Text));
      umacidade.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
      umactrlcidade.Salvar(umacidade.clone);
      ShowMessage('Salvo com Sucesso!!!');
      self.Sair;
    end;
  end;
end;

procedure TFrmCadastroCidade.SetFrmConsulta(pObj: TObject);
begin
  inherited;
  umfrmconsultaestado := TFrmConsultaEstado(pObj);
end;

end.
