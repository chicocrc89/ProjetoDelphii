unit uFrmConsultaOrdemServ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, uFrmCadastroOrdemServ, uDM,
  uOrdemServicos, uControllerOrdemServicos;

type
  TFrmConsultaOrdemServ = class(TFrmConsulta)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Edit2: TEdit;
    Label3: TLabel;
    FILTROS: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SpeedButton3: TSpeedButton;
    btnvisualizar: TSpeedButton;
    btncancelar: TSpeedButton;
    procedure btnvisualizarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umFrmCadastroordemservico: TFrmCadastroordemserv;
    umdm: TDM;
    umaordemservico: OrdemServicos;
    umactrlordemservico: ControllerOrdemServicos;
    procedure Novo; Override;
    procedure Alterar; Override;
    procedure Excluir; Override;
    procedure Sair; Override;
    procedure Pesquisar; Override;
    procedure Visualizar;
    procedure Cancelar;
  public
    { Public declarations }
    procedure conhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure SetFrmCadastro(pObj: TObject); Override;
  end;

var
  FrmConsultaOrdemServ: TFrmConsultaOrdemServ;

implementation

{$R *.dfm}

{ TFrmConsultaOrdemServ }

procedure TFrmConsultaOrdemServ.Alterar;
begin
  inherited;
  self.umactrlordemservico.Carregar(umaordemservico);
  self.umFrmCadastroordemservico.conhecaObj(umaordemservico, umactrlordemservico);
  self.umFrmCadastroordemservico.CarregaEdt;
  self.umFrmCadastroordemservico.CarregaLV;
  self.umFrmCadastroordemservico.carregaLV2;
  self.umFrmCadastroordemservico.carregaLV3;
  self.umFrmCadastroordemservico.DesbloqueiaEdt;
  self.umFrmCadastroordemservico.btnaddproduto.Enabled := true;
  self.umFrmCadastroordemservico.btnremove.Enabled := true;
  self.umFrmCadastroordemservico.btnaddservico.Enabled := true;
  self.umFrmCadastroordemservico.btnremoveservico.Enabled := true;
  if self.umaordemservico.getstatus = 'CANCELADA' then
  begin
    showmessage('N�o � possivel alterar, OS CANCELADA');
  end
  else
  begin
    umFrmCadastroordemservico.ShowModal;
  end;
  self.Pesquisar;
end;

procedure TFrmConsultaOrdemServ.btnvisualizarClick(Sender: TObject);
begin
  inherited;
  self.Visualizar;
end;

procedure TFrmConsultaOrdemServ.Cancelar;
begin
  self.umactrlordemservico.Carregar(umaordemservico);
  self.umFrmCadastroordemservico.conhecaObj(umaordemservico, umactrlordemservico);
  self.umFrmCadastroordemservico.CarregaEdt;
  self.umFrmCadastroordemservico.BloqueiaEdt;
  self.umFrmCadastroordemservico.CarregaLV;
  self.umFrmCadastroordemservico.carregaLV2;
  self.umFrmCadastroordemservico.carregaLV3;
  self.umFrmCadastroordemservico.btnSalvar.Enabled := false;
  self.umFrmCadastroordemservico.btnaddproduto.Enabled := false;
  self.umFrmCadastroordemservico.btnaddservico.Enabled := false;
  self.umFrmCadastroordemservico.btnremove.Enabled := false;
  self.umFrmCadastroordemservico.btnremoveservico.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisacliente.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisausuario.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisacor.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisamodelo.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisaproduto.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisaservico.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisacondicao.Enabled := false;
  self.umFrmCadastroordemservico.btngeraparcela.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisafuncionario.Enabled := false;
  self.umFrmCadastroordemservico.btnremovecontasreceber.Enabled := false;
  umFrmCadastroordemservico.ShowModal;
  self.umFrmCadastroordemservico.btnSalvar.Enabled := true;
  self.umFrmCadastroordemservico.btnaddproduto.Enabled := true;
  self.umFrmCadastroordemservico.btnaddservico.Enabled := true;
  self.umFrmCadastroordemservico.btnremove.Enabled := true;
  self.umFrmCadastroordemservico.btnremoveservico.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisacliente.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisausuario.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisacor.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisamodelo.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisaproduto.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisaservico.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisacondicao.Enabled := true;
  self.umFrmCadastroordemservico.btngeraparcela.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisafuncionario.Enabled := true;
  self.umFrmCadastroordemservico.btnremovecontasreceber.Enabled := true;
  self.Pesquisar;
end;

procedure TFrmConsultaOrdemServ.conhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umaordemservico := OrdemServicos(pObj);
  umactrlordemservico := ControllerOrdemServicos(pctrl);
  self.umFrmCadastroordemservico.conhecaObj(umaordemservico, umactrlordemservico);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlordemservico.getds;
end;

