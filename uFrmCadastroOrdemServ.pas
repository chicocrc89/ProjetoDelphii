unit uFrmCadastroOrdemServ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Menus, Vcl.ComCtrls, Vcl.Mask, Vcl.Samples.Spin, uFrmConsultaCliente, uFrmConsultaUsuario,
  uFrmConsultaCarro, uOrdemServicos, uControllerOrdemServicos, uFrmConsultaProduto, uFrmConsultaCor,
  uFrmConsultaModelo, uFrmConsultaServicos, uFrmConsultaCondicao, uItem, uColecaoprodutos, uColecaoServicos, uParcelas, uContasReceber,
  uColecaoParcelas, uColecaoContasReceber, uFrmConsultaFuncionario;

type
  TFrmCadastroOrdemServ = class(TFrmCadastro)
    Label1: TLabel;
    Label2: TLabel;
    edthora_emissao: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtcodcliente: TEdit;
    edtcliente: TEdit;
    edtendereco: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtlimite: TEdit;
    comboboxstatus: TComboBox;
    Label9: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    btnpesquisacliente: TSpeedButton;
    Label25: TLabel;
    edtplaca: TEdit;
    edtobs: TEdit;
    Label27: TLabel;
    edttotalproduto: TMaskEdit;
    Label28: TLabel;
    edttotalservico: TMaskEdit;
    Label29: TLabel;
    edtoutrasdespesas: TMaskEdit;
    Label30: TLabel;
    edtdesconto: TMaskEdit;
    Label31: TLabel;
    Label3: TLabel;
    Label33: TLabel;
    btnpesquisausuario: TSpeedButton;
    edtcodfuncionario: TEdit;
    edtfuncionario: TEdit;
    edtdata_emissao: TDateTimePicker;
    Label39: TLabel;
    Label40: TLabel;
    btnpesquisacor: TSpeedButton;
    edtcodcor: TEdit;
    edtcor: TEdit;
    Label42: TLabel;
    Label43: TLabel;
    btnpesquisamodelo: TSpeedButton;
    edtcodmodelo: TEdit;
    edtmodelo: TEdit;
    Label4: TLabel;
    edtmarca: TEdit;
    Label5: TLabel;
    edtanomodelo: TEdit;
    edtcelular: TEdit;
    Label15: TLabel;
    Label6: TLabel;
    edtproblema: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    btnpesquisaproduto: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    btnaddproduto: TSpeedButton;
    btnremove: TSpeedButton;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    btnpesquisaservico: TSpeedButton;
    Label38: TLabel;
    btnremoveservico: TSpeedButton;
    btnaddservico: TSpeedButton;
    Label41: TLabel;
    Label44: TLabel;
    edtcodproduto: TEdit;
    edtproduto: TEdit;
    edtvalor_produto: TEdit;
    ListView1: TListView;
    edtqtd_produto: TSpinEdit;
    edtund: TEdit;
    ListView2: TListView;
    edtcodservico: TEdit;
    edtservico: TEdit;
    edtqtd_servico: TSpinEdit;
    edtvalor_servico: TMaskEdit;
    edttotal_servico: TMaskEdit;
    edtdescproduto: TEdit;
    edtdescservico: TEdit;
    edttotal_produto: TMaskEdit;
    Label45: TLabel;
    Label46: TLabel;
    btnpesquisacondicao: TSpeedButton;
    Label48: TLabel;
    btngeraparcela: TSpeedButton;
    ListView3: TListView;
    edtcodcondicao: TEdit;
    edtcondicao: TEdit;
    edtparcelas: TEdit;
    Label32: TLabel;
    edttotalos: TMaskEdit;
    Label35: TLabel;
    Label49: TLabel;
    btnpesquisafuncionario: TSpeedButton;
    edtcodtecnico: TEdit;
    edttecnico: TEdit;
    btnremovecontasreceber: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btncancelaros: TSpeedButton;
    procedure btnpesquisausuarioClick(Sender: TObject);
    procedure btnpesquisaclienteClick(Sender: TObject);
    procedure btnpesquisamodeloClick(Sender: TObject);
    procedure btnpesquisacorClick(Sender: TObject);
    procedure edtcodprodutoExit(Sender: TObject);
    procedure edtcodfuncionarioExit(Sender: TObject);
    procedure edtcodclienteExit(Sender: TObject);
    procedure edtcodmodeloExit(Sender: TObject);
    procedure edtqtd_produtoExit(Sender: TObject);
    procedure btnaddprodutoClick(Sender: TObject);
    procedure btnaddservicoClick(Sender: TObject);
    procedure btnremoveservicoClick(Sender: TObject);
    procedure edtqtd_servicoExit(Sender: TObject);
    procedure edtoutrasdespesasExit(Sender: TObject);
    procedure edtdescontoExit(Sender: TObject);
    procedure edtcodcorExit(Sender: TObject);
    procedure btngeraparcelaClick(Sender: TObject);
    procedure btnpesquisaprodutoClick(Sender: TObject);
    procedure btnpesquisaservicoClick(Sender: TObject);
    procedure edtcodservicoExit(Sender: TObject);
    procedure edtdescprodutoExit(Sender: TObject);
    procedure edtdescservicoExit(Sender: TObject);
    procedure btnremoveClick(Sender: TObject);
    procedure btnpesquisafuncionarioClick(Sender: TObject);
    procedure edtcodtecnicoExit(Sender: TObject);
    procedure edtcodcondicaoExit(Sender: TObject);
    procedure btnremovecontasreceberClick(Sender: TObject);
    procedure btnpesquisacondicaoClick(Sender: TObject);
    procedure btncancelarosClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umfrmconsultacliente  : TFrmConsultaCliente;
    umfrmconsultausuario  : TFrmConsultaUsuario;
    umfrmconsultaveiculo  : TFrmConsultaCarro;
    umfrmconsultaproduto  : TFrmConsultaProduto;
    umfrmconsultacor      : TFrmConsultaCor;
    umfrmconsultamodelo   : TFrmConsultamodelo;
    umfrmconsultaservico  : TFrmConsultaservicos;
    umfrmconsultafuncionario : TFrmConsultaFuncionario;
    umfrmconsultacondicao     : TFrmConsultaCondicao;
    umaordemservico : OrdemServicos;
    umactrlordemservico : ControllerOrdemServicos;
    umacontareceber : ContasReceber;
    umitem : Item;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure CarregaEdt; Override;
    procedure LimpaEdt; Override;
    procedure BloqueiaEdt; Override;
    procedure DesbloqueiaEdt; Override;
    procedure SetFrmConsultacliente(pObj: TObject);
    procedure SetFrmConsultaveiculo(pObj: TObject);
    procedure SetFrmConsultaproduto(pObj: TObject);
    procedure SetFrmConsultausuario(pObj: TObject);
    procedure setFrmConsultacor(pObj: TObject);
    procedure setFrmConsultamodelo(pObj: TObject);
    procedure setFrmConsultaservico(pObj: TObject);
    procedure setfrmconsultafuncionario(pObj: TObject);
    procedure setfrmconsultacondicao(pObj: TObject);
    procedure addproduto;
    procedure removeproduto;
    procedure CarregaLV;
    procedure addservico;
    procedure removeservico;
    procedure carregaLV2;
    procedure carregaLV3;
    procedure atualizavalores;
    procedure destroy_colecao;
    procedure removecontasreceber;
  end;

var
  FrmCadastroOrdemServ: TFrmCadastroOrdemServ;

implementation

{$R *.dfm}

{ TFrmCadastroOrdemServ }

procedure TFrmCadastroOrdemServ.addproduto;
var pos,  cont, k : integer;
    total, valor, subtotal, desconto, valor_desconto, valor_liquido : extended;
    mitem : string;
    pitem : Item;
    mcolecao : ColecaoProdutos;
