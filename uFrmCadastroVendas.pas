unit uFrmCadastroVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls, Vcl.Buttons,
  uFrmConsultaCondicao, uItem, uFrmConsultacliente, uFrmConsultaProduto, uControllervenda_Produtos, uvenda_Produtos, uColecaoProdutos,
  uColecaoContasreceber, Vcl.Mask, uContasReceber, uFrmConsultaFormaPagamento, uColecaoServicos, uFrmConsultaServicos,
  Vcl.DBCtrls, Vcl.Samples.Spin, Vcl.ComCtrls, uColecaoParcelas, uParcelas;

type
  TFrmCadastroVendas = class(TFrmCadastro)
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    btnpesquisacliente: TSpeedButton;
    edtcodcliente: TEdit;
    edtcliente: TEdit;
    Label18: TLabel;
    Label22: TLabel;
    edtserie: TEdit;
    edtmodelo: TEdit;
    Label3: TLabel;
    DateTimePickervenda: TDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label4: TLabel;
    btnadicionar: TSpeedButton;
    btnremove: TSpeedButton;
    Label13: TLabel;
    Label30: TLabel;
    edtcodproduto: TEdit;
    edtproduto: TEdit;
    edtvalor_produto: TEdit;
    ListView1: TListView;
    edtqtd: TSpinEdit;
    edtund: TEdit;
    Label32: TLabel;
    edttotalvenda: TMaskEdit;
    Label25: TLabel;
    edtlimite: TEdit;
    Label1: TLabel;
    edtdescproduto: TEdit;
    Label7: TLabel;
    edttotalproduto: TMaskEdit;
    Label16: TLabel;
    edttotaldesconto: TMaskEdit;
    Label17: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    btnpesquisacondicao: TSpeedButton;
    Label31: TLabel;
    btngeraparcela: TSpeedButton;
    ListView3: TListView;
    edtcodcondicao: TEdit;
    edtcondicao: TEdit;
    edtparcelas: TEdit;
    edttotal_produto: TMaskEdit;
    procedure btnpesquisaclienteClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtcodprodutoExit(Sender: TObject);
    procedure btnadicionarClick(Sender: TObject);
    procedure edtcodclienteExit(Sender: TObject);
    procedure edtdescprodutoExit(Sender: TObject);
    procedure edtcodcondicaoExit(Sender: TObject);
    procedure btnpesquisacondicaoClick(Sender: TObject);
    procedure btngeraparcelaClick(Sender: TObject);
    procedure btnremoveClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umfrmconsultacondicao: TFrmConsultaCondicao;
    umfrmconsultacliente: TFrmconsultacliente;
    umfrmconsultaproduto : TFrmconsultaproduto;
    umfrmconsultaformapagamento : TFrmConsultaFormaPagamento;
    umfrmconsultaservico  : TFrmConsultaServicos;
    umavendaproduto : Venda_Produtos;
    umItem : Item;
    umacontareceber : ContasReceber;
    umactrlvendaproduto : Controllervenda_produtos;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pctrl: TObject);
    procedure Salvar;
    procedure Sair;
    procedure CarregaEdt;
    procedure LimpaEdt;
    procedure BloqueiaEdt;
    procedure DesbloqueiaEdt;
    procedure SetFrmConsultaCliente(pObj: TObject);
    procedure SetFrmConsultaCondicao(pObj: TObject);
    procedure SetFrmConsultaProduto(pObj: TObject);
    procedure SetFrmConsultaFormaPagamento(pObj: TObject);
    procedure SetFrmConsultaservico(pObj: TObject);
    procedure addproduto;
    procedure carregaLV;
    procedure removeproduto;
    procedure carregaLV3;
    procedure atualizavalores;
  end;

var
  FrmCadastroVendas: TFrmCadastroVendas;

implementation

{$R *.dfm}

{ TFrmCadastroVendas }

procedure TFrmCadastroVendas.addproduto;
var pos,  cont, k : integer;
    total, valor, subtotal, desconto : currency;
    mitem : string;
    pitem : Item;
    mcolecao : ColecaoProdutos;
