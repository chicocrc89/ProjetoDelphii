unit uFrmCadastroCondicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Samples.Spin, Vcl.ComCtrls, uCondicoes, uParcelas, uControllerCondicoes, uFrmConsultaFormaPagamento, uColecaoParcelas;

type
  TFrmCadastroCondicao = class(TFrmCadastro)
    Label1: TLabel;
    edtcondicao: TEdit;
    Label2: TLabel;
    spinedtparcela: TSpinEdit;
    ListView1: TListView;
    btnadicionar: TSpeedButton;
    Label3: TLabel;
    edtnumparcela: TEdit;
    Label4: TLabel;
    Spinedtdias: TSpinEdit;
    Label5: TLabel;
    edtjuros: TEdit;
    edtperc: TEdit;
    Label6: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    btnpesquisar: TSpeedButton;
    edtcodformapag: TEdit;
    edtformapag: TEdit;
    Label7: TLabel;
    edttotal: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    btnremover: TSpeedButton;
    procedure btngerarClick(Sender: TObject);
    procedure btnadicionarClick(Sender: TObject);
    procedure btnpesquisarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtcodformapagExit(Sender: TObject);
    procedure btnremoverClick(Sender: TObject);
    procedure edtcondicaoExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtjurosExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    private
    { Private declarations }
  protected
    umfrmconsultaformapagamento : TFrmConsultaFormaPagamento;
    umacondicao : Condicoes;
    umactrlcondicao : ControllerCondicoes;
    umaparcela : Parcelas;
  public
    procedure ConhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure CarregaEdt; Override;
    procedure LimpaEdt; Override;
    procedure BloqueiaEdt; Override;
    procedure DesbloqueiaEdt; Override;
    procedure SetFrmConsulta(pObj: TObject);
    procedure addparcela;
    procedure destroy_colecao;
    procedure carregaLV;
  end;

var
  FrmCadastroCondicao: TFrmCadastroCondicao;

implementation

{$R *.dfm}

{ TFrmCadastroCondicao }

procedure TFrmCadastroCondicao.addparcela;
var mparcela, pos, tparcelas, cont: integer;
    total, valor : real;
begin
  cont := 0;
  tparcelas := cont;
  tparcelas := strtoint(self.spinedtparcela.Text);
  mparcela := strtoint(self.edtnumparcela.Text);
  pos := umacondicao.getumacolecaop.Pesquisa(mparcela, false);
  if pos = 0 then
  begin
    showmessage('PARCELA JA INSERIDA');
    self.edtnumparcela.SetFocus;
  end
  else
  begin
    if strtoint(self.Spinedtdias.Text) <= 0  then
    begin
      showmessage('Preencha QTD dias para essa parcela');
      self.Spinedtdias.SetFocus
    end
    else if self.edtperc.Text = '' then
    begin
      self.edtperc.SetFocus
    end
    else
    begin
      umaparcela.setnumero_parcela(pos);
      umaparcela.setdias_prazo(strtoint(self.Spinedtdias.Text));
      umaparcela.setperc_parcela(strtofloat(self.edtperc.Text));
      umaparcela.getumaformapagamento.setCodigo(strtoint(self.edtcodformapag.Text));
      umaparcela.getumaformapagamento.setpagamento(self.edtformapag.Text);
      total := self.umaparcela.getperc_parcela;
      valor := strtofloat(self.edttotal.Text);
      if pos > tparcelas then
        showmessage('Ultrapassou o número de Parcelas')
      else
      begin
        self.edttotal.Text:= floattostr(total + valor);
        self.umacondicao.getumacolecaop.insere(umaparcela.clone, pos);
        ShowMessage('Parcela Add com Sucesso!!!');
        self.carregaLV;
        self.edtperc.Clear;
        self.edtnumparcela.Text := inttostr(pos + 1);
        self.Spinedtdias.Text := inttostr(strtoint(ListView1.Items[0].SubItems[0]) * strtoint(self.edtnumparcela.Text));
        self.addparcela;
      end;
      if pos < tparcelas then
      begin
        //ShowMessage('CONDIÇAO POSSUI MAIS PARCELAS!!!');
        self.edtperc.setfocus;
        exit;
        self.carregaLV;
      end;
      if (pos = tparcelas) and (self.edttotal.Text = floattostr(100))  then
      begin
        self.btnSalvar.Enabled := true;
        self.btnadicionar.Enabled := false;
        self.edtnumparcela.Clear;
        self.Spinedtdias.Clear;
        self.edtperc.Clear;
        self.edtcodformapag.Clear;
        self.edtformapag.Clear;
      end;
    end;
  end;
