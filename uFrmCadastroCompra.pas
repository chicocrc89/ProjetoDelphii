unit uFrmCadastroCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.WinXPickers,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Samples.Spin, uFrmConsultaCondicao, uItem,
  uFrmConsultaFornecedor, uFrmConsultaProduto, uControllerCompras, uCompras, uColecaoProdutos,
  uColecaoContaspagar, Vcl.Mask, uContasPagar, uFrmConsultaFormaPagamento, Vcl.DBCtrls;

type
  TFrmCadastroCompra = class(TForm)
    Label14: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    edtnumero_nota: TEdit;
    edtserie: TEdit;
    edtmodelo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label21: TLabel;
    Label6: TLabel;
    btnpesquisarfornecedor: TSpeedButton;
    edtcodfornecedor: TEdit;
    edtfornecedor: TEdit;
    Label7: TLabel;
    edtcnpj: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    edtcodproduto: TEdit;
    edtproduto: TEdit;
    Label11: TLabel;
    edtvalor: TEdit;
    Label12: TLabel;
    ListView1: TListView;
    btnadicionar: TSpeedButton;
    btnremove: TSpeedButton;
    Label25: TLabel;
    edtfrete: TEdit;
    Label26: TLabel;
    edtoutrasdespesas: TEdit;
    Label27: TLabel;
    edtdesconto: TEdit;
    SpeedButton4: TSpeedButton;
    ListView2: TListView;
    btnSalvar: TSpeedButton;
    btnSair: TSpeedButton;
    Label17: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    btnpesquisacondicao: TSpeedButton;
    edtcodcondicao: TEdit;
    edtcondicao: TEdit;
    edtqtd: TSpinEdit;
    DateTimePickeremissao: TDateTimePicker;
    DateTimePickerentrada: TDateTimePicker;
    Label13: TLabel;
    Label30: TLabel;
    edtund: TEdit;
    Label28: TLabel;
    edtseguro: TEdit;
    Label15: TLabel;
    edttotalprodutos: TEdit;
    Label29: TLabel;
    edttotalnota: TEdit;
    edtparcelas: TEdit;
    Label31: TLabel;
    btngeraparcela: TSpeedButton;
    Label32: TLabel;
    edtcodformapagamento: TEdit;
    Label33: TLabel;
    edtformapagamento: TEdit;
    btnpesquisaformapagamento: TSpeedButton;
    edttotalproduto: TEdit;
    procedure btnadicionarClick(Sender: TObject);
    procedure btnpesquisarfornecedorClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnpesquisacondicaoClick(Sender: TObject);
    procedure edtcodfornecedorExit(Sender: TObject);
    procedure edtcodprodutoExit(Sender: TObject);
    procedure edtcodcondicaoExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnremoveClick(Sender: TObject);
    procedure edtvalorExit(Sender: TObject);
    procedure edtfreteExit(Sender: TObject);
    procedure edtoutrasdespesasExit(Sender: TObject);
    procedure edtseguroExit(Sender: TObject);
    procedure edtdescontoExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btngeraparcelaClick(Sender: TObject);
    procedure btnpesquisaformapagamentoClick(Sender: TObject);
    procedure edtcodformapagamentoExit(Sender: TObject);
    procedure DateTimePickeremissaoExit(Sender: TObject);
    procedure DateTimePickerentradaExit(Sender: TObject);
  private
    { Private declarations }
  protected
    umfrmconsultacondicao: TFrmConsultaCondicao;
    umfrmconsultafornecedor: TFrmconsultafornecedor;
    umfrmconsultaproduto : TFrmconsultaproduto;
    umfrmconsultaformapagamento : TFrmConsultaFormaPagamento;
    umacompra : Compras;
    umItem : Item;
    umacontapagar : ContasPagar;
    umactrlcompra : Controllercompras;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pctrl: TObject);
    procedure Salvar;
    procedure Sair;
    procedure CarregaEdt;
    procedure LimpaEdt;
    procedure BloqueiaEdt;
    procedure DesbloqueiaEdt;
    procedure SetFrmConsulta(pObj: TObject);
    procedure SetFrmConsultaFornecedor(pObj: TObject);
    procedure SetFrmConsultaProduto(pObj: TObject);
    procedure SetFrmConsultaFormaPagamento(pObj: TObject);
    procedure addproduto;
    procedure carregaLV;
    procedure removeproduto;
    function validanotapk : boolean;
    procedure carregaLV2;
    procedure destroy_colecao;
  end;

var
  FrmCadastroCompra: TFrmCadastroCompra;

implementation

{$R *.dfm}

{ TFrmCadastroCompra }