begin
    k := 0;
    total := 0;
    desconto := 0;
    mitem := self.edtproduto.Text;
    pos := umavendaproduto.getumacolecaoproduto.Pesquisa(mitem, false);
    if pos = 0 then
    begin
      pos := umavendaproduto.getumacolecaoproduto.Pesquisa(mitem, true);
      pitem := Item (umavendaproduto.getumacolecaoproduto.Carrega(pos));
      self.umavendaproduto.getumacolecaoproduto.remove(pos);
      umitem.getumproduto.setCodigo(strtoint(self.edtcodproduto.Text));
      umitem.getumproduto.setdescricao(self.edtproduto.Text);
      umitem.getumproduto.setund(self.edtund.Text);
      umitem.getumproduto.setpreco_venda(strtofloat(self.edtvalor_produto.Text));
      umitem.setDesconto(strtofloat(self.edtdescproduto.Text));
      subtotal := strtofloat(self.edtvalor_produto.Text) * strtoint(self.edtqtd.Text);
      umitem.setvalor_total(subtotal + pitem.getvalor_total);
      umitem.SetQtd(strtoint(self.edtqtd.Text)+ pitem.getQtd);
      self.umavendaproduto.getumacolecaoproduto.insere(umitem.clone, pos);
      self.carregaLV;
    end
    else
    begin
      umitem.getumproduto.setCodigo(strtoint(self.edtcodproduto.Text));
      umitem.getumproduto.setdescricao(self.edtproduto.Text);
      umitem.getumproduto.setund(self.edtund.Text);
      umitem.getumproduto.setpreco_venda(strtofloat(self.edtvalor_produto.Text));
      umitem.setDesconto(strtofloat(self.edtdescproduto.Text));
      subtotal := strtofloat(self.edtvalor_produto.Text) * strtoint(self.edtqtd.Text);
      umitem.setvalor_total(subtotal);
      umitem.SetQtd(strtoint(self.edtqtd.Text));
      self.umavendaproduto.getumacolecaoproduto.insere(umitem.clone, pos);
      self.carregaLV;
    end;
    self.atualizavalores;
end;

procedure TFrmCadastroVendas.atualizavalores;
var mtotalprodutos, mtotalservicos, mtotaldescontos, mtotalvenda : Currency;
    cont, k, j : integer;
begin
  mtotalprodutos := 0.00;
  mtotalservicos := 0.00;
  mtotaldescontos := 0.00;
  mtotalvenda := 0.00;

     cont := self.Listview1.Items.Count;
    for k := 0 to cont - 1 do
    begin
      mtotalprodutos := mtotalprodutos + strtofloat(self.Listview1.Items[k].SubItems[5]);
    end;
    self.edttotalproduto.Text := floattostr(mtotalprodutos);
    self.edttotalproduto.Text:= FormatCurr('###,##0.00', StrtoCurr(edttotalproduto.Text));

    mtotalvenda := mtotalprodutos + mtotalservicos;
    self.edttotalvenda.Text := floattostr(mtotalvenda);
    self.edttotalvenda.Text:= FormatCurr('###,##0.00', StrtoCurr(edttotalvenda.Text));


end;

procedure TFrmCadastroVendas.BloqueiaEdt;
begin

end;

procedure TFrmCadastroVendas.btnadicionarClick(Sender: TObject);
var total, valor : real;
begin
  umitem := Item.Crieobj;
  self.addproduto;
  self.edtcodproduto.Clear;
  self.edtproduto.Clear;
  self.edtqtd.Clear;
  self.edttotal_produto.Clear;
  self.edtvalor_produto.Clear;
  self.edtcodproduto.SetFocus;
  self.edtcodigo.Enabled := false;
  self.edtmodelo.Enabled := false;
  self.edtserie.Enabled := false;
  self.edtcodcliente.Enabled := false;
  self.edtcliente.Enabled := false
end;

procedure TFrmCadastroVendas.btngeraparcelaClick(Sender: TObject);
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
  valor_venda := strtofloat(self.edttotalvenda.Text);
  valor_parcela := valor_venda / tparcelas;
  valor_parcela := StrToCurr(FormatCurr('0.00', valor_parcela));
  percentual_parcela := 100 / tparcelas;
  percentual_parcela := StrToFloat(FormatFloat('0.00', percentual_parcela));
  for I := 1 to tparcelas do
  begin
    umacontareceber := ContasReceber.Crieobj;
    //---------------------AQUI EU ESTOU CARREGANDO A FORMA DE PAGAMENTO PRA INSERIR NO CONTAS A RECERBER -------------
    umactrlvendaproduto.getctrlcondicao.Pesquisar(self.edtcodcondicao.Text);
    mcolecao := ColecaoParcelas (umavendaproduto.getumaCondicao.getumacolecaop);
    mparcela := Parcelas (mcolecao.Carrega(I));
    mcodformapagamento := inttostr(mparcela.getumaformapagamento.getCodigo);
    mformapagamento := mparcela.getumaformapagamento.getpagamento;

   //------------------------------------------------------------------------------------------------------------------
    mcontareceber := i;
    pos := umavendaproduto.getumacolecaoContasReceber.Pesquisa(mcontareceber, false);
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
        self.umavendaproduto.getumacolecaoContasReceber.insere(umacontareceber.clone, pos);

          self.carregaLV3;
          if pos >= tparcelas then
            self.carregaLV3

        end;
      end;