end;


procedure TFrmCadastroCondicao.BloqueiaEdt;
begin
  inherited;
  self.edtcondicao.Enabled := false;
  self.spinedtparcela.Enabled := false;
  self.edtjuros.Enabled := false;
  self.edtnumparcela.Enabled := false;
  self.Spinedtdias.Enabled := false;
  self.edtperc.Enabled := false;
end;

procedure TFrmCadastroCondicao.btnadicionarClick(Sender: TObject);
begin
  inherited;
  umaparcela := Parcelas.Crieobj;
  self.addparcela;

end;

procedure TFrmCadastroCondicao.btngerarClick(Sender: TObject);
begin
  inherited;
  carregaLV;
end;

procedure TFrmCadastroCondicao.btnpesquisarClick(Sender: TObject);
var
  mparcela : Parcelas;
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultaformapagamento.btnSair.Caption;
  umfrmconsultaformapagamento.btnSair.Caption := 'SELECIONAR';
  umfrmconsultaformapagamento.ConhecaObj(mparcela.getumaformapagamento, umactrlcondicao.getctrlformapagamento);
  umfrmconsultaformapagamento.ShowModal;

  umfrmconsultaformapagamento.btnSair.Caption := mbotao;
  self.edtcodformapag.Text := inttostr(mparcela.getumaformapagamento.getcodigo);
  self.edtformapag.Text := mparcela.getumaformapagamento.getpagamento;
end;

procedure TFrmCadastroCondicao.btnremoverClick(Sender: TObject);
var mcolecao : ColecaoParcelas;
    tam : integer;
  k: Integer;

begin
  mcolecao := self.umacondicao.getumacolecaop;
  tam := mcolecao.getQtd;
  for k := 1 to tam do
  begin
    mcolecao.remove(k);
  end;
  ListView1.Clear;
  self.edttotal.Text := inttostr(0);
  self.btnSalvar.Enabled := false;
  self.edtnumparcela.Text := inttostr(1);
  self.Spinedtdias.Clear;
  self.edtcodformapag.Clear;
  self.edtformapag.Clear;
  self.edtperc.Clear;
end;

procedure TFrmCadastroCondicao.btnSairClick(Sender: TObject);
begin
  inherited;
  self.btnSalvar.Enabled := true;
  self.btnadicionar.Enabled := true;
  self.btnremover.Enabled := true;
end;

procedure TFrmCadastroCondicao.CarregaEdt;
begin
  inherited;
  self.edtcondicao.Text := umacondicao.getcondicao;
  self.edtCodigo.Text := inttostr(umacondicao.getCodigo);
  self.edtjuros.Text := floattostr(umacondicao.getjuros);
  self.spinedtparcela.Text := inttostr(umacondicao.getnum_parcelas);
  self.edtCadastro.Text := DateToStr(umacondicao.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umacondicao.getUlt_Alt);
end;

procedure TFrmCadastroCondicao.carregaLV;
var mcolecao : ColecaoParcelas;
    tam, k : integer;
    itemLV : TListItem;
    mparcela : Parcelas;
    percent_total : Currency;
    percent_parcela : Currency;

begin
  mcolecao := ColecaoParcelas (umacondicao.getumacolecaop);
  ListView1.Clear;
  tam := mcolecao.getQtd;
  percent_total := 0;
  for k := 1 to tam do
  begin
    mparcela := Parcelas (mcolecao.Carrega(k));
    percent_parcela := mparcela.getperc_parcela;
    percent_parcela := strtofloat(formatfloat('#0.00', percent_parcela));
    itemLV := ListView1.Items.Add;
    itemLV.Caption := inttostr(mparcela.getnumero_parcela);
    itemLV.SubItems.Add(inttostr(mparcela.getdias_prazo));
    itemLV.SubItems.Add(floattostr(percent_parcela));
    itemLV.SubItems.Add(inttostr(mparcela.getumaformapagamento.getCodigo));
    itemLV.SubItems.Add(mparcela.getumaformapagamento.getpagamento);
    percent_total := percent_total + mparcela.getperc_parcela;
  end;
  percent_total := strtofloat(formatfloat('#0.00', percent_total));

  self.edttotal.Text := floattostr(percent_total);
end;