procedure TFrmCadastroCompra.addproduto;
var pos,  cont, k : integer;
    total, valor, subtotal : currency;
    mitem : string;
    pitem : Item;
    mcolecao : ColecaoProdutos;
begin
  //valor := strtofloat(self.edtvalor.Text);
    k := 0;
    total := 0;
    mitem := self.edtproduto.Text;
    pos := umacompra.getumacolecaoproduto.Pesquisa(mitem, false);
    if pos = 0 then
    begin
      pos := umacompra.getumacolecaoproduto.Pesquisa(mitem, true);
      pitem := Item (umacompra.getumacolecaoproduto.Carrega(pos));
      self.umacompra.getumacolecaoproduto.remove(pos);
      umitem.getumproduto.setCodigo(strtoint(self.edtcodproduto.Text));
      umitem.getumproduto.setdescricao(self.edtproduto.Text);
      umitem.getumproduto.setund(self.edtund.Text);
      umitem.getumproduto.setpreco_compra(strtofloat(self.edtvalor.Text));
      subtotal := strtofloat(self.edtvalor.Text) * strtoint(self.edtqtd.Text);
      umitem.setvalor_total(subtotal + pitem.getvalor_total);
      //umitem.setmargem(strtofloat(self.edtmargem.Text));
      umitem.SetQtd(strtoint(self.edtqtd.Text)+ pitem.getQtd);
      //diferenca := umitem.getvalor - valor;
      self.umacompra.getumacolecaoproduto.insere(umitem.clone, pos);
      //total := total + diferenca;
      //self.edttotal.Text := floattostr(total);
      self.carregaLV;
    end
    else
    begin
      umitem.getumproduto.setCodigo(strtoint(self.edtcodproduto.Text));
      umitem.getumproduto.setdescricao(self.edtproduto.Text);
      umitem.getumproduto.setund(self.edtund.Text);
      umitem.getumproduto.setpreco_compra(strtofloat(self.edtvalor.Text));
      subtotal := strtofloat(self.edtvalor.Text) * strtoint(self.edtqtd.Text);
      umitem.setvalor_total(subtotal);
      //umitem.setmargem(strtofloat(self.edtmargem.Text));
      umitem.SetQtd(strtoint(self.edtqtd.Text));
      self.umacompra.getumacolecaoproduto.insere(umitem.clone, pos);
      //total := total + valor;
      //self.edttotal.Text := floattostr(total);
      self.carregaLV;
    end;
    cont := Listview1.Items.Count;
    for k := 0 to cont - 1 do
    begin
      total := total + strtofloat(ListView1.Items[k].SubItems[4]);
    end;
    self.edttotalprodutos.Text := floattostr(total);
    self.edttotalnota.Text := floattostr(total);
end;

procedure TFrmCadastroCompra.BloqueiaEdt;
begin
  inherited;
  self.edtnumero_nota.Enabled := false;
  self.edtserie.Enabled := false;
  self.edtmodelo.Enabled := false;
  self.edtcodfornecedor.Enabled := false;
  self.edtfornecedor.Enabled := false;
  self.edtcnpj.Enabled := false;
  self.edtcodproduto.Enabled := false;
  self.edtproduto.Enabled := false;
  self.edtvalor.Enabled := false;
  self.edtqtd.Enabled := false;
  self.edtseguro.Enabled := false;
  self.edttotalprodutos.Enabled := false;
  self.edtfrete.Enabled := false;
  self.edtoutrasdespesas.Enabled := false;
  self.edtdesconto.Enabled := false;
  self.edtcodcondicao.Enabled := false;
  self.edtcondicao.Enabled := false;
end;

procedure TFrmCadastroCompra.btnadicionarClick(Sender: TObject);
var total, valor : real;
begin
  umitem := Item.Crieobj;
  self.addproduto;
  self.edtcodproduto.Clear;
  self.edtproduto.Clear;
  self.edtqtd.Clear;
  self.edttotalproduto.Clear;
  self.edtvalor.Clear;
  self.edtcodproduto.SetFocus;
  self.edtnumero_nota.Enabled := false;
  self.edtmodelo.Enabled := false;
  self.edtserie.Enabled := false;
  self.edtcodfornecedor.Enabled := false;
  self.edtfornecedor.Enabled := false
end;

procedure TFrmCadastroCompra.btngeraparcelaClick(Sender: TObject);
var mcontapagar, pos, tparcelas, cont, i, dias_prazo : integer;
    percentual_parcela : real;
    total, valor_nota, valor_parcela : Currency;