end;

procedure TFrmCadastroVendas.btnpesquisaclienteClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultacliente.btnSair.Caption;
  umfrmconsultacliente.btnSair.Caption := 'SELECIONAR';
  umfrmconsultacliente.ConhecaObj(umavendaproduto.getumcliente, umactrlvendaproduto.getctrlcliente);
  umfrmconsultacliente.ShowModal;

  umfrmconsultacliente.btnSair.Caption := mbotao;
  self.edtcodcliente.Text := inttostr(umavendaproduto.getumcliente.getcodigo);
  self.edtcliente.Text := umavendaproduto.getumcliente.getnome;
  self.edtlimite.Text := floattostr(umavendaproduto.getumcliente.getlimite);
end;

procedure TFrmCadastroVendas.btnpesquisacondicaoClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultacondicao.btnSair.Caption;
  umfrmconsultacondicao.btnSair.Caption := 'SELECIONAR';
  umfrmconsultacondicao.ConhecaObj(umavendaproduto.getumacondicao, umactrlvendaproduto.getctrlcondicao);
  umfrmconsultacondicao.ShowModal;

  umfrmconsultacondicao.btnSair.Caption := mbotao;
  self.edtcodcondicao.Text := inttostr(umavendaproduto.getumacondicao.getcodigo);
  self.edtcondicao.Text := umavendaproduto.getumacondicao.getcondicao;
  self.edtparcelas.Text := inttostr(umavendaproduto.getumaCondicao.getnum_parcelas);
end;

procedure TFrmCadastroVendas.btnremoveClick(Sender: TObject);
begin
  umitem := Item.Crieobj;
  self.removeproduto;
end;

procedure TFrmCadastroVendas.btnSalvarClick(Sender: TObject);
begin
  inherited;
  salvar;;
end;

procedure TFrmCadastroVendas.CarregaEdt;
begin
  self.edtcodigo.Text := inttostr(umavendaproduto.getNumero_nota);
  self.edtserie.Text := umavendaproduto.getSerie;
  self.edtmodelo.Text := umavendaproduto.getModelo;
  self.edtcodcliente.Text := inttostr(umavendaproduto.Getumcliente.getCodigo);
  self.edtcliente.Text := umavendaproduto.Getumcliente.getnome;
  self.edtlimite.Text := floattostr(umavendaproduto.Getumcliente.getlimite);
  self.edttotalproduto.Text := floattostr(umavendaproduto.getTotalprodutos);
  self.edttotaldesconto.Text := floattostr(umavendaproduto.getTotaldesconto);
  self.edttotalvenda.Text := Currtostr(umavendaproduto.getTotalvenda);
end;

procedure TFrmCadastroVendas.carregaLV;
var mcolecao : ColecaoProdutos;
    tam, k : integer;
    itemLV : TListItem;
    mitem : Item;
begin
  mcolecao := ColecaoProdutos (umavendaproduto.getumacolecaoproduto);
  ListView1.Clear;
  tam := mcolecao.getQtd;
  for k := 1 to tam do
  begin
    mitem := Item (mcolecao.Carrega(k));
    itemLV := ListView1.Items.Add;
    itemLV.Caption := inttostr(mitem.getumproduto.getCodigo);
    itemLV.SubItems.Add(mitem.getumproduto.getdescricao);
    itemLV.SubItems.Add(mitem.getumproduto.getund);
    itemLV.SubItems.Add(floattostr(strtofloat(formatfloat('#0.00', mitem.getumproduto.getpreco_venda))));
    itemLV.SubItems.Add(inttostr(mitem.getQtd));
    itemLV.SubItems.Add(floattostr(mitem.getDesconto));
    itemLV.SubItems.Add(floattostr(strtofloat(formatfloat('#0.00', mitem.getvalor_total))));
  end;
