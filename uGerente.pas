unit uGerente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uInter, uProdutos, uFabricantes, uVeiculos,
  uGrupos, uPaises, uEstados, uCidades, uUsuarios, uFuncionarios, uClientes, uFornecedores, Vcl.StdCtrls,
  uControllerpaises, uControllerestados, uControllercidades, uControllerprodutos, uControllerclientes, uControllerusuarios, uControllerfuncionarios, uControllerfabricantes, uControllerveiculos,
uControllerfornecedores, uControllergrupos, uMarcas, uControllerMarcas, uModelos, uControllerModelos,
uFormaPagamentos, uControllerFormaPagamentos, uCondicoes, uControllerCondicoes, uCores, uControllercores, uCombustiveis, uControllerCombustiveis, uCompras, uControllerCompras, uContasPagar, uControllerContasPagar,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, uOrdemServicos, uControllerOrdemServicos, uServicos, uControllerServicos, uVenda_Produtos, uControllerVenda_Produtos, uContasReceber, uControllerContasReceber,
  Vcl.ComCtrls, System.ImageList, Vcl.ImgList, Vcl.ToolWin;

type
  TGerente = class(TForm)
    MainMenu1: TMainMenu;
    Ca1: TMenuItem;
    Cliente1: TMenuItem;
    Fornecedor1: TMenuItem;
    Produto1: TMenuItem;
    N1: TMenuItem;
    Pas1: TMenuItem;
    Estado1: TMenuItem;
    Cidade1: TMenuItem;
    N2: TMenuItem;
    Vendedor1: TMenuItem;
    Usurio1: TMenuItem;
    Operacional1: TMenuItem;
    EntradaCompra1: TMenuItem;
    ConsultaCancelamento1: TMenuItem;
    Inventrio1: TMenuItem;
    NotasFiscais1: TMenuItem;
    Financeiro1: TMenuItem;
    ContasaReceber1: TMenuItem;
    ContasaPagar1: TMenuItem;
    Relatrios1: TMenuItem;
    Outos1: TMenuItem;
    Agenda1: TMenuItem;
    Calendario1: TMenuItem;
    Calculadora1: TMenuItem;
    Sair1: TMenuItem;
    N3: TMenuItem;
    Sair2: TMenuItem;
    Fabricante1: TMenuItem;
    Grupo1: TMenuItem;
    Laboratrio1: TMenuItem;
    Produto2: TMenuItem;
    NovaOS1: TMenuItem;
    Veculo1: TMenuItem;
    Marca1: TMenuItem;
    Modelo1: TMenuItem;
    Sair3: TMenuItem;
    FormadePagamento1: TMenuItem;
    CONDIO1: TMenuItem;
    Image1: TImage;
    Cores1: TMenuItem;
    Combustivel1: TMenuItem;
    Servio1: TMenuItem;
    BarraStatus: TStatusBar;
    TimerDataHora: TTimer;
    Venda1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ImageList1: TImageList;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    procedure Cliente1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Pas1Click(Sender: TObject);
    procedure Estado1Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure Vendedor1Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure Produto2Click(Sender: TObject);
    procedure Fabricante1Click(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure NovaOS1Click(Sender: TObject);
    procedure Veculo1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure Modelo1Click(Sender: TObject);
    procedure FormadePagamento1Click(Sender: TObject);
    procedure CONDIO1Click(Sender: TObject);
    procedure Cores1Click(Sender: TObject);
    procedure Combustivel1Click(Sender: TObject);
    procedure EntradaCompra1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure Servio1Click(Sender: TObject);
    procedure TimerDataHoraTimer(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
  private
    { Private declarations }
  protected
    umaInter            : Interfaces;
    umproduto           : Produtos;
    umgrupo             : Grupos;
    umfabricante        : Fabricantes;
    umveiculo           : Veiculos;
    umpais              : Paises;
    umestado            : Estados;
    umacidade           : Cidades;
    umfornecedor        : Fornecedores;
    umusuario           : Usuarios;
    umfuncionario       : Funcionarios;
    umcliente           : Clientes;
    umacondicao         : Condicoes;
    ummodelo            : Modelos;
    umamarca            : Marcas;
    umaformapagamento   : FormaPagamentos;
    umacor              : Cores;
    umcombustivel       : Combustiveis;
    umacompra           : Compras;
    umacontapagar       : ContasPagar;
    umaordemservico     : OrdemServicos;
    umservico           : Servicos;
    umavendaproduto     : Venda_Produtos;
    umacontareceber     : ContasReceber;

    umactrlpais           : Controllerpaises;
    umactrlestado         : Controllerestados;
    umactrlcidade         : Controllercidades;
    umactrlproduto        : Controllerprodutos;
    umactrlcliente        : Controllerclientes;
    umactrlgrupo          : Controllergrupos;
    umactrlfabricante     : Controllerfabricantes;
    umactrlveiculo        : ControllerVeiculos;
    umactrlusuario        : Controllerusuarios;
    umactrlfuncionario    : Controllerfuncionarios;
    umactrlfornecedor     : Controllerfornecedores;
    umactrlmarca          : ControllerMarcas;
    umactrlmodelo         : ControllerModelos;
    umactrlcondicao       : ControllerCondicoes;
    umactrlformapagamento : ControllerFormaPagamentos;
    umactrlcor            : ControllerCores;
    umactrlcombustivel    : ControllerCombustiveis;
    umactrlcompra         : ControllerCompras;
    umactrlcontapagar     : ControllerContasPagar;
    umactrlordemservico   : ControllerOrdemServicos;
    umactrlservico        : ControllerServicos;
    umactrlvendaproduto   : ControllerVenda_Produtos;
    umactrlcontareceber   : ControllerContasReceber;
  public
    { Public declarations }
    procedure ConhecaObj (pInter : Interfaces; pproduto : Produtos; pgrupo : Grupos; pfabricante : Fabricantes;
    pveiculo : Veiculos; ppais : Paises; pestado : Estados; pcidade : Cidades; pfornecedor : Fornecedores;
    pcliente : Clientes; pusuario : Usuarios; pfuncionario : Funcionarios; pctrlpais : Controllerpaises;pctrlestado : Controllerestados; pctrlcidade: Controllercidades; pctrlproduto: Controllerprodutos; pctrlcliente : Controllerclientes; pctrlgrupo : Controllergrupos; pctrlfabricante : Controllerfabricantes;
    pctrlveiculo : Controllerveiculos; pctrlusuario : Controllerusuarios; pctrlfuncionario : Controllerfuncionarios; pctrlfornecedor : Controllerfornecedores; pmarca : Marcas; pctrlmarca : ControllerMarcas; pmodelo : Modelos; pctrlmodelo : ControllerModelos; pcondicao: Condicoes; pctrlcondicao: ControllerCondicoes; pformapagamento : FormaPagamentos; pctrlformapagamento : ControllerFormaPagamentos;
    pcor : Cores; pctrlcor : ControllerCores; pcombustivel : Combustiveis; pctrlcombustivel : ControllerCombustiveis; pcompra : Compras; pctrlcompra : ControllerCompras; pcontapagar : ContasPagar; pctrlcontapagar : ControllerContasPagar; pordemservico : OrdemServicos; pctrlordemservico : ControllerOrdemServicos; pservico : Servicos; pctrlservico : ControllerServicos; pvendaproduto : Venda_Produtos; pctrlvendaproduto : ControllerVenda_Produtos;
    pcontasreceber : ContasReceber; pctrlcontareceber : ControllerContasReceber);
  end;

var
  Gerente: TGerente;

implementation

{$R *.dfm}

{ TGerente }

procedure TGerente.Agenda1Click(Sender: TObject);
begin
  WinExec('notepad.exe',SW_Show);
end;

procedure TGerente.Calculadora1Click(Sender: TObject);
begin
  WinExec('Calc.Exe',SW_Show);
end;

procedure TGerente.Cidade1Click(Sender: TObject);
begin
  umaInter.PDcidade (umacidade, umactrlcidade);
end;

procedure TGerente.Cliente1Click(Sender: TObject);
begin
  umaInter.PDcliente(umcliente, umactrlcliente);
end;

procedure TGerente.Combustivel1Click(Sender: TObject);
begin
  umainter.PDcombustivel(umcombustivel, umactrlcombustivel);
end;

procedure TGerente.CONDIO1Click(Sender: TObject);
begin
  umainter.PDcondicao(umacondicao, umactrlcondicao);
end;

procedure TGerente.ConhecaObj(pInter : Interfaces; pproduto : Produtos; pgrupo : Grupos; pfabricante : Fabricantes;
    pveiculo : Veiculos; ppais : Paises; pestado : Estados; pcidade : Cidades; pfornecedor : Fornecedores;
    pcliente : Clientes; pusuario : Usuarios; pfuncionario : Funcionarios; pctrlpais : Controllerpaises;pctrlestado : Controllerestados; pctrlcidade: Controllercidades; pctrlproduto: Controllerprodutos; pctrlcliente : Controllerclientes; pctrlgrupo : Controllergrupos; pctrlfabricante : Controllerfabricantes;
    pctrlveiculo : Controllerveiculos; pctrlusuario : Controllerusuarios; pctrlfuncionario : Controllerfuncionarios; pctrlfornecedor : Controllerfornecedores; pmarca : Marcas; pctrlmarca : ControllerMarcas; pmodelo : Modelos; pctrlmodelo : ControllerModelos; pcondicao: Condicoes; pctrlcondicao: ControllerCondicoes; pformapagamento : FormaPagamentos; pctrlformapagamento : ControllerFormaPagamentos;
    pcor : Cores; pctrlcor : Controllercores; pcombustivel : Combustiveis; pctrlcombustivel : ControllerCombustiveis; pcompra : Compras; pctrlcompra : ControllerCompras; pcontapagar : ContasPagar; pctrlcontapagar : ControllerContasPagar; pordemservico : OrdemServicos; pctrlordemservico : ControllerOrdemServicos; pservico : Servicos; pctrlservico : ControllerServicos; pvendaproduto : Venda_Produtos; pctrlvendaproduto : ControllerVenda_Produtos;
    pcontasreceber : ContasReceber; pctrlcontareceber : ControllerContasReceber);
begin
  umaInter                  := pInter;
  umproduto                 := pproduto;
  umgrupo                   := pgrupo;
  umfabricante              := pfabricante;
  umveiculo                 := pveiculo;
  umpais                    := ppais;
  umestado                  := pestado;
  umacidade                 := pcidade;
  umcliente                 := pcliente;
  umusuario                 := pusuario;
  umfuncionario             := pfuncionario;
  umfornecedor              := pfornecedor;
  umactrlpais               := pctrlpais;
  umactrlestado             := pctrlestado;
  umactrlcidade             := pctrlcidade;
  umactrlproduto            := pctrlproduto;
  umactrlcliente            := pctrlcliente;
  umactrlgrupo              := pctrlgrupo;
  umactrlfabricante         := pctrlfabricante;
  umactrlveiculo            := pctrlveiculo;
  umactrlusuario            := pctrlusuario;
  umactrlfuncionario        := pctrlfuncionario;
  umactrlfornecedor         := pctrlfornecedor;
  umamarca                  := pmarca;
  umactrlmarca              := pctrlmarca;
  ummodelo                  := pmodelo;
  umactrlmodelo             := pctrlmodelo;
  umactrlcondicao           := pctrlcondicao;
  umacondicao               := pcondicao;
  umaformapagamento         := pformapagamento;
  umactrlformapagamento     := pctrlformapagamento;
  umacor                    := pcor;
  umactrlcor                := pctrlcor;
  umcombustivel             := pcombustivel;
  umactrlcombustivel        := pctrlcombustivel;
  umacompra                 := pcompra;
  umactrlcompra             := pctrlcompra;
  umacontapagar             := pcontapagar;
  umactrlcontapagar         := pctrlcontapagar;
  umaordemservico           := pordemservico;
  umactrlordemservico       := pctrlordemservico;
  umservico                 := pservico;
  umactrlservico            := pctrlservico;
  umavendaproduto           := pvendaproduto;
  umactrlvendaproduto       := pctrlvendaproduto;
  umacontareceber           := pcontasreceber;
  umactrlcontareceber       := pctrlcontareceber;

end;

procedure TGerente.ContasaPagar1Click(Sender: TObject);
begin
  umainter.PDcontaspagar(umacontapagar, umactrlcontapagar);
end;

procedure TGerente.ContasaReceber1Click(Sender: TObject);
begin
  umainter.PDcontasReceber(umacontareceber, umactrlcontareceber);
end;

procedure TGerente.Cores1Click(Sender: TObject);
begin
  umainter.PDcor(umacor, umactrlcor);
end;

procedure TGerente.EntradaCompra1Click(Sender: TObject);
begin
  umainter.PDcompra(umacompra, umactrlcompra);
end;

procedure TGerente.Estado1Click(Sender: TObject);
begin
  umaInter.PDestado(umestado, umactrlestado);
end;

procedure TGerente.Fabricante1Click(Sender: TObject);
begin
  umaInter.PDfabricante(umfabricante, umactrlfabricante);
end;

procedure TGerente.FormadePagamento1Click(Sender: TObject);
begin
  umainter.PDformapagamento(umaformapagamento, umactrlformapagamento);
end;

procedure TGerente.Fornecedor1Click(Sender: TObject);
begin
  umaInter.PDfornecedor(umfornecedor, umactrlfornecedor);
end;

procedure TGerente.Grupo1Click(Sender: TObject);
begin
  umaInter.PDgrupo(umgrupo, umactrlgrupo);
end;

procedure TGerente.Marca1Click(Sender: TObject);
begin
  umainter.PDmarca(umamarca, umactrlmarca);
end;

procedure TGerente.Modelo1Click(Sender: TObject);
begin
  umainter.PDmodelo(ummodelo, umactrlmodelo);
end;

procedure TGerente.NovaOS1Click(Sender: TObject);
begin
  umainter.PDordemservico(umaordemservico, umactrlordemservico);
end;

procedure TGerente.Pas1Click(Sender: TObject);
begin
  umaInter.PDpais(umpais, umactrlpais);
end;

procedure TGerente.Produto2Click(Sender: TObject);
begin
  umaInter.PDproduto(umproduto, umactrlproduto);
end;

procedure TGerente.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TGerente.Sair2Click(Sender: TObject);
begin
  close;
end;

procedure TGerente.Servio1Click(Sender: TObject);
begin
  umainter.PDservico(umservico, umactrlservico);
end;

procedure TGerente.TimerDataHoraTimer(Sender: TObject);
begin
  self.BarraStatus.Panels[0].Text := 'Foz do Igua�u - Eletrica TIBAGI ';
  self.BarraStatus.Panels[1].Text := Datetostr(Date);
  self.BarraStatus.Panels[2].Text := TimetoStr(Time);
end;

procedure TGerente.ToolButton15Click(Sender: TObject);
begin
  close;
end;

procedure TGerente.ToolButton16Click(Sender: TObject);
begin
  umainter.PDcontaspagar(umacontapagar, umactrlcontapagar);
end;

procedure TGerente.ToolButton18Click(Sender: TObject);
begin
  umainter.PDcontasReceber(umacontareceber, umactrlcontareceber);
end;

procedure TGerente.ToolButton1Click(Sender: TObject);
begin
  umaInter.PDcliente(umcliente, umactrlcliente);
end;

procedure TGerente.ToolButton2Click(Sender: TObject);
begin
  umainter.PDfornecedor(umfornecedor, umactrlfornecedor);
end;

procedure TGerente.ToolButton3Click(Sender: TObject);
begin
  umaInter.PDusuario(umusuario, umactrlusuario);
end;

procedure TGerente.ToolButton4Click(Sender: TObject);
begin
  umaInter.PDfuncionario(umfuncionario, umactrlfuncionario);
end;

procedure TGerente.ToolButton6Click(Sender: TObject);
begin
  umainter.PDcompra(umacompra, umactrlcompra);
end;

procedure TGerente.ToolButton7Click(Sender: TObject);
begin
  umainter.PDvenda(umavendaproduto, umactrlvendaproduto);
end;

procedure TGerente.ToolButton8Click(Sender: TObject);
begin
  umainter.PDordemservico(umaordemservico, umactrlordemservico);
end;

procedure TGerente.Usurio1Click(Sender: TObject);
begin
  umaInter.PDusuario(umusuario, umactrlusuario);
end;

procedure TGerente.Veculo1Click(Sender: TObject);
begin
  umaInter.PDveiculo(umveiculo, umactrlveiculo);
end;

procedure TGerente.Venda1Click(Sender: TObject);
begin
  umainter.PDvenda(umavendaproduto, umactrlvendaproduto);
end;

procedure TGerente.Vendedor1Click(Sender: TObject);
begin
  umaInter.PDfuncionario(umfuncionario, umactrlfuncionario);
end;

end.