begin
  umacontapagar := ContasPagar.Crieobj;
  cont := 0;
  tparcelas := cont;
  total := 0;
  tparcelas := strtoint(self.edtparcelas.Text);
  valor_nota := strtofloat(self.edttotalnota.Text);
  valor_parcela := valor_nota / tparcelas;
  valor_parcela := StrToCurr(FormatCurr('0.00', valor_parcela));
  percentual_parcela := 100 / tparcelas;
  percentual_parcela := StrToFloat(FormatFloat('0.00', percentual_parcela));
  for I := 1 to tparcelas do
  begin
    mcontapagar := i;
    pos := umacompra.getumacolecaocontaspagar.Pesquisa(mcontapagar, false);
    if pos = 0 then
    begin
      showmessage('PARCELA JA INSERIDA');
      exit;
    end
    else
    begin
        umacontapagar.setnumero_parcela(pos);
        dias_prazo :=I * 30;
        umacontapagar.setdata_vencimento(date + dias_prazo);
        //umacontapagar.setperc_parcela(percentual_parcela);
        umacontapagar.getumaformapagamento.setCodigo(strtoint(self.edtcodformapagamento.Text));
        umacontapagar.getumaformapagamento.setpagamento(self.edtformapagamento.Text);
        if i = tparcelas then
        begin
          valor_parcela := valor_nota - total;
          umacontapagar.setvalor_parcela(valor_parcela);
        end
        else
        begin
          umacontapagar.setvalor_parcela(valor_parcela);
          total := total + valor_parcela;
        end;
        //vlrparcela := StrToCurr(FormatCurr(�0.00�, VlrParcela));
        self.umacompra.getumacolecaocontaspagar.insere(umacontapagar.clone, pos);

          self.carregaLV2;
          if pos >= tparcelas then
            self.carregaLV

        end;
      end;
end;

procedure TFrmCadastroCompra.btnpesquisarfornecedorClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultafornecedor.btnSair.Caption;
  umfrmconsultafornecedor.btnSair.Caption := 'SELECIONAR';
  umfrmconsultafornecedor.ConhecaObj(umacompra.getumfornecedor, umactrlcompra.getctrlfornecedor);
  umfrmconsultafornecedor.ShowModal;

  umfrmconsultafornecedor.btnSair.Caption := mbotao;
  self.edtcodfornecedor.Text := inttostr(umacompra.getumfornecedor.getcodigo);
  self.edtfornecedor.Text := umacompra.getumfornecedor.getrazao;
  self.edtcnpj.Text := umacompra.GetumFornecedor.getcnpj;
end;

procedure TFrmCadastroCompra.btnSairClick(Sender: TObject);
begin
  self.destroy_colecao;
  close;
end;

procedure TFrmCadastroCompra.btnSalvarClick(Sender: TObject);
begin
  salvar;
end;

procedure TFrmCadastroCompra.CarregaEdt;
begin
  inherited;
  self.edtnumero_nota.Text := inttostr(umacompra.getNumero_nota);
  self.edtserie.Text := umacompra.getSerie;
  self.edtmodelo.Text := umacompra.getModelo;
  self.edtcodfornecedor.Text := inttostr(umacompra.GetumFornecedor.getCodigo);
  self.edtfornecedor.Text := umacompra.GetumFornecedor.getrazao;
  self.edtcnpj.Text := umacompra.GetumFornecedor.getcnpj;
  self.edttotalprodutos.Text := floattostr(umacompra.getTotalprodutos);
  self.edtfrete.Text := floattostr(umacompra.getValor_frete);
  self.edtoutrasdespesas.Text := floattostr(umacompra.getValoroutrasdespesas);
  self.edtdesconto.Text := floattostr(umacompra.getTotaldesconto);
  self.edtseguro.Text := floattostr(umacompra.getseguro);
  self.edttotalnota.Text := Currtostr(umacompra.getTotalcompra);
end;

procedure TFrmCadastroCompra.carregaLV;
var mcolecao : ColecaoProdutos;
    tam, k : integer;
    itemLV : TListItem;
    mitem : Item;
begin
  mcolecao := ColecaoProdutos (umacompra.getumacolecaoproduto);
  ListView1.Clear;
  tam := mcolecao.getQtd;
  for k := 1 to tam do
  begin
    mitem := Item (mcolecao.Carrega(k));
    itemLV := ListView1.Items.Add;
    itemLV.Caption := inttostr(mitem.getumproduto.getCodigo);
    itemLV.SubItems.Add(mitem.getumproduto.getdescricao);
    itemLV.SubItems.Add(mitem.getumproduto.getund);
    itemLV.SubItems.Add(floattostr(strtofloat(formatfloat('#0.00', mitem.getumproduto.getpreco_compra))));
    itemLV.SubItems.Add(inttostr(mitem.getQtd));
    itemLV.SubItems.Add(floattostr(strtofloat(formatfloat('#0.00', mitem.getvalor_total))));
  end;