begin
    k := 0;
    total := 0;
    desconto := 0;
    mitem := self.edtproduto.Text;
    pos := umaordemservico.getumacolecaoproduto.Pesquisa(mitem, false);
    if pos = 0 then
    begin
      pos := umaordemservico.getumacolecaoproduto.Pesquisa(mitem, true);
      pitem := Item (umaordemservico.getumacolecaoproduto.Carrega(pos));
      self.umaordemservico.getumacolecaoproduto.remove(pos);
      umitem.getumproduto.setCodigo(strtoint(self.edtcodproduto.Text));
      umitem.getumproduto.setdescricao(self.edtproduto.Text);
      umitem.getumproduto.setund(self.edtund.Text);
      umitem.getumproduto.setpreco_venda(strtofloat(self.edtvalor_produto.Text));
      umitem.setDesconto(strtofloat(self.edtdescproduto.Text));
      subtotal := strtofloat(self.edtvalor_produto.Text) * strtoint(self.edtqtd_produto.Text);
      umitem.setvalor_total(subtotal + pitem.getvalor_total);
      umitem.SetQtd(strtoint(self.edtqtd_produto.Text)+ pitem.getQtd);
      self.umaordemservico.getumacolecaoproduto.insere(umitem.clone, pos);
      self.carregaLV;
    end
    else
    begin
      umitem.getumproduto.setCodigo(strtoint(self.edtcodproduto.Text));
      umitem.getumproduto.setdescricao(self.edtproduto.Text);
      umitem.getumproduto.setund(self.edtund.Text);
      umitem.SetQtd(strtoint(self.edtqtd_produto.Text));
      umitem.getumproduto.setpreco_venda(strtofloat(self.edtvalor_produto.Text));
      umitem.setDesconto(strtofloat(self.edtdescproduto.Text));
      valor_desconto := umitem.getumproduto.getpreco_venda * umitem.getDesconto / 100;
      valor_liquido := umitem.getumproduto.getpreco_venda - (umitem.getumproduto.getpreco_venda * umitem.getDesconto / 100);
      umitem.setvalor_desconto(valor_desconto);
      umitem.setvalor_liquido(valor_liquido);
      subtotal := strtofloat(self.edtvalor_produto.Text) * strtoint(self.edtqtd_produto.Text);
      umitem.setvalor_total(subtotal);

      self.umaordemservico.getumacolecaoproduto.insere(umitem.clone, pos);
      self.carregaLV;
    end;
    self.atualizavalores;
end;

procedure TFrmCadastroOrdemServ.addservico;
var pos,  cont, k : integer;
    total, valor, subtotal, valor_desconto, valor_liquido : currency;
    mitem : string;
    pitem : Item;
    mcolecao_servico : ColecaoServicos;
begin
    k := 0;
    total := 0;
    mitem := self.edtservico.Text;
    pos := umaordemservico.getumacolecaoservico.Pesquisa(mitem, false);
    if pos = 0 then
    begin
      pos := umaordemservico.getumacolecaoservico.Pesquisa(mitem, true);
      pitem := Item (umaordemservico.getumacolecaoservico.Carrega(pos));
      self.umaordemservico.getumacolecaoservico.remove(pos);
      umitem.getumproduto.setCodigo(strtoint(self.edtcodservico.Text));
      umitem.getumproduto.setdescricao(self.edtservico.Text);
      umitem.getumproduto.setpreco_venda(strtoCurr(self.edtvalor_servico.Text));
      subtotal := strtoCurr(self.edtvalor_servico.Text) * strtoint(self.edtqtd_servico.Text);
      umitem.setvalor_total(subtotal + pitem.getvalor_total);
      umitem.setDesconto(strtofloat(self.edtdescservico.Text));
      umitem.SetQtd(strtoint(self.edtqtd_servico.Text)+ pitem.getQtd);
      umitem.getumfuncionario.setCodigo(strtoint(self.edtcodtecnico.Text));
      umitem.getumfuncionario.setnome(self.edttecnico.Text);
      self.umaordemservico.getumacolecaoservico.insere(umitem.clone, pos);
      self.CarregaLV2;
    end
    else
    begin
      umitem.getumproduto.setCodigo(strtoint(self.edtcodservico.Text));
      umitem.getumproduto.setdescricao(self.edtservico.Text);
      umitem.SetQtd(strtoint(self.edtqtd_servico.Text));
      umitem.getumproduto.setpreco_venda(strtoCurr(self.edtvalor_servico.Text));
      umitem.setDesconto(strtocurr(self.edtdescservico.Text));
      valor_desconto := umitem.getumproduto.getpreco_venda * umitem.getDesconto / 100;
      valor_liquido := umitem.getumproduto.getpreco_venda - (umitem.getumproduto.getpreco_venda * umitem.getDesconto / 100);
      umitem.setvalor_desconto(valor_desconto);
      umitem.setvalor_liquido(valor_liquido);
      subtotal := strtofloat(self.edtvalor_servico.Text) * strtoint(self.edtqtd_servico.Text);
      umitem.setvalor_total(subtotal);
      umitem.getumfuncionario.setCodigo(strtoint(self.edtcodtecnico.Text));
      umitem.getumfuncionario.setnome(self.edttecnico.Text);
      self.umaordemservico.getumacolecaoservico.insere(umitem.clone, pos);
      self.CarregaLV2;
    end;
    self.atualizavalores;
end;

procedure TFrmCadastroOrdemServ.atualizavalores;
var mtotalprodutos, moutrasdespesas, mtotalservicos, mtotaldescontos, mtotalvenda : Currency;
    cont, k, j : integer;
begin
  mtotalprodutos := 0.00;
  mtotalservicos := 0.00;
  mtotaldescontos := 0.00;
  mtotalvenda := 0.00;
  moutrasdespesas := 0.00;

     cont := self.Listview1.Items.Count;
    for k := 0 to cont - 1 do
    begin
      mtotalprodutos := mtotalprodutos + strtofloat(self.Listview1.Items[k].SubItems[7]);
      mtotaldescontos := mtotaldescontos + strtofloat(self.ListView1.Items[k].SubItems[5]);
    end;
    self.edttotalproduto.Text := floattostr(mtotalprodutos);
    self.edttotalproduto.Text:= FormatCurr('###,##0.00', StrtoCurr(edttotalproduto.Text));
    self.edtdesconto.Text := floattostr(mtotaldescontos);
    self.edtdesconto.Text:= FormatCurr('###,##0.00', StrtoCurr(edtdesconto.Text));

    cont := self.Listview2.Items.Count;
    for k := 0 to cont - 1 do
    begin
      mtotalservicos := mtotalservicos + strtofloat(self.Listview2.Items[k].SubItems[6]);
      mtotaldescontos := mtotaldescontos + strtofloat(self.ListView2.Items[k].SubItems[4]);
    end;
    self.edttotalservico.Text := Currtostr(mtotalservicos);
    self.edttotalservico.Text:= FormatCurr('###,##0.00', StrtoCurr(edttotalservico.Text));
    self.edtdesconto.Text := Currtostr(mtotaldescontos);
    self.edtdesconto.Text:= FormatCurr('###,##0.00', StrtoCurr(edtdesconto.Text));

    moutrasdespesas := strtoCurr(self.edtoutrasdespesas.Text);
    self.edtoutrasdespesas.Text := Currtostr(moutrasdespesas);
    self.edtoutrasdespesas.Text := FormatCurr('###,##0.00', StrtoCurr(self.edtoutrasdespesas.Text));

    mtotalvenda := mtotalprodutos + mtotalservicos + moutrasdespesas - mtotaldescontos;
    self.edttotalos.Text := Currtostr(mtotalvenda);
    self.edttotalos.Text:= FormatCurr('###,##0.00', StrtoCurr(edttotalos.Text));
    end;