end;

procedure TFrmCadastroVendas.carregaLV3;
var mcolecao : ColecaoContasreceber;
    tam, k, prazo : integer;
    dias_prazo : extended;
    itemLV : TListItem;
    mcontareceber : Contasreceber;
    mpercent : Currency;
    vencimento, hoje : TDate;
begin
  mcolecao := ColecaoContasreceber (umavendaproduto.getumacolecaoContasreceber);
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

procedure TFrmCadastroVendas.ConhecaObj(pObj, pctrl: TObject);
begin
  umavendaproduto := Venda_Produtos(pObj);
  self.edtCodigo.Text := inttostr(umavendaproduto.getCodigo);
  umactrlvendaproduto := ControllerVenda_Produtos(pctrl);
  self.DateTimePickervenda.Date := self.umavendaproduto.getData_venda;
end;

procedure TFrmCadastroVendas.DesbloqueiaEdt;
begin

end;

procedure TFrmCadastroVendas.edtcodclienteExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlvendaproduto.getctrlcliente.Pesquisar(self.edtcodcliente.Text);
  umactrlvendaproduto.getctrlcliente.Carregar(umavendaproduto.getumcliente);
  self.edtcodcliente.Text := inttostr(umavendaproduto.getumcliente.getCodigo);
  self.edtcliente.Text := umavendaproduto.getumcliente.getnome;
  self.edtlimite.Text := floattostr(umavendaproduto.getumcliente.getlimite);
  if self.edtcodcliente.Text = inttostr(0) then
  begin
    ShowMessage('Cliente não Encontrado!');
    self.edtcodcliente.SetFocus;
  end;
end;

procedure TFrmCadastroVendas.edtcodcondicaoExit(Sender: TObject);
var
  mMSG: string;
  mcolecao : ColecaoParcelas;
  tamanho, i : integer;
  mparcela : Parcelas;
begin
  inherited;
  mMSG := umactrlvendaproduto.getctrlcondicao.Pesquisar(self.edtcodcondicao.Text);
  umactrlvendaproduto.getctrlcondicao.Carregar(umavendaproduto.getumacondicao);
  self.edtcodcondicao.Text := inttostr(umavendaproduto.getumacondicao.getcodigo);
  self.edtcondicao.Text := umavendaproduto.getumacondicao.getcondicao;
  self.edtparcelas.Text := inttostr(umavendaproduto.getumaCondicao.getnum_parcelas);
  self.edtcondicao.Enabled := false;
  self.edtparcelas.Enabled := false;
  if self.edtcodcondicao.Text = inttostr(0) then
  begin
    ShowMessage('Condição não encontrada');
    self.edtcodcondicao.SetFocus;
  end;
end;

procedure TFrmCadastroVendas.edtcodprodutoExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  if self.edtcodproduto.Text = '' then
  begin
    self.edtcodproduto.Text := '';
    self.edtproduto.Text := '';
    self.edtund.Text := '';
  end
  else
  begin
    mMSG := umactrlvendaproduto.getctrlproduto.Pesquisar(self.edtcodproduto.Text);
    umactrlvendaproduto.getctrlproduto.Carregar(umavendaproduto.getumproduto);
    self.edtcodproduto.Text := inttostr(umavendaproduto.getumproduto.getcodigo);
    self.edtproduto.Text := umavendaproduto.getumproduto.getdescricao;
    self.edtund.Text := umavendaproduto.getumproduto.getund;
    self.edtvalor_produto.Text := floattostr(umavendaproduto.getumproduto.getpreco_venda);
    self.edtvalor_produto.Text:= FormatCurr('###,##0.00', StrtoCurr(self.edtvalor_produto.Text));
    if self.edtcodproduto.Text = inttostr(0) then
    begin
      ShowMessage('Produto não encontrado');
      self.edtcodproduto.SetFocus;
    end
    else
    begin
      self.edtproduto.Enabled := false;
      self.edtqtd.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroVendas.edtdescprodutoExit(Sender: TObject);
var valor_prod, valor_desconto : currency;
begin
  if self.edtdescproduto.Text <> '' then
  begin
  valor_desconto := strtofloat(self.edtvalor_produto.Text);
  valor_desconto := valor_desconto - (valor_desconto * strtofloat(self.edtdescproduto.Text) / 100);
  self.edtvalor_produto.Text := floattostr(valor_desconto);
  self.edtvalor_produto.Text:= FormatCurr('###,##0.00', StrtoCurr(self.edtvalor_produto.Text));
  valor_prod := (strtoCurr(self.edtqtd.Text) * strtoCurr(self.edtvalor_produto.Text));
  self.edttotal_produto.Text := CurrtoStr(valor_prod);
  self.edttotal_produto.Text:= FormatCurr('###,##0.00', StrtoCurr(edttotal_produto.Text));
  self.edttotal_produto.Enabled := false;
  end;