end;

procedure TFrmCadastroCompra.carregaLV2;
var mcolecao : ColecaoContaspagar;
    tam, k, prazo : integer;
    dias_prazo : extended;
    itemLV : TListItem;
    mcontapagar : ContasPagar;
    mpercent : Currency;
    vencimento, hoje : TDate;
begin
  mcolecao := ColecaoContasPagar (umacompra.getumacolecaocontaspagar);
  ListView2.Clear;
  tam := mcolecao.getQtd;
  for k := 1 to tam do
  begin
    mcontapagar := ContasPagar (mcolecao.Carrega(k));
    dias_prazo := (mcontapagar.getdata_vencimento - date);
    vencimento := mcontapagar.getdata_vencimento;
    hoje := Date;
    dias_prazo := vencimento - hoje;
    prazo := Trunc(dias_prazo);
    mpercent := (100 / tam) * k;
    itemLV := ListView2.Items.Add;
    itemLV.Caption := inttostr(mcontapagar.getnumero_parcela);
    itemLV.SubItems.Add(inttostr(prazo));
    itemLV.SubItems.Add(floattostr(strtofloat(formatfloat('#0.00', mpercent))));
    itemLV.SubItems.Add(inttostr(mcontapagar.getumaformapagamento.getCodigo));
    itemLV.SubItems.Add(mcontapagar.getumaformapagamento.getpagamento);
    itemLV.SubItems.Add(floattostr(strtofloat(formatfloat('#0.00', mcontapagar.getvalor_parcela))));
    itemLV.SubItems.Add(DatetoStr(mcontapagar.getdata_vencimento));

  end;
end;

procedure TFrmCadastroCompra.ConhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umacompra := Compras(pObj);
  umactrlcompra := ControllerCompras(pctrl);
  self.DateTimePickerentrada.Date := self.umacompra.getData_entrada;
  self.DateTimePickeremissao.Date := self.umacompra.getData_emissao;
end;

procedure TFrmCadastroCompra.DateTimePickeremissaoExit(Sender: TObject);
begin
  if self.DateTimePickeremissao.Date > Date then
  begin
    showmessage('Data de Emiss�o n�o pode ser maior que Data atual');
    self.DateTimePickeremissao.SetFocus;
  end;

end;

procedure TFrmCadastroCompra.DateTimePickerentradaExit(Sender: TObject);
begin
  if self.DateTimePickerentrada.Date < self.DateTimePickeremissao.Date then
  begin
    showmessage('Data de Entrada menor que a data de Emiss�o');
    self.DateTimePickerentrada.SetFocus;
  end;
end;

procedure TFrmCadastroCompra.DesbloqueiaEdt;
begin
  inherited;
  self.edtnumero_nota.Enabled := true;
  self.edtserie.Enabled := true;
  self.edtmodelo.Enabled := true;
  self.edtcodfornecedor.Enabled := true;
  self.edtfornecedor.Enabled := true;
  self.edtcnpj.Enabled := true;
  self.edtcodproduto.Enabled := true;
  self.edtproduto.Enabled := true;
  self.edtvalor.Enabled := true;
  self.edtqtd.Enabled := true;
  self.edtseguro.Enabled := true;
  self.edttotalprodutos.Enabled := true;
  self.edtfrete.Enabled := true;
  self.edtoutrasdespesas.Enabled := true;
  self.edtdesconto.Enabled := true;
  self.edtcodcondicao.Enabled := true;
  self.edtcondicao.Enabled := true;
end;

procedure TFrmCadastroCompra.destroy_colecao;
var mcolecao : ColecaoProdutos;
    mcolecaocontaspagar : ColecaoContasPagar;
    tam, tamanho, k : integer;
begin
  mcolecao := self.umacompra.getumacolecaoproduto;
  mcolecaocontaspagar := self.umacompra.getumacolecaocontaspagar;
  tam := mcolecao.getQtd;
  tamanho := mcolecaocontaspagar.getQtd;
  for k := 1 to tam do
  begin
    mcolecao.remove(k);
  end;
  for k := 1 to tamanho do
  begin
    mcolecaocontaspagar.remove(k);
  end;
end;