procedure TFrmCadastroOrdemServ.BloqueiaEdt;
begin
  inherited;
  self.edtcodcliente.enabled := false;
  self.edtcliente.enabled := false;
  self.edtcodmodelo.enabled := false;
  self.edtmodelo.enabled := false;
  self.edtendereco.enabled := false;
  self.edtlimite.enabled := false;
  self.edtcodproduto.enabled := false;
  self.edtproduto.enabled := false;
  self.edtmarca.enabled := false;
  self.edtmodelo.enabled := false;
  self.edtplaca.enabled := false;
  self.edtobs.enabled := false;
  self.edttotalproduto.enabled := false;
  self.edttotalservico.enabled := false;
  self.edtoutrasdespesas.enabled := false;
  self.edtdesconto.enabled := false;
  self.edttotalos.enabled := false;
  self.edtcodfuncionario.Enabled := false;
  self.edtfuncionario.Enabled := false;
  self.edtproblema.Enabled := false;
  self.edthora_emissao.Enabled := false;
  self.edtcodtecnico.Enabled := false;
  self.edttecnico.Enabled := false;
  self.edtcodservico.Enabled := false;
  self.edtservico.Enabled := false;
  self.edtcodcor.Enabled := false;
  self.edtcodcondicao.Enabled := false;
  self.edtcondicao.Enabled := false;
  self.edtparcelas.Enabled := false;
  self.edtdescproduto.Enabled := false;
  self.edtdescservico.Enabled := false;
  self.edtvalor_produto.Enabled := false;
  self.edtqtd_produto.Enabled := false;
  self.edtqtd_servico.Enabled := false;
  self.comboboxstatus.Enabled := false;
end;

procedure TFrmCadastroOrdemServ.btnaddprodutoClick(Sender: TObject);
var total, valor : real;
begin
  if self.edtqtd_produto.value > 0 then
begin
  umitem := Item.Crieobj;
  self.addproduto;
  self.edtcodproduto.Clear;
  self.edtproduto.Clear;
  self.edtqtd_produto.Clear;
  self.edttotal_produto.Clear;
  self.edtvalor_produto.Clear;
  self.edtdescproduto.Clear;
  self.edtund.Clear;
  self.edtcodproduto.SetFocus;
  self.edtcodigo.Enabled := false;
  self.btnremove.Enabled := true;
  end
  else
  begin
    showmessage('Quantidade Inv�lida');
    self.edtqtd_produto.SetFocus;
  end;
end;

procedure TFrmCadastroOrdemServ.btnaddservicoClick(Sender: TObject);
var total, valor : real;
begin
  if self.edtqtd_servico.value > 0 then
  begin
    umitem := Item.Crieobj;
    self.addservico;
    self.edtcodservico.Clear;
    self.edtservico.Clear;
    self.edtqtd_servico.Clear;
    self.edttotal_servico.Clear;
    self.edtvalor_servico.Clear;
    self.edtcodtecnico.Clear;
    self.edttecnico.Clear;
    self.edtcodservico.SetFocus;
    self.btnremoveservico.Enabled := true;
  end
  else
  begin
    showmessage('Quantidade Inv�lida');
    self.edtqtd_servico.SetFocus;
  end;
end;