procedure TFrmConsultaOrdemServ.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlordemservico.Carregar(umaordemservico);
  self.umFrmCadastroordemservico.conhecaObj(umaordemservico, umactrlordemservico);
  self.umFrmCadastroordemservico.limpaedt;
  self.umFrmCadastroordemservico.CarregaEdt;
  self.umFrmCadastroordemservico.bloqueiaedt;
  self.umFrmCadastroordemservico.CarregaLV;
  self.umFrmCadastroordemservico.carregaLV2;
  self.umFrmCadastroordemservico.carregaLV3;
  mtitulo := umFrmCadastroordemservico.btnSalvar.Caption;
  umFrmCadastroordemservico.btnSalvar.Caption := '&Excluir';
  umFrmCadastroordemservico.ShowModal;
  self.umFrmCadastroordemservico.DesbloqueiaEdt;
  umFrmCadastroordemservico.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaOrdemServ.Novo;
begin
  inherited;
  self.umaordemservico.setcodigo(0);
  self.umaordemservico.setCadastro(Date);
  self.umaordemservico.setUlt_Alt(Date);
  self.umFrmCadastroordemservico.edttotalproduto.Text := floattostr(0.00);
  self.umFrmCadastroordemservico.edttotalservico.Text := floattostr(0.00);
  self.umFrmCadastroordemservico.edtdesconto.Text := floattostr(0.00);
  self.umFrmCadastroordemservico.edttotalos.Text := floattostr(0.00);
  self.umFrmCadastroordemservico.comboboxstatus.ItemIndex := 0;
  SELF.umaordemservico.setoutras_despesas(0.00);
  self.umaordemservico.sethora_emissao(time);
  self.umaordemservico.setdata_emissao(Date);
  self.umFrmCadastroordemservico.limpaedt;
  self.umFrmCadastroordemservico.DesbloqueiaEdt;
  self.umFrmCadastroordemservico.btnaddservico.Enabled := false;
  self.umFrmCadastroordemservico.btnaddproduto.Enabled := false;
  self.umFrmCadastroordemservico.btnremove.Enabled := false;
  self.umFrmCadastroordemservico.btnremoveservico.Enabled := false;
  self.umFrmCadastroordemservico.ListView1.Clear;
  self.umFrmCadastroordemservico.ListView2.Clear;
  self.umFrmCadastroordemservico.ListView3.Clear;
  self.umFrmCadastroordemservico.comboboxstatus.Enabled := false;
  self.umFrmCadastroordemservico.conhecaObj(umaordemservico, umactrlordemservico);
  self.umFrmCadastroordemservico.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaOrdemServ.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlordemservico.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('Ordem de Servi�o ' + self.edtPesquisar.Text + ' N�O ENCONTRADA');
end;

procedure TFrmConsultaOrdemServ.Sair;
begin
  inherited;
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlordemservico.Carregar(umaordemservico);
end;

procedure TFrmConsultaOrdemServ.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umfrmcadastroordemservico := TFrmCadastroOrdemServ(pObj);
end;

procedure TFrmConsultaOrdemServ.Visualizar;
begin
  self.umactrlordemservico.Carregar(umaordemservico);
  self.umFrmCadastroordemservico.conhecaObj(umaordemservico, umactrlordemservico);
  self.umFrmCadastroordemservico.CarregaEdt;
  self.umFrmCadastroordemservico.BloqueiaEdt;
  self.umFrmCadastroordemservico.CarregaLV;
  self.umFrmCadastroordemservico.carregaLV2;
  self.umFrmCadastroordemservico.carregaLV3;
  self.umFrmCadastroordemservico.btnSalvar.Enabled := false;
  self.umFrmCadastroordemservico.btnaddproduto.Enabled := false;
  self.umFrmCadastroordemservico.btnaddservico.Enabled := false;
  self.umFrmCadastroordemservico.btnremove.Enabled := false;
  self.umFrmCadastroordemservico.btnremoveservico.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisacliente.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisausuario.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisacor.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisamodelo.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisaproduto.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisaservico.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisacondicao.Enabled := false;
  self.umFrmCadastroordemservico.btngeraparcela.Enabled := false;
  self.umFrmCadastroordemservico.btnpesquisafuncionario.Enabled := false;
  self.umFrmCadastroordemservico.btnremovecontasreceber.Enabled := false;
  if umaordemservico.getstatus = 'CANCELADA' then
  begin
    self.umFrmCadastroordemservico.btncancelaros.Enabled := false;
  end
  else
  begin
    self.umFrmCadastroordemservico.btncancelaros.Enabled := true;
  end;
  umFrmCadastroordemservico.ShowModal;
  self.umFrmCadastroordemservico.btnSalvar.Enabled := true;
  self.umFrmCadastroordemservico.btnaddproduto.Enabled := true;
  self.umFrmCadastroordemservico.btnaddservico.Enabled := true;
  self.umFrmCadastroordemservico.btnremove.Enabled := true;
  self.umFrmCadastroordemservico.btnremoveservico.Enabled := true;
    self.umFrmCadastroordemservico.btnpesquisacliente.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisausuario.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisacor.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisamodelo.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisaproduto.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisaservico.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisacondicao.Enabled := true;
  self.umFrmCadastroordemservico.btngeraparcela.Enabled := true;
  self.umFrmCadastroordemservico.btnpesquisafuncionario.Enabled := true;
  self.umFrmCadastroordemservico.btnremovecontasreceber.Enabled := true;
  self.Pesquisar;
end;

end.