procedure TFrmCadastroCompra.edtcodcondicaoExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlcompra.getctrlcondicao.Pesquisar(self.edtcodcondicao.Text);
  umactrlcompra.getctrlcondicao.Carregar(umacompra.getumacondicao);
  self.edtcodcondicao.Text := inttostr(umacompra.getumacondicao.getcodigo);
  self.edtcondicao.Text := umacompra.getumacondicao.getcondicao;
  self.edtparcelas.Text := inttostr(umacompra.getumaCondicao.getnum_parcelas);
  self.edtcondicao.Enabled := false;
  self.edtparcelas.Enabled := false;
  if self.edtcodcondicao.Text = inttostr(0) then
  begin
    ShowMessage('Condi��o n�o encontrada');
    self.edtcodcondicao.SetFocus;
  end;
end;

procedure TFrmCadastroCompra.edtcodformapagamentoExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlcompra.getctrlformapagamento.Pesquisar(self.edtcodformapagamento.Text);
  umactrlcompra.getctrlformapagamento.Carregar(umacompra.getumaformapagamento);
  self.edtcodformapagamento.Text := inttostr(umacompra.getumaformapagamento.getcodigo);
  self.edtformapagamento.Text := umacompra.getumaformapagamento.getpagamento;
  self.edtformapagamento.Enabled := false;
  if self.edtcodformapagamento.Text = inttostr(0) then
  begin
    ShowMessage('Forma n�o Encontrada!');
    self.edtcodformapagamento.SetFocus;
  end;
end;

procedure TFrmCadastroCompra.edtcodfornecedorExit(Sender: TObject);
var
  mMSG: string;
  mcontinua : boolean;
begin
  inherited;
  if self.edtcodfornecedor.Text = '' then
  begin
    self.edtcodfornecedor.Text := '';
    self.edtfornecedor.Text := '';
    self.edtcnpj.Text := '';
  end
  else
  begin
    mMSG := umactrlcompra.getctrlfornecedor.Pesquisar(self.edtcodfornecedor.Text);
    umactrlcompra.getctrlfornecedor.Carregar(umacompra.getumfornecedor);
    self.edtcodfornecedor.Text := inttostr(umacompra.getumfornecedor.getcodigo);
    self.edtfornecedor.Text := umacompra.getumfornecedor.getrazao;
    self.edtcnpj.Text := umacompra.GetumFornecedor.getcnpj;
    if self.edtcodfornecedor.Text = inttostr(0) then
    begin
      ShowMessage('Fornecedor n�o encontrado');
      self.edtcodfornecedor.SetFocus;
    end
    else
    begin
      if umacompra.GetumFornecedor.getstatus = 'I' then
      begin
        showmessage('Fornecedor Inativo');
        self.edtcodfornecedor.Clear;
        self.edtfornecedor.Clear;
        self.edtcnpj.Clear;
        self.edtcodfornecedor.SetFocus;
      end
      else
      begin
        self.edtfornecedor.Enabled := false;
        self.edtcnpj.Enabled := false;
        self.edtcodproduto.SetFocus;

        if self.edtnumero_nota.text = '' then
          showmessage('numero de Nota n�o pode ser Vazio')
        else if self.edtserie.Text = '' then
          showmessage('Serie N�o pode ser Vazio')
        else if self.edtmodelo.Text = '' then
          showmessage('Preencha Um modelo')
        else if self.edtcodfornecedor.Text = '' then
          showmessage('Selecione um Fornecedor')
        else
        begin
          umacompra.setNumero_nota(strtoint(self.edtnumero_nota.Text));
          umacompra.setSerie(self.edtserie.Text);
          umacompra.setModelo(self.edtmodelo.Text);
          umacompra.GetumFornecedor.setCodigo(strtoint(self.edtcodfornecedor.Text));
          mcontinua := umactrlcompra.validanotapk(umacompra);
          if mcontinua then
          begin
            self.btnadicionar.Enabled := true;
            self.btnremove.Enabled := true;
            self.btngeraparcela.Enabled := true;
          end
          else
          begin
            showmessage('NOTA ENCONTRADA');
            self.edtnumero_nota.Clear;
            self.edtserie.Clear;
            self.edtmodelo.Clear;
            self.edtcodfornecedor.Clear;
            self.edtfornecedor.Clear;
            self.edtcnpj.Clear;
            self.edtnumero_nota.SetFocus;
            exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrmCadastroCompra.edtcodprodutoExit(Sender: TObject);
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
    mMSG := umactrlcompra.getctrlproduto.Pesquisar(self.edtcodproduto.Text);
    umactrlcompra.getctrlproduto.Carregar(umacompra.getumproduto);
    self.edtcodproduto.Text := inttostr(umacompra.getumproduto.getcodigo);
    self.edtproduto.Text := umacompra.getumproduto.getdescricao;
    self.edtund.Text := umacompra.getumproduto.getund;
    if self.edtcodproduto.Text = inttostr(0) then
    begin
      ShowMessage('Produto n�o encontrado');
      self.edtcodproduto.SetFocus;
    end
    else
    begin
      self.edtproduto.Enabled := false;
      self.edtqtd.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroCompra.edtdescontoExit(Sender: TObject);