procedure TFrmCadastroOrdemServ.btncancelarosClick(Sender: TObject);
begin
  inherited;
  if self.btncancelaros.Caption = '&Cancelar OS' then
  begin
    If Application.MessageBox('Confirma o Cancelamento ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.comboboxstatus.ItemIndex := 2;
      self.Salvar;
      ShowMessage('O.S Cancelada com Sucesso!!!');
      self.destroy_colecao;
      self.Sair;
    end;
  end
end;

procedure TFrmCadastroOrdemServ.btngeraparcelaClick(Sender: TObject);
var mcontareceber, pos, tparcelas, cont, i, dias_prazo, tamanho: integer;
    percentual_parcela : real;
    total, valor_venda, valor_parcela : Currency;
    mcolecao : Colecaoparcelas;
    mparcela : Parcelas;
    mformapagamento,  mcodformapagamento : string;
begin
  umacontareceber := ContasReceber.Crieobj;
  cont := 0;
  tparcelas := cont;
  total := 0;
  tparcelas := strtoint(self.edtparcelas.Text);
  valor_venda := strtofloat(self.edttotalos.Text);
  valor_parcela := valor_venda / tparcelas;
  valor_parcela := StrToCurr(FormatCurr('0.00', valor_parcela));
  percentual_parcela := 100 / tparcelas;
  percentual_parcela := StrToFloat(FormatFloat('0.00', percentual_parcela));
  for I := 1 to tparcelas do
  begin
    umacontareceber := ContasReceber.Crieobj;
    //---------------------AQUI EU ESTOU CARREGANDO A FORMA DE PAGAMENTO PRA INSERIR NO CONTAS A RECERBER -------------
    umactrlordemservico.getctrlcondicao.Pesquisar(self.edtcodcondicao.Text);
    mcolecao := ColecaoParcelas (umaordemservico.getumaCondicao.getumacolecaop);
    mparcela := Parcelas (mcolecao.Carrega(I));
    mcodformapagamento := inttostr(mparcela.getumaformapagamento.getCodigo);
    mformapagamento := mparcela.getumaformapagamento.getpagamento;

   //------------------------------------------------------------------------------------------------------------------
    mcontareceber := i;
    pos := umaordemservico.getumacolecaoContasReceber.Pesquisa(mcontareceber, false);
    if pos = 0 then
    begin
      showmessage('PARCELA JA INSERIDA');
      exit;
    end
    else
    begin
      umacontareceber.setnumero_parcela(pos);
      dias_prazo :=I * 30;
      umacontareceber.setdata_vencimento(date + dias_prazo);
      umacontareceber.getumaformapagamento.setCodigo(strtoint(mcodformapagamento));
      umacontareceber.getumaformapagamento.setpagamento(mformapagamento);
      if i = tparcelas then
      begin
        valor_parcela := valor_venda - total;
        umacontareceber.setvalor_parcela(valor_parcela);
      end
      else
      begin
        umacontareceber.setvalor_parcela(valor_parcela);
        total := total + valor_parcela;
      end;
      self.umaordemservico.getumacolecaoContasReceber.insere(umacontareceber.clone, pos);
      self.carregaLV3;
      if pos >= tparcelas then
        self.carregaLV3
    end;
  end;
end;


procedure TFrmCadastroOrdemServ.btnpesquisaclienteClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultacliente.btnSair.Caption;
  umfrmconsultacliente.btnSair.Caption := 'SELECIONAR';
  umfrmconsultacliente.ConhecaObj(umaordemservico.getumcliente, umactrlordemservico.getctrlcliente);
  umfrmconsultacliente.ShowModal;

  umfrmconsultacliente.btnSair.Caption := mbotao;
  self.edtcodcliente.Text := inttostr(umaordemservico.getumcliente.getcodigo);
  self.edtcliente.Text := umaordemservico.getumcliente.getnome;
  self.edtendereco.Text := umaordemservico.getumcliente.getendereco;
  self.edtlimite.Text := floattostr(umaordemservico.getumcliente.getlimite);
  self.edtcelular.Text := umaordemservico.getumcliente.getcelular;
end;

procedure TFrmCadastroOrdemServ.btnpesquisacondicaoClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultacondicao.btnSair.Caption;
  umfrmconsultacondicao.btnSair.Caption := 'SELECIONAR';
  umfrmconsultacondicao.ConhecaObj(umaordemservico.getumacondicao, umactrlordemservico.getctrlcondicao);
  umfrmconsultacondicao.ShowModal;

  umfrmconsultacondicao.btnSair.Caption := mbotao;
  self.edtcodcondicao.Text := inttostr(umaordemservico.getumacondicao.getcodigo);
  self.edtcondicao.Text := umaordemservico.getumacondicao.getcondicao;
  self.edtparcelas.Text := inttostr(umaordemservico.getumacondicao.getnum_parcelas);
end;

procedure TFrmCadastroOrdemServ.btnpesquisacorClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultacor.btnSair.Caption;
  umfrmconsultacor.btnSair.Caption := 'SELECIONAR';
  umfrmconsultacor.ConhecaObj(umaordemservico.getumacor, umactrlordemservico.getctrlcor);
  umfrmconsultacor.ShowModal;

  umfrmconsultacor.btnSair.Caption := mbotao;
  self.edtcodcor.Text := inttostr(umaordemservico.getumacor.getcodigo);
  self.edtcor.Text := umaordemservico.getumacor.getcor;
end;

procedure TFrmCadastroOrdemServ.btnpesquisafuncionarioClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultafuncionario.btnSair.Caption;
  umfrmconsultafuncionario.btnSair.Caption := 'SELECIONAR';
  umfrmconsultafuncionario.ConhecaObj(umaordemservico.getumfuncionario, umactrlordemservico.getctrlfuncionario);
  umfrmconsultafuncionario.ShowModal;

  umfrmconsultafuncionario.btnSair.Caption := mbotao;
  self.edtcodtecnico.Text := inttostr(umaordemservico.getumfuncionario.getcodigo);
  self.edttecnico.Text := umaordemservico.getumfuncionario.getnome;
end;

procedure TFrmCadastroOrdemServ.btnpesquisamodeloClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultamodelo.btnSair.Caption;
  umfrmconsultamodelo.btnSair.Caption := 'SELECIONAR';
  umfrmconsultamodelo.ConhecaObj(umaordemservico.getummodelo, umactrlordemservico.getctrlmodelo);
  umfrmconsultamodelo.ShowModal;

  umfrmconsultamodelo.btnSair.Caption := mbotao;
  self.edtcodmodelo.Text := inttostr(umaordemservico.getummodelo.getcodigo);
  self.edtmodelo.Text := umaordemservico.getummodelo.getmodelo;
  self.edtmarca.Text := umaordemservico.getummodelo.getumamarca.getmarca;
end;

procedure TFrmCadastroOrdemServ.btnpesquisaprodutoClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultaproduto.btnSair.Caption;
  umfrmconsultaproduto.btnSair.Caption := 'SELECIONAR';
  umfrmconsultaproduto.ConhecaObj(umaordemservico.getumproduto, umactrlordemservico.getctrlproduto);
  umfrmconsultaproduto.ShowModal;

  umfrmconsultaproduto.btnSair.Caption := mbotao;
  self.edtcodproduto.Text := inttostr(umaordemservico.getumproduto.getcodigo);
  self.edtproduto.Text := umaordemservico.getumproduto.getdescricao;
  self.edtvalor_produto.Text := CurrtoStr(umaordemservico.getumproduto.getpreco_venda);
end;

procedure TFrmCadastroOrdemServ.btnpesquisaservicoClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultaservico.btnSair.Caption;
  umfrmconsultaservico.btnSair.Caption := 'SELECIONAR';
  umfrmconsultaservico.ConhecaObj(umaordemservico.getumservico, umactrlordemservico.getctrlservico);
  umfrmconsultaservico.ShowModal;

  umfrmconsultaservico.btnSair.Caption := mbotao;
  self.edtcodservico.Text := inttostr(umaordemservico.getumservico.getcodigo);
  self.edtservico.Text := umaordemservico.getumservico.getdescricao;
  self.edtvalor_servico.Text := CurrtoStr(umaordemservico.getumservico.getpreco_venda);
end;

procedure TFrmCadastroOrdemServ.btnpesquisausuarioClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultausuario.btnSair.Caption;
  umfrmconsultausuario.btnSair.Caption := 'SELECIONAR';
  umfrmconsultausuario.ConhecaObj(umaordemservico.getumusuario, umactrlordemservico.getctrlusuario);
  umfrmconsultausuario.ShowModal;

  umfrmconsultausuario.btnSair.Caption := mbotao;
  self.edtcodfuncionario.Text := inttostr(umaordemservico.getumusuario.getcodigo);
  self.edtfuncionario.Text := umaordemservico.getumusuario.getnome;
end;

procedure TFrmCadastroOrdemServ.btnremoveClick(Sender: TObject);
var cont : integer;
begin
  inherited;
  self.removeproduto;
  cont := self.Listview3.Items.Count;
  if cont > 0 then
  begin
  self.removecontasreceber;
  self.ListView3.Clear;
  self.edtcodcondicao.Clear;
  self.edtcondicao.Clear;
  self.edtparcelas.Clear;
  end;
end;

procedure TFrmCadastroOrdemServ.btnremovecontasreceberClick(Sender: TObject);
begin
  inherited;
  self.removecontasreceber;
  self.ListView3.Clear;
  self.edtcodcondicao.Clear;
  self.edtcondicao.Clear;
  self.edtparcelas.Clear;
end;

procedure TFrmCadastroOrdemServ.btnremoveservicoClick(Sender: TObject);
var cont : integer;
begin
  inherited;
  self.removeservico;
  cont := self.Listview3.Items.Count;
  if cont > 0 then
  begin
  self.removecontasreceber;
  self.ListView3.Clear;
  self.edtcodcondicao.Clear;
  self.edtcondicao.Clear;
  self.edtparcelas.Clear;
  end;
end;

procedure TFrmCadastroOrdemServ.CarregaEdt;
begin
  inherited;
  if umaordemservico.getstatus = 'ABERTA' then
    self.comboboxstatus.ItemIndex := 0
  else if umaordemservico.getstatus = 'FECHADA' then
    self.comboboxstatus.ItemIndex := 1
  else
    self.comboboxstatus.ItemIndex := 2;
  self.edtCodigo.Text := inttostr(umaordemservico.getnumero_os);
  self.edtdata_emissao.Date := umaordemservico.getdata_emissao;
  self.edthora_emissao.Text := timetostr(umaordemservico.gethora_emissao);
  self.edtcodcliente.Text := inttostr(umaordemservico.getumcliente.getCodigo);
  self.edtcliente.Text := umaordemservico.getumcliente.getnome;
  self.edtendereco.Text := umaordemservico.getumcliente.getendereco;
  self.edtlimite.Text := floattostr(umaordemservico.getumcliente.getlimite);
  self.edtcelular.Text := umaordemservico.getumcliente.getcelular;
  self.edtcodmodelo.Text := inttostr(umaordemservico.getummodelo.getcodigo);
  self.edtmodelo.Text := umaordemservico.getummodelo.getmodelo;
  self.edtmarca.Text := umaordemservico.getummodelo.getumamarca.getmarca;
  self.edtplaca.Text := umaordemservico.getplaca_veiculo;
  self.edtanomodelo.Text := umaordemservico.getano_veiculo;
  self.edtcodcor.Text := inttostr(umaordemservico.getumacor.getcodigo);
  self.edtcor.Text := umaordemservico.getumacor.getcor;
  self.edtobs.Text := umaordemservico.getobs;
  self.edttotalproduto.Text := currtostr(umaordemservico.gettotal_produtos);
  self.edttotalservico.Text := currtostr(umaordemservico.gettotal_servicos);
  self.edtoutrasdespesas.Text := currtostr(umaordemservico.getoutras_despesas);
  self.edtdesconto.Text := currtostr(umaordemservico.getdesconto);
  self.edttotalos.Text := currtostr(umaordemservico.gettotal_os);
  self.edtCadastro.Text := DateToStr(umaordemservico.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umaordemservico.getUlt_Alt);
  self.edtproblema.Text := umaordemservico.getproblema_veiculo;
  self.edtcodcondicao.Text := inttostr(umaordemservico.getumacondicao.getCodigo);
  self.edtcondicao.Text := umaordemservico.getumacondicao.getcondicao;
  self.edtparcelas.Text := inttostr(umaordemservico.getumacondicao.getnum_parcelas);
  self.edtcodfuncionario.Text := inttostr(umaordemservico.getumusuario.getCodigo);
  self.edtfuncionario.Text := umaordemservico.getumusuario.getnome;
end;

procedure TFrmCadastroOrdemServ.carregaLV2;
var mcolecao : ColecaoServicos;
    tam, k : integer;
    itemLV : TListItem;
    mitem : Item;
    mpreco_venda, mvalor_desconto, mvalor_liq, mtotal : currency;
begin
  mcolecao := ColecaoServicos (umaordemservico.getumacolecaoservico);
  ListView2.Clear;
  tam := mcolecao.getQtd;
  for k := 1 to tam do
  begin
    mitem := Item (mcolecao.Carrega(k));
    itemLV := ListView2.Items.Add;
    itemLV.Caption := inttostr(mitem.getumproduto.getCodigo);
    itemLV.SubItems.Add(mitem.getumproduto.getdescricao);
    itemLV.SubItems.Add(inttostr(mitem.getQtd));
    mpreco_venda := mitem.getumproduto.getpreco_venda;
    itemLV.SubItems.Add(floattostr(mpreco_venda));
    itemLV.SubItems.Add(floattostr(mitem.getDesconto));
    itemLV.SubItems.Add(Currtostr(mitem.getvalor_desconto * mitem.getQtd));
    itemLV.SubItems.Add(Currtostr(mitem.getvalor_liquido * mitem.getQtd));
    itemLV.SubItems.Add(Currtostr(mitem.getvalor_total - (mitem.getvalor_desconto * mitem.getQtd)));
    itemLV.SubItems.Add(inttostr(mitem.getumfuncionario.getCodigo));
    itemLV.SubItems.Add(mitem.getumfuncionario.getnome);
  end;
end;

procedure TFrmCadastroOrdemServ.CarregaLV;
var mcolecao : ColecaoProdutos;
    tam, k : integer;
    itemLV : TListItem;
    mitem : Item;
    mpreco_venda, mvalor_desconto, mvalor_liq, mtotal : currency;
begin
  mcolecao := ColecaoProdutos (umaordemservico.getumacolecaoproduto);
  ListView1.Clear;
  tam := mcolecao.getQtd;
  for k := 1 to tam do
  begin
    mitem := Item (mcolecao.Carrega(k));
    itemLV := ListView1.Items.Add;
    itemLV.Caption := inttostr(mitem.getumproduto.getCodigo);
    itemLV.SubItems.Add(mitem.getumproduto.getdescricao);
    itemLV.SubItems.Add(mitem.getumproduto.getund);
    itemLV.SubItems.Add(inttostr(mitem.getQtd));
    mpreco_venda := mitem.getumproduto.getpreco_venda;
    mpreco_venda := strtofloat(FormatCurr('###,##0.00', mpreco_venda));
    itemLV.SubItems.Add(Currtostr(mpreco_venda));
    itemLV.SubItems.Add(Currtostr(mitem.getDesconto));
    itemLV.SubItems.Add(Currtostr(mitem.getvalor_desconto * mitem.getQtd));
    itemLV.SubItems.Add(floattostr(mitem.getvalor_liquido * mitem.getQtd));
    itemLV.SubItems.Add(Currtostr(mitem.getvalor_total - (mitem.getvalor_desconto * mitem.getQtd)));
  end;
end;

procedure TFrmCadastroOrdemServ.carregaLV3;
var mcolecao : ColecaoContasreceber;
    tam, k, prazo : integer;
    dias_prazo : extended;
    itemLV : TListItem;
    mcontareceber : Contasreceber;
    mpercent : Currency;
    vencimento, hoje : TDate;
begin
  mcolecao := ColecaoContasreceber (umaordemservico.getumacolecaoContasreceber);
  ListView3.Clear;
  tam := mcolecao.getQtd;
  for k := 1 to tam do
  begin
    mcontareceber := Contasreceber (mcolecao.Carrega(k));
    dias_prazo := (mcontareceber.getdata_vencimento - date);
    vencimento := mcontareceber.getdata_vencimento;
    hoje := Date;
    dias_prazo := vencimento - hoje;
    prazo := Trunc(dias_prazo);
    mpercent := (100 / tam) * k;
    itemLV := ListView3.Items.Add;
    itemLV.Caption := inttostr(mcontareceber.getnumero_parcela);
    itemLV.SubItems.Add(inttostr(prazo));
    itemLV.SubItems.Add(floattostr(strtofloat(formatfloat('#0.00', mpercent))));
    itemLV.SubItems.Add(inttostr(mcontareceber.getumaformapagamento.getCodigo));
    itemLV.SubItems.Add(mcontareceber.getumaformapagamento.getpagamento);
    itemLV.SubItems.Add(floattostr(strtofloat(formatfloat('#0.00', mcontareceber.getvalor_parcela))));
    itemLV.SubItems.Add(DatetoStr(mcontareceber.getdata_vencimento));
  end;
end;

procedure TFrmCadastroOrdemServ.ConhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umaordemservico := Ordemservicos(pObj);
  umactrlordemservico := ControllerOrdemServicos(pctrl);
  self.edtCodigo.Text := inttostr(self.umaordemservico.getcodigo);
  self.edtoutrasdespesas.Text := floattostr(self.umaordemservico.getoutras_despesas);
  self.edtCadastro.Text := DateToStr(self.umaordemservico.getCadastro);
  self.edtUlt_alt.Text := DateToStr(self.umaordemservico.getUlt_Alt);
  self.edthora_emissao.Text := timetostr(self.umaordemservico.gethora_emissao);
  self.edtdata_emissao.Date := self.umaordemservico.getdata_emissao;
end;

procedure TFrmCadastroOrdemServ.DesbloqueiaEdt;
begin
  inherited;
  self.edtcodcliente.enabled := true;
  self.edtcodmodelo.enabled := true;
  self.edtcodproduto.enabled := true;
  self.edtplaca.enabled := true;
  self.edtobs.enabled := true;
  self.edtcodfuncionario.Enabled := true;
  self.edtfuncionario.Enabled := true;
  self.edtproblema.Enabled := true;
  self.edthora_emissao.Enabled := true;
  self.edtcodtecnico.Enabled := true;
  self.edttecnico.Enabled := true;
  self.edtcodservico.Enabled := true;
  self.edtservico.Enabled := true;
  self.edtcodcor.Enabled := true;
  self.edtcodcondicao.Enabled := true;
  self.edtcondicao.Enabled := true;
  self.edtparcelas.Enabled := true;
  self.edtdescproduto.Enabled := true;
  self.edtdescservico.Enabled := true;
  self.edtvalor_produto.Enabled := true;
  self.edtqtd_produto.Enabled := true;
  self.edtqtd_servico.Enabled := true;
  self.comboboxstatus.Enabled := true;
end;

procedure TFrmCadastroOrdemServ.destroy_colecao;
var mcolecao : ColecaoProdutos;
    mcolecaoservico : ColecaoServicos;
    mcolecaocontasreceber : ColecaoContasReceber;
    mcolecaoproduto_remove : ColecaoProdutos;
    mcolecaoservico_remove : ColecaoServicos;
    mcolecaocontasreceber_remove : ColecaoContasReceber;
    tamanho_produto, tamanho_servico, tamanho_contasreceber,
    tamanho_produtoremove, tamanho_servicoremove, tamanho_contasreceberremove, k : integer;
begin
  mcolecao := self.umaordemservico.getumacolecaoproduto;
  mcolecaocontasreceber := self.umaordemservico.getumacolecaocontasreceber;
  mcolecaoservico := self.umaordemservico.getumacolecaoservico;
  tamanho_produto := mcolecao.getQtd;
  tamanho_servico := mcolecaoservico.getQtd;
  tamanho_contasreceber := mcolecaocontasreceber.getQtd;
  //tamanho_produtoremove := mcolecaoproduto_remove.getQtd;
  //tamanho_servicoremove := mcolecaoservico_remove.getQtd;
  //tamanho_contasreceberremove := mcolecaocontasreceber_remove.getQtd;
  mcolecaoproduto_remove := self.umaordemservico.getumacolecaoproduto_remove;
  mcolecaoservico_remove := self.umaordemservico.getumacolecaoservico_remove;
  mcolecaocontasreceber_remove := self.umaordemservico.getumacolecaocontasreceber_remove;
  for k := 1 to tamanho_produto do
  begin
    mcolecao.remove(k);
  end;
  for k := 1 to tamanho_contasreceber do
  begin
    mcolecaocontasreceber.remove(k);
  end;
  for k := 1 to tamanho_servico do
  begin
    mcolecaoservico.remove(k);
  end;
  umaordemservico.getumacolecaoproduto_remove.setQtd(0);
  umaordemservico.getumacolecaoservico_remove.setQtd(0);
  umaordemservico.getumacolecaocontasreceber_remove.setQtd(0);
end;

procedure TFrmCadastroOrdemServ.edtcodclienteExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  if self.edtcodcliente.Text = '' then
  begin
    self.edtcodcliente.Text := '';
    self.edtcliente.Text := '';
    self.edtendereco.Text := '';
    self.edtcelular.Text := '';
    self.edtlimite.Text :=  '';
  end
  else
  begin
    mMSG := umactrlordemservico.getctrlcliente.Pesquisar(self.edtcodcliente.Text);
    umactrlordemservico.getctrlcliente.Carregar(umaordemservico.getumcliente);
    self.edtcodcliente.Text := inttostr(umaordemservico.getumcliente.getCodigo);
    self.edtcliente.Text := umaordemservico.getumcliente.getnome;
    self.edtendereco.Text := umaordemservico.getumcliente.getendereco;
    self.edtlimite.Text := floattostr(umaordemservico.getumcliente.getlimite);
    self.edtcelular.Text := umaordemservico.getumcliente.getcelular;
    if self.edtcodcliente.Text = inttostr(0) then
    begin
      ShowMessage('Cliente n�o Encontrado!');
      self.edtcodcliente.SetFocus;
    end;
  end;

end;

procedure TFrmCadastroOrdemServ.edtcodcondicaoExit(Sender: TObject);
var
  mMSG: string;
  mcolecao : ColecaoParcelas;
  tamanho, i : integer;
  mparcela : Parcelas;
begin
  inherited;
  if self.edtcodcondicao.Text = '' then
  begin
    self.edtcodcondicao.Text := '';
    self.edtcondicao.Text := '';
    self.edtparcelas.Text := '';
  end
  else
  begin
    mMSG := umactrlordemservico.getctrlcondicao.Pesquisar(self.edtcodcondicao.Text);
    umactrlordemservico.getctrlcondicao.Carregar(umaordemservico.getumacondicao);
    self.edtcodcondicao.Text := inttostr(umaordemservico.getumacondicao.getcodigo);
    self.edtcondicao.Text := umaordemservico.getumacondicao.getcondicao;
    self.edtparcelas.Text := inttostr(umaordemservico.getumaCondicao.getnum_parcelas);
    self.edtcondicao.Enabled := false;
    self.edtparcelas.Enabled := false;
    if self.edtcodcondicao.Text = inttostr(0) then
    begin
      ShowMessage('Condi��o n�o encontrada');
      self.edtcodcondicao.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroOrdemServ.edtcodcorExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  if self.edtcodcor.Text = '' then
  begin
    self.edtcodcor.Text := '';
    self.edtcor.Text := '';
  end
  else
  begin
    mMSG := umactrlordemservico.getctrlcor.Pesquisar(self.edtcodcor.Text);
    umactrlordemservico.getctrlcor.Carregar(umaordemservico.getumacor);
    self.edtcodcor.Text := inttostr(umaordemservico.getumacor.getCodigo);
    self.edtcor.Text := umaordemservico.getumacor.getcor;
    if self.edtcodcor.Text = inttostr(0) then
    begin
      ShowMessage('Cor n�o Encontrada!');
      self.edtcodcor.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroOrdemServ.edtcodfuncionarioExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  if self.edtcodfuncionario.Text = '' then
  begin
    self.edtcodfuncionario.Text := '';
    self.edtfuncionario.Text := '';
  end
  else
  begin
    mMSG := umactrlordemservico.getctrlusuario.Pesquisar(self.edtcodfuncionario.Text);
    umactrlordemservico.getctrlusuario.Carregar(umaordemservico.getumusuario);
    self.edtcodfuncionario.Text := inttostr(umaordemservico.getumusuario.getCodigo);
    self.edtfuncionario.Text := umaordemservico.getumusuario.getnome;
    if self.edtcodfuncionario.Text = inttostr(0) then
    begin
      ShowMessage('Usuario n�o Encontrado!');
      self.edtcodfuncionario.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroOrdemServ.edtcodmodeloExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  if self.edtcodmodelo.Text = '' then
  begin
    self.edtcodmodelo.Text := '';
    self.edtmodelo.Text := '';
  end
  else
  begin
    mMSG := umactrlordemservico.getctrlmodelo.Pesquisar(self.edtcodmodelo.Text);
    umactrlordemservico.getctrlmodelo.Carregar(umaordemservico.getummodelo);
    self.edtcodmodelo.Text := inttostr(umaordemservico.getummodelo.getCodigo);
    self.edtmodelo.Text := umaordemservico.getummodelo.getmodelo;
    self.edtmarca.Text := umaordemservico.getummodelo.getumamarca.getmarca;
    if self.edtcodmodelo.Text = inttostr(0) then
    begin
      ShowMessage('Modelo n�o Encontrado!');
      self.edtcodmodelo.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroOrdemServ.edtcodprodutoExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  if self.edtcodproduto.Text = '' then
  begin
    self.edtcodproduto.Text := '';
    self.edtproduto.Text := '';
    self.edtund.Text := '';
    self.edtvalor_produto.Text := '';
  end
  else
  begin
    mMSG := umactrlordemservico.getctrlproduto.Pesquisar(self.edtcodproduto.Text);
    umactrlordemservico.getctrlproduto.Carregar(umaordemservico.getumproduto);
    self.edtcodproduto.Text := inttostr(umaordemservico.getumproduto.getcodigo);
    self.edtproduto.Text := umaordemservico.getumproduto.getdescricao;
    self.edtund.Text := umaordemservico.getumproduto.getund;
    self.edtvalor_produto.Text := floattostr(umaordemservico.getumproduto.getpreco_venda);
    self.edtvalor_produto.Text:= FormatCurr('###,##0.00', StrtoCurr(self.edtvalor_produto.Text));
    if self.edtcodproduto.Text = inttostr(0) then
    begin
      ShowMessage('Produto n�o encontrado');
      self.edtcodproduto.SetFocus;
    end
    else
    begin
      if self.umaordemservico.getumproduto.getestoque <= 0 then
      begin
        showmessage('Produto sem estoque');
        self.edtcodproduto.SetFocus;
      end
      else
      begin
        self.edtproduto.Enabled := false;
        self.edtqtd_produto.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmCadastroOrdemServ.edtcodservicoExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  if self.edtcodservico.Text = '' then
  begin
    self.edtcodservico.Text := '';
    self.edtservico.Text := '';
  end
  else
  begin
    mMSG := umactrlordemservico.getctrlservico.Pesquisar(self.edtcodservico.Text);
    umactrlordemservico.getctrlservico.Carregar(umaordemservico.getumservico);
    self.edtcodservico.Text := inttostr(umaordemservico.getumservico.getcodigo);
    self.edtservico.Text := umaordemservico.getumservico.getdescricao;
    self.edtvalor_servico.Text := floattostr(umaordemservico.getumservico.getpreco_venda);
    if self.edtcodservico.Text = inttostr(0) then
    begin
      ShowMessage('Servi�o n�o encontrado');
      self.edtcodservico.SetFocus;
    end
    else
    begin
      self.edtservico.Enabled := false;
      self.edtvalor_servico.Enabled := false;
      self.edtqtd_servico.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroOrdemServ.edtcodtecnicoExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  if self.edtcodtecnico.Text = '' then
  begin
    self.edtcodtecnico.Text := '';
    self.edttecnico.Text := '';
  end
  else
  begin
    mMSG := umactrlordemservico.getctrlfuncionario.Pesquisar(self.edtcodtecnico.Text);
    umactrlordemservico.getctrlfuncionario.Carregar(umaordemservico.getumfuncionario);
    self.edtcodtecnico.Text := inttostr(umaordemservico.getumfuncionario.getCodigo);
    self.edttecnico.Text := umaordemservico.getumfuncionario.getnome;
    if self.edtcodtecnico.Text = inttostr(0) then
    begin
      ShowMessage('Funcion�rio n�o Encontrado!');
      self.edtcodtecnico.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroOrdemServ.edtdescontoExit(Sender: TObject);
var despesas, desconto, produtos, servicos : Currency;
    total : real;
begin
  if self.edtoutrasdespesas.Text <> '' then
    despesas := StrtoCurr(self.edtoutrasdespesas.Text)
  else
    despesas := 0;
  if self.edtdesconto.Text <> '' then
    desconto := StrtoCurr(self.edtdesconto.Text)
  else
    desconto := 0;
  if self.edttotalproduto.Text <> '' then
    produtos := StrtoCurr(self.edttotalproduto.Text)
  else
    produtos := 0;
  if self.edttotalservico.Text <> '' then
    servicos := StrtoCurr(self.edttotalservico.Text)
  else
    servicos := 0;
  total := despesas + produtos + servicos - desconto;
  self.edttotalos.Text := floattostr(total);
  self.edttotalos.Text:= FormatCurr('###,##0.00', StrtoCurr(edttotalos.Text));
end;

procedure TFrmCadastroOrdemServ.edtdescprodutoExit(Sender: TObject);
var valor_prod, valor_desconto : currency;
desconto_produto : real;
begin
  if (self.edtdescproduto.Text <> '') AND (self.edtvalor_produto.Text <> '') then
  begin
    valor_prod := (strtofloat(self.edtvalor_produto.Text) - (strtofloat(self.edtvalor_produto.Text) * strtofloat(self.edtdescproduto.Text) / 100)) * strtofloat(self.edtqtd_produto.Text);
    self.edtvalor_produto.Text:= FormatCurr('###,##0.00', StrtoCurr(self.edtvalor_produto.Text));
    self.edttotal_produto.Text := CurrtoStr(valor_prod);
    self.edttotal_produto.Text:= FormatCurr('###,##0.00', StrtoCurr(edttotal_produto.Text));
    self.edttotal_produto.Enabled := false;
    self.btnaddproduto.Enabled := true;
    desconto_produto := strtofloat(self.edtdescproduto.Text);
    if desconto_produto > 100 then
    begin
      showmessage('Desconto n�o pode Ser maior que 100%');
      self.edtdescproduto.SetFocus;
    end
    else
    begin

    end;
  end;
end;

procedure TFrmCadastroOrdemServ.edtdescservicoExit(Sender: TObject);
var valor_servico, valor_desconto : currency;
  desconto_servico : real;
begin
  if (self.edtdescservico.Text <> '') AND (self.edtvalor_servico.Text <> '') then
  begin
    valor_servico := (strtofloat(self.edtvalor_servico.Text) - (strtofloat(self.edtvalor_servico.Text) * strtofloat(self.edtdescservico.Text) / 100)) * strtofloat(self.edtqtd_servico.Text);
    self.edtvalor_servico.Text:= FormatCurr('###,##0.00', StrtoCurr(self.edtvalor_servico.Text));
    self.edttotal_servico.Text := CurrtoStr(valor_servico);
    self.edttotal_servico.Text:= FormatCurr('###,##0.00', StrtoCurr(edttotal_servico.Text));
    self.edttotal_servico.Enabled := false;
    self.btnaddservico.Enabled := true;
    desconto_servico := strtofloat(self.edtdescservico.Text);
    if desconto_servico > 100 then
    begin
      showmessage('Desconto n�o pode Ser maior que 100%');
      self.edtdescservico.SetFocus;
    end
    else
    begin

    end;

  end;

end;

procedure TFrmCadastroOrdemServ.edtoutrasdespesasExit(Sender: TObject);
begin
  if self.edtoutrasdespesas.Text = '' then
  begin
    self.edtoutrasdespesas.Text := Currtostr(0.00);
    self.edtdesconto.Text:= FormatCurr('###,##0.00', StrtoCurr(edtdesconto.Text));
  end
  else
  begin
    self.atualizavalores;
  end;
end;

procedure TFrmCadastroOrdemServ.edtqtd_produtoExit(Sender: TObject);
var valor_prod : currency;
begin
  if self.edtqtd_produto.Text <> '' then
  begin
  if self.edtvalor_produto.Text <> '' then
  begin
    valor_prod := (strtoCurr(self.edtqtd_produto.Text) * strtoCurr(self.edtvalor_produto.Text));
    self.edttotal_produto.Text := CurrtoStr(valor_prod);
    self.edttotal_produto.Text:= FormatCurr('###,##0.00', StrtoCurr(edttotal_produto.Text));
    self.edttotal_produto.Enabled := false;
    self.btnaddproduto.Enabled := true;
  end
  else
  end;
end;

procedure TFrmCadastroOrdemServ.edtqtd_servicoExit(Sender: TObject);
var valor_servico : currency;
begin
  if self.edtqtd_servico.Text <> '' then
  begin
  if self.edtvalor_servico.Text <> '' then
  begin
    valor_servico := (strtoCurr(self.edtqtd_servico.Text) * strtoCurr(self.edtvalor_servico.Text));
    self.edttotal_servico.Text := CurrtoStr(valor_servico);
    self.edttotal_servico.Text:= FormatCurr('###,##0.00', StrtoCurr(edttotal_servico.Text));
    self.edttotal_servico.Enabled := false;
    self.btnaddservico.Enabled := true;
  end
  else
  end;
end;

procedure TFrmCadastroOrdemServ.LimpaEdt;
begin
  inherited;
  self.edtcodcliente.Clear;
  self.edtcliente.Clear;
  self.edtcodmodelo.Clear;
  self.edtmodelo.Clear;
  self.edtendereco.Clear;
  self.edtlimite.Clear;
  self.edtcodproduto.Clear;
  self.edtproduto.Clear;
  self.edtmarca.Clear;
  self.edtmodelo.Clear;
  self.edtplaca.Clear;
  self.edtobs.Clear;
  self.edttotalproduto.Clear;
  self.edttotalservico.Clear;
  self.edtoutrasdespesas.Clear;
  self.edtdesconto.Clear;
  self.edttotalos.Clear;
  self.edthora_emissao.Clear;
  self.edtcodfuncionario.Clear;
  self.edtfuncionario.Clear;
  self.edtcelular.Clear;
  self.ListView1.Clear;
  self.ListView2.Clear;
  self.ListView3.Clear;
  self.edtanomodelo.Clear;
  self.edtproblema.Clear;
  self.edtcodcor.Clear;
  self.edtcor.Clear;
  self.edtcodcondicao.Clear;
  self.edtcondicao.Clear;
  self.edtparcelas.Clear;
  end;

procedure TFrmCadastroOrdemServ.removecontasreceber;
var mcolecaocontasreceber : ColecaoContasReceber;
    tamanho_contasreceber, k : integer;
begin
  mcolecaocontasreceber := self.umaordemservico.getumacolecaocontasreceber;
  tamanho_contasreceber := mcolecaocontasreceber.getQtd;
  for k := 1 to tamanho_contasreceber do
  begin
    mcolecaocontasreceber.remove(k);
  end;
end;

procedure TFrmCadastroOrdemServ.removeproduto;
var pos,  cont : integer;
    total, valor_produto : real;
    mitem : string;
    itemLV : TListItem;
begin
    mitem := self.ListView1.Selected.SubItems[0];
    pos := umaordemservico.getumacolecaoproduto.Pesquisa(mitem, true);
  if pos = 0 then
  begin
    showmessage('PRODUTO JA N�O ENCONTRADO');
    //self.edtproduto.SetFocus;
  end
  else
  begin
    self.umaordemservico.getumacolecaoproduto.remove(pos);
    self.CarregaLV;
    ShowMessage('Produto Removido!!!');
  end;
  self.atualizavalores;
end;

procedure TFrmCadastroOrdemServ.removeservico;
var pos,  cont : integer;
    total, valor_servico : real;
    mitem : string;
    itemLV : TListItem;
begin
    mitem := self.ListView2.Selected.SubItems[0];
    pos := umaordemservico.getumacolecaoservico.Pesquisa(mitem, true);
  if pos = 0 then
  begin
    showmessage('SERVI�O N�O ENCONTRADO');
    //self.edtproduto.SetFocus;
  end
  else
  begin
    self.umaordemservico.getumacolecaoservico.remove(pos);
    self.CarregaLV2;
    ShowMessage('Servico Removido!!!');
  end;
  self.atualizavalores;
end;

procedure TFrmCadastroOrdemServ.Sair;
begin
  self.destroy_colecao;
  inherited;
end;

procedure TFrmCadastroOrdemServ.Salvar;
var mstatus : string;
begin
  inherited;
  if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclus�o ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlordemservico.Excluir(umaordemservico);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if self.edtfuncionario.Text = '' then
    begin
      ShowMessage('Campo Precisa ser preenchido!');
      self.edtcodfuncionario.SetFocus;
    end
    else if self.comboboxstatus.ItemIndex < 0 then
    begin
      ShowMessage('Campo Precisa ser preenchido!');
      self.comboboxstatus.SetFocus;
    end
    else if self.edtcliente.Text = '' then
    begin
      ShowMessage('Campo Precisa ser preenchido!');
      self.edtcliente.SetFocus;
    end
    else if self.edtmodelo.Text = '' then
    begin
      ShowMessage('Campo Precisa ser preenchido!');
      self.edtmodelo.SetFocus;
    end
    else if self.edtplaca.Text = '' then
    begin
      ShowMessage('Campo Precisa ser preenchido!');
      self.edtplaca.SetFocus;
    end
    else if self.edtcor.Text = '' then
    begin
      ShowMessage('Campo Precisa ser preenchido!');
      self.edtcor.SetFocus;
    end
    else
    begin
      if self.comboboxstatus.ItemIndex = 0 then
      begin
        mstatus := 'ABERTA';
      end
      else if self.comboboxstatus.ItemIndex = 1 then
      begin
        mstatus := 'FECHADA';
      end
      else
      begin
        mstatus := 'CANCELADA';
      end;
      umaordemservico.setnumero_os(strtoint(self.edtCodigo.Text));
      umaordemservico.setdata_emissao(self.edtdata_emissao.Date);
      umaordemservico.sethora_emissao(strtotime(self.edthora_emissao.Text));
      umaordemservico.getumusuario.setCodigo(strtoint(self.edtcodfuncionario.Text));
      umaordemservico.setstatus(mstatus);
      umaordemservico.getumcliente.setCodigo(strtoint(self.edtcodcliente.Text));
      umaordemservico.setobs(self.edtobs.Text);
      umaordemservico.settotal_produtos(strtoCurr(self.edttotalproduto.Text));
      umaordemservico.settotal_servicos(strtoCurr(self.edttotalservico.Text));
      umaordemservico.setoutras_despesas(strtocurr(self.edtoutrasdespesas.Text));
      umaordemservico.setdesconto(strtocurr(self.edtdesconto.Text));
      umaordemservico.settotal_os(strtocurr(self.edttotalos.Text));
      umaordemservico.setplaca_veiculo(self.edtplaca.Text);
      umaordemservico.setano_veiculo(self.edtanomodelo.Text);
      umaordemservico.getumacor.setcodigo(strtoint(self.edtcodcor.Text));
      umaordemservico.getummodelo.setcodigo(strtoint(self.edtcodmodelo.Text));
      umaordemservico.setproblema_veiculo(self.edtproblema.Text);
      umaordemservico.setCadastro(StrToDate(self.edtCadastro.Text));
      umaordemservico.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
      umactrlordemservico.Salvar(umaordemservico.clone);
      self.destroy_colecao;
      ShowMessage('Salvo com Sucesso!!!');
      self.Sair;
    end;

  end;
end;

procedure TFrmCadastroOrdemServ.SetFrmConsultacliente(pObj: TObject);
begin
  umfrmconsultacliente := TFrmConsultaCliente(pObj);
end;

procedure TFrmCadastroOrdemServ.setfrmconsultacondicao(pObj: TObject);
begin
  umfrmconsultacondicao := TFrmConsultaCondicao(pObj);
end;

procedure TFrmCadastroOrdemServ.setFrmConsultacor(pObj: TObject);
begin
  umfrmconsultacor := TFrmConsultaCor(pObj);
end;

procedure TFrmCadastroOrdemServ.setfrmconsultafuncionario(pObj: TObject);
begin
  umfrmconsultafuncionario := TFrmConsultaFuncionario(pObj);
end;

procedure TFrmCadastroOrdemServ.setFrmConsultamodelo(pObj: TObject);
begin
  umfrmconsultamodelo := TFrmconsultamodelo(pObj);
end;

procedure TFrmCadastroOrdemServ.SetFrmConsultaproduto(pObj: TObject);
begin
  umfrmconsultaproduto := TFrmConsultaProduto(pObj);
end;

procedure TFrmCadastroOrdemServ.setFrmConsultaservico(pObj: TObject);
begin
  umfrmconsultaservico := TFrmConsultaServicos(pObj);
end;

procedure TFrmCadastroOrdemServ.SetFrmConsultausuario(pObj: TObject);
begin
  umfrmconsultausuario := TFrmConsultaUsuario(pObj);
end;

procedure TFrmCadastroOrdemServ.SetFrmConsultaveiculo(pObj: TObject);
begin
  umfrmconsultaveiculo := TFrmConsultaCarro(pObj);
end;

end.