end;

procedure TFrmCadastroVendas.LimpaEdt;
begin

end;

procedure TFrmCadastroVendas.removeproduto;
var pos,  cont : integer;
    total, valor : real;
    mitem : string;
    itemLV : TListItem;
begin
    mitem := ListView1.Selected.SubItems[0];
    pos := umavendaproduto.getumacolecaoproduto.Pesquisa(mitem, true);
  if pos = 0 then
  begin
    showmessage('PRODUTO JA NÃO ENCONTRADO');
  end
  else
  begin
    self.umavendaproduto.getumacolecaoproduto.remove(pos);

    self.carregaLV;
    ShowMessage('Produto Removido!!!');
  end;
  self.atualizavalores;
end;

procedure TFrmCadastroVendas.Sair;
begin

end;

procedure TFrmCadastroVendas.Salvar;
var mstatus, data_venda : string;
begin
if self.btnSalvar.Caption = '&Cancelar' then
  begin
    If Application.MessageBox('Confirma Cancelamento ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlvendaproduto.Excluir(umavendaproduto);
      ShowMessage('Cancelado com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if self.DateTimePickervenda.Date <> date then
    begin
      showmessage('Data de Venda Inválida');
      self.DateTimePickervenda.SetFocus;
    end
    else
    begin
    mstatus := 'processada';
    umavendaproduto.setNumero_nota(strtoint(self.edtcodigo.Text));
    umavendaproduto.setSerie(self.edtserie.Text);
    umavendaproduto.setModelo(self.edtmodelo.Text);
    umavendaproduto.setData_venda(self.DateTimePickervenda.Date);
    umavendaproduto.getumcliente.setcodigo(strtoint(self.edtcodcliente.Text));
    umavendaproduto.setTotalprodutos(strtofloat(self.edttotalproduto.Text));
    umavendaproduto.setTotalvenda(strtofloat(self.edttotalvenda.Text));
    umavendaproduto.setTotaldesconto(strtofloat(self.edttotaldesconto.Text));
    umavendaproduto.setStatus(mstatus);
    umactrlvendaproduto.Salvar(umavendaproduto.clone);
    ShowMessage('Salvo com Sucesso!!!');
    close;
    end;
  end;
  umavendaproduto.getumacolecaocontasreceber.getQtd;
end;

procedure TFrmCadastroVendas.SetFrmConsultaCliente(pObj: TObject);
begin
  umfrmconsultacliente := TFrmConsultaCliente(pObj);
end;

procedure TFrmCadastroVendas.SetFrmConsultaCondicao(pObj: TObject);
begin
  umfrmconsultacondicao := TFrmConsultaCondicao(pObj);
end;

procedure TFrmCadastroVendas.SetFrmConsultaFormaPagamento(pObj: TObject);
begin
  umfrmconsultaformapagamento := TFrmConsultaFormaPagamento(pObj);
end;

procedure TFrmCadastroVendas.SetFrmConsultaProduto(pObj: TObject);
begin
  umfrmconsultaproduto := TFrmConsultaProduto(pObj);
end;

procedure TFrmCadastroVendas.SetFrmConsultaservico(pObj: TObject);
begin
  umfrmconsultaservico := TFrmConsultaServicos(pObj);
end;

procedure TFrmCadastroVendas.SpeedButton1Click(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultaproduto.btnSair.Caption;
  umfrmconsultaproduto.btnSair.Caption := 'SELECIONAR';
  umfrmconsultaproduto.ConhecaObj(umavendaproduto.getumproduto, umactrlvendaproduto.getctrlproduto);
  umfrmconsultaproduto.ShowModal;

  umfrmconsultaproduto.btnSair.Caption := mbotao;
  self.edtcodproduto.Text := inttostr(umavendaproduto.getumproduto.getcodigo);
  self.edtproduto.Text := umavendaproduto.getumproduto.getdescricao;
  self.edtvalor_produto.Text := CurrtoStr(umavendaproduto.getumproduto.getpreco_venda);
end;

end.