var frete, despesas, seguro, desconto, produtos : real;
begin
  if self.edtfrete.text <> '' then
    frete := strtofloat(self.edtfrete.Text)
  else
    frete := 0;
  if self.edtoutrasdespesas.Text <> '' then
    despesas := strtofloat(self.edtoutrasdespesas.Text)
  else
    despesas := 0;
  if self.edtseguro.Text <> '' then
    seguro := strtofloat(self.edtseguro.Text)
  else
    seguro := 0;
  if self.edtdesconto.Text <> '' then
    desconto := strtofloat(self.edtdesconto.Text)
  else
    desconto := 0;
  if self.edttotalprodutos.Text <> '' then
    produtos := strtofloat(self.edttotalprodutos.Text)
  else
    produtos := 0;
  self.edttotalnota.Text := floattostr(frete + despesas + seguro + produtos - desconto);
end;

procedure TFrmCadastroCompra.edtfreteExit(Sender: TObject);
var frete, despesas, seguro, desconto, produtos : real;
begin
  if self.edtfrete.Text < inttostr(0) then
  begin
    showmessage('Valor n�o pode ser negativo');
    self.edtfrete.SetFocus;
  end
  else
  begin
    self.btnadicionar.Enabled := false;
    self.btnremove.Enabled := false;
    if self.edtfrete.text <> '' then
      frete := strtofloat(self.edtfrete.Text)
    else
      frete := 0;
    if self.edtoutrasdespesas.Text <> '' then
      despesas := strtofloat(self.edtoutrasdespesas.Text)
    else
      despesas := 0;
    if self.edtseguro.Text <> '' then
      seguro := strtofloat(self.edtseguro.Text)
    else
      seguro := 0;
    if self.edtdesconto.Text <> '' then
      desconto := strtofloat(self.edtdesconto.Text)
    else
      desconto := 0;
    if self.edttotalprodutos.Text <> '' then
      produtos := strtofloat(self.edttotalprodutos.Text)
    else
      produtos := 0;
    self.edttotalnota.Text := floattostr(frete + despesas + seguro + produtos - desconto);
  end;
end;

procedure TFrmCadastroCompra.edtoutrasdespesasExit(Sender: TObject);
var frete, despesas, seguro, desconto, produtos : real;
begin
  if self.edtoutrasdespesas.Text < inttostr(0) then
  begin
    showmessage('o valor n�o pode ser negativo');
    self.edtoutrasdespesas.SetFocus;

  end
  else
  begin
    if self.edtfrete.text <> '' then
      frete := strtofloat(self.edtfrete.Text)
    else
      frete := 0;
    if self.edtoutrasdespesas.Text <> '' then
      despesas := strtofloat(self.edtoutrasdespesas.Text)
    else
      despesas := 0;
    if self.edtseguro.Text <> '' then
      seguro := strtofloat(self.edtseguro.Text)
    else
      seguro := 0;
    if self.edtdesconto.Text <> '' then
      desconto := strtofloat(self.edtdesconto.Text)
    else
      desconto := 0;
    if self.edttotalprodutos.Text <> '' then
      produtos := strtofloat(self.edttotalprodutos.Text)
    else
      produtos := 0;
    self.edttotalnota.Text := floattostr(frete + despesas + seguro + produtos - desconto);
  end;
end;

procedure TFrmCadastroCompra.edtseguroExit(Sender: TObject);
var frete, despesas, seguro, desconto, produtos : real;
begin
  if self.edtfrete.text <> '' then
    frete := strtofloat(self.edtfrete.Text)
  else
    frete := 0;
  if self.edtoutrasdespesas.Text <> '' then
    despesas := strtofloat(self.edtoutrasdespesas.Text)
  else
    despesas := 0;
  if self.edtseguro.Text <> '' then
    seguro := strtofloat(self.edtseguro.Text)
  else
    seguro := 0;
  if self.edtdesconto.Text <> '' then
    desconto := strtofloat(self.edtdesconto.Text)
  else
    desconto := 0;
  if self.edttotalprodutos.Text <> '' then
    produtos := strtofloat(self.edttotalprodutos.Text)
  else
    produtos := 0;
  self.edttotalnota.Text := floattostr(frete + despesas + seguro + produtos - desconto);