procedure TFrmCadastroCondicao.ConhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umacondicao := Condicoes(pObj);
  umactrlcondicao := ControllerCondicoes(pctrl);
  self.edtCodigo.Text := inttoStr(self.umacondicao.getcodigo);
  self.edtCadastro.Text := DateToStr(self.umacondicao.getCadastro);
  self.edtUlt_alt.Text := DateToStr(self.umacondicao.getUlt_Alt);
end;

procedure TFrmCadastroCondicao.DesbloqueiaEdt;
begin
  inherited;
  self.edtcondicao.Enabled := true;
  self.spinedtparcela.Enabled := true;
  self.edtjuros.Enabled := true;
  self.edtnumparcela.Enabled := true;
  self.Spinedtdias.Enabled := true;
  self.edtperc.Enabled := true;
end;

procedure TFrmCadastroCondicao.edtcodformapagExit(Sender: TObject);
var
  mparcela : Parcelas;
  mMSG: string;
begin
  inherited;
  mparcela := Parcelas.Crieobj;
  mMSG := umactrlcondicao.getctrlformapagamento.Pesquisar(self.edtcodformapag.Text);
  umactrlcondicao.getctrlformapagamento.Carregar(mparcela.getumaformapagamento);
  self.edtcodformapag.Text := inttostr(mparcela.getumaformapagamento.getcodigo);
  self.edtformapag.Text := mparcela.getumaformapagamento.getpagamento;
  if self.edtcodformapag.Text = inttostr(0) then
  begin
    ShowMessage('Forma não Encontrada!');
    self.edtcodformapag.SetFocus;
  end
  else
    self.btnadicionar.Enabled := true;

end;

procedure TFrmCadastroCondicao.edtcondicaoExit(Sender: TObject);
begin
  inherited;
  self.btnSalvar.Enabled := false;
end;

procedure TFrmCadastroCondicao.edtjurosExit(Sender: TObject);
begin
  inherited;
  self.edtnumparcela.Text := inttostr(1);
end;

procedure TFrmCadastroCondicao.FormActivate(Sender: TObject);
begin
  inherited;
  if self.edtCodigo.Text = inttostr(0) then
    self.edttotal.Text := inttostr(0)
  else

end;

procedure TFrmCadastroCondicao.FormCreate(Sender: TObject);
begin
  inherited;
  self.edttotal.Text := floattostr(0);
end;

procedure TFrmCadastroCondicao.LimpaEdt;
begin
  inherited;
  self.edtcondicao.Clear;
  self.spinedtparcela.Clear;
  self.edtjuros.Clear;
  self.edtnumparcela.Clear;
  self.Spinedtdias.Clear;
  self.edtcodformapag.Clear;
  self.edtformapag.Clear;
  self.ListView1.Clear;
end;

procedure TFrmCadastroCondicao.destroy_colecao;
var mcolecao : ColecaoParcelas;
    tam, k : integer;
begin
  mcolecao := self.umacondicao.getumacolecaop;
  tam := mcolecao.getQtd;
  for k := 1 to tam do
  begin
    mcolecao.remove(k);
  end;
end;

procedure TFrmCadastroCondicao.Sair;
begin
  inherited;
end;

procedure TFrmCadastroCondicao.Salvar;
begin
  inherited;
  if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclusão ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlcondicao.Excluir(umacondicao);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if (self.edtcondicao.Text = '') then
    begin
      ShowMessage('Campo Condição precisa ser preenchido!!!');
      self.edtcondicao.SetFocus;
    end
    else if (self.spinedtparcela.Text = '') then
    begin
      ShowMessage('é necessario Criar pelo almenos uma parcela!!!!');
      self.spinedtparcela.SetFocus;
    end
    else
    begin
      umacondicao.setcodigo(strtoint(self.edtCodigo.Text));
      umacondicao.setcondicao(self.edtcondicao.Text);
      umacondicao.setjuros(strtofloat(self.edtjuros.Text));
      umacondicao.setnum_parcelas(strtoint(self.spinedtparcela.Text));
      umacondicao.setCadastro(StrToDate(self.edtCadastro.Text));
      umacondicao.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
      umactrlcondicao.Salvar(umacondicao.clone);
      self.destroy_colecao;
      ShowMessage('Salvo com Sucesso!!!');
      self.Sair;
    end;
  end;
end;

procedure TFrmCadastroCondicao.SetFrmConsulta(pObj: TObject);
begin
  umfrmconsultaformapagamento := TFrmConsultaFormaPagamento (pObj);
end;

end.