end;

procedure TFrmCadastroCompra.edtvalorExit(Sender: TObject);
var valor_prod : currency;
begin
  if self.edtqtd.Text <> '' then
  begin
  valor_prod := (strtoCurr(self.edtqtd.Text) * strtoCurr(self.edtvalor.Text));
  self.edttotalproduto.Text := CurrtoStr(valor_prod);
  self.edttotalproduto.Text:= FormatCurr('###,##0.00', StrtoCurr(edttotalproduto.Text));
  self.edttotalproduto.Enabled := false;
  end;
end;

procedure TFrmCadastroCompra.LimpaEdt;
begin
  inherited;
  self.edtnumero_nota.Clear;
  self.edtserie.Clear;
  self.edtmodelo.Clear;
  self.edtcodfornecedor.Clear;
  self.edtfornecedor.Clear;
  self.edtcnpj.Clear;
  self.edtcodproduto.Clear;
  self.edtproduto.Clear;
  self.edtvalor.Clear;
  self.edtqtd.Clear;
  self.edtseguro.Clear;
  self.edttotalprodutos.Clear;
  self.edtfrete.Clear;
  self.edtoutrasdespesas.Clear;
  self.edtdesconto.Clear;
  self.edtcodcondicao.Clear;
  self.edtcondicao.Clear;
  self.edtcodformapagamento.Clear;
  self.edtformapagamento.Clear;
  self.edtparcelas.Clear;
  self.ListView1.Clear;
  self.ListView2.Clear;
end;

procedure TFrmCadastroCompra.removeproduto;
var pos,  cont : integer;
    total, valor : real;
    mitem : string;
    itemLV : TListItem;
begin
    mitem := ListView1.Selected.SubItems[0];
    pos := umacompra.getumacolecaoproduto.Pesquisa(mitem, true);
  if pos = 0 then
  begin
    showmessage('PRODUTO JA N�O ENCONTRADO');
    //self.edtproduto.SetFocus;
  end
  else
  begin
    //umitem.setCodigo(strtoint(self.edtcodproduto.Text));
    //umitem.setdescricao(self.edtproduto.Text);
    //umitem.setvalor(strtofloat(self.edtvalor.Text));
    //umitem.setmargem(strtofloat(self.edtmargem.Text));
    //umitem.SetQtde(strtoint(self.edtqtd.Text));
    self.umacompra.getumacolecaoproduto.remove(pos);

    self.carregaLV;
    ShowMessage('Produto Removido!!!');
  end;

end;

procedure TFrmCadastroCompra.Sair;
begin
  inherited;

end;

procedure TFrmCadastroCompra.Salvar;
var mstatus, data_entrada, data_emissao : string;
begin
if self.btnSalvar.Caption = '&Cancelar' then
  begin
    If Application.MessageBox('Confirma Cancelamento ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlcompra.Excluir(umacompra);
      ShowMessage('Cancelado com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if self.DateTimePickeremissao.Date > date then
    begin
      showmessage('Data de Emiss�o Inv�lida');
      self.DateTimePickeremissao.SetFocus;
    end
    else if self.DateTimePickerentrada.Date <> date then
    begin
      showmessage('Data de Entrada Inv�lida');
      self.DateTimePickerentrada.SetFocus;
    end
    else
    begin
    mstatus := 'processada';
    umacompra.setNumero_nota(strtoint(self.edtnumero_nota.Text));
    umacompra.setSerie(self.edtserie.Text);
    umacompra.setModelo(self.edtmodelo.Text);
    umacompra.setData_entrada(self.DateTimePickerentrada.Date);
    umacompra.setData_emissao(self.DateTimePickeremissao.Date);
    umacompra.getumfornecedor.setcodigo(strtoint(self.edtcodfornecedor.Text));
    umacompra.setTotalprodutos(strtofloat(self.edttotalprodutos.Text));
    umacompra.setTotalcompra(strtofloat(self.edttotalnota.Text));
    umacompra.setValor_frete(strtofloat(self.edtfrete.Text));
    umacompra.getumaCondicao.setCodigo(strtoint(self.edtcodcondicao.Text));
    umacompra.setValoroutrasdespesas(strtofloat(self.edtoutrasdespesas.Text));
    umacompra.setseguro(strtofloat(self.edtseguro.Text));
    umacompra.setTotaldesconto(strtofloat(self.edtdesconto.Text));
    umacompra.setStatus(mstatus);
    umactrlcompra.Salvar(umacompra.clone);
    self.destroy_colecao;
    ShowMessage('Salvo com Sucesso!!!');
    close;
    end;
  end;
  umacompra.getumacolecaocontaspagar.getQtd;
  end;

procedure TFrmCadastroCompra.SetFrmConsulta(pObj: TObject);
begin
  umfrmconsultacondicao := TFrmConsultaCondicao (pObj);
end;

procedure TFrmCadastroCompra.SetFrmConsultaFormaPagamento(pObj: TObject);
begin
  umfrmconsultaformapagamento := TFrmConsultaFormaPagamento (pObj);
end;

procedure TFrmCadastroCompra.SetFrmConsultaFornecedor(pObj: TObject);
begin
  umfrmconsultafornecedor := TFrmConsultaFornecedor (pObj);
end;

procedure TFrmCadastroCompra.SetFrmConsultaProduto(pObj: TObject);
begin
  umfrmconsultaproduto := TFrmConsultaproduto (pObj);
end;

procedure TFrmCadastroCompra.SpeedButton1Click(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultaproduto.btnSair.Caption;
  umfrmconsultaproduto.btnSair.Caption := 'SELECIONAR';
  umfrmconsultaproduto.ConhecaObj(umacompra.getumproduto, umactrlcompra.getctrlproduto);
  umfrmconsultaproduto.ShowModal;

  umfrmconsultaproduto.btnSair.Caption := mbotao;
  self.edtcodproduto.Text := inttostr(umacompra.getumproduto.getcodigo);
  self.edtproduto.Text := umacompra.getumproduto.getdescricao;
end;

procedure TFrmCadastroCompra.btnremoveClick(Sender: TObject);
var total, valor, total_nota : real;
begin
  umitem := Item.Crieobj;
  total := strtofloat(self.edttotalprodutos.Text);
  total_nota := strtofloat(self.edttotalnota.Text);
  valor := strtofloat(ListView1.Selected.SubItems[4]);
  total := total - valor;
  total_nota := total_nota - valor;
  self.edttotalprodutos.Text := floattostr(total);
  self.edttotalnota.Text := floattostr(total_nota);
  self.removeproduto;
end;

procedure TFrmCadastroCompra.btnpesquisacondicaoClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultacondicao.btnSair.Caption;
  umfrmconsultacondicao.btnSair.Caption := 'SELECIONAR';
  umfrmconsultacondicao.ConhecaObj(umacompra.getumacondicao, umactrlcompra.getctrlcondicao);
  umfrmconsultacondicao.ShowModal;

  umfrmconsultacondicao.btnSair.Caption := mbotao;
  self.edtcodcondicao.Text := inttostr(umacompra.getumacondicao.getcodigo);
  self.edtcondicao.Text := umacompra.getumacondicao.getcondicao;
  self.edtparcelas.Text := inttostr(umacompra.getumaCondicao.getnum_parcelas);
end;

procedure TFrmCadastroCompra.btnpesquisaformapagamentoClick(Sender: TObject);
var
  mcontapagar : ContasPagar;
  mbotao: string;
begin
  inherited;
  mcontapagar := ContasPagar.Crieobj;
  mbotao := umfrmconsultaformapagamento.btnSair.Caption;
  umfrmconsultaformapagamento.btnSair.Caption := 'SELECIONAR';
  umfrmconsultaformapagamento.ConhecaObj(mcontapagar.getumaformapagamento, umactrlcompra.getctrlformapagamento);
  umfrmconsultaformapagamento.ShowModal;

  umfrmconsultaformapagamento.btnSair.Caption := mbotao;
  self.edtcodformapagamento.Text := inttostr(mcontapagar.getumaformapagamento.getcodigo);
  self.edtformapagamento.Text := mcontapagar.getumaformapagamento.getpagamento;
end;

function TFrmCadastroCompra.validanotapk : boolean;
var resultado : boolean;
begin
  if self.edtnumero_nota.text = '' then
    showmessage('numero de Nota n�o pode ser Vazio')
  else if self.edtserie.Text = '' then
    showmessage('Serie N�o pode ser Vazio')
  else if self.edtmodelo.Text = '' then
    showmessage('Preencha Um modelo')
  else if self.edtcodfornecedor.Text = '' then
    showmessage('Selecione um Fornecedor')
  else
  begin
    umacompra.setNumero_nota(strtoint(self.edtnumero_nota.Text));
    umacompra.setSerie(self.edtserie.Text);
    umacompra.setModelo(self.edtmodelo.Text);
    umacompra.GetumFornecedor.setCodigo(strtoint(self.edtcodfornecedor.Text));
    umactrlcompra.validanotapk(umacompra);
  end;
end;

end.
