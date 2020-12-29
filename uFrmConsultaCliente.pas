unit uFrmConsultaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Vcl.ComCtrls,
  Vcl.StdCtrls, uFrmCadastroCliente,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons,
  uDM, uClientes, uControllerClientes;

type
  TFrmConsultaCliente = class(TFrmConsulta)
  private
    { Private declarations }
  protected
    umFrmCadastroCliente: TFrmCadastroCliente;
    umdm: TDM;
    umcliente: Clientes;
    umactrlcliente: ControllerClientes;
    procedure Novo; Override;
    procedure Alterar; Override;
    procedure Excluir; Override;
    procedure Sair; Override;
    procedure Pesquisar; Override;
  public
    { Public declarations }
    procedure conhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure SetFrmCadastro(pObj: TObject); Override;

  end;

var
  FrmConsultaCliente: TFrmConsultaCliente;

implementation

{$R *.dfm}
{ TFrmConsultaCliente }

procedure TFrmConsultaCliente.Alterar;
begin
  inherited;
  self.umactrlcliente.Carregar(umcliente);
  self.umFrmCadastroCliente.conhecaObj(umcliente, umactrlcliente);
  self.umFrmCadastroCliente.CarregaEdt;
  self.umFrmCadastroCliente.tpcliente.Enabled := false;
  umFrmCadastroCliente.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaCliente.conhecaObj(pObj: TObject; pctrl: TObject);
begin
  inherited;
  umcliente := Clientes(pObj);
  umactrlcliente := ControllerClientes(pctrl);
  self.umFrmCadastroCliente.conhecaObj(umcliente, umactrlcliente);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlcliente.getds;
end;

procedure TFrmConsultaCliente.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlcliente.Carregar(umcliente);
  self.umFrmCadastroCliente.conhecaObj(umcliente, umactrlcliente);
  self.umFrmCadastroCliente.limpaedt;
  self.umFrmCadastroCliente.CarregaEdt;
  self.umFrmCadastroCliente.bloqueiaedt;
  mtitulo := umFrmCadastroCliente.btnSalvar.Caption;
  umFrmCadastroCliente.btnSalvar.Caption := '&Excluir';
  umFrmCadastroCliente.ShowModal;
  self.umFrmCadastroCliente.DesbloqueiaEdt;
  umFrmCadastroCliente.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaCliente.Novo;
begin
  inherited;
  self.umcliente.setcodigo(0);
  self.umcliente.setCadastro(Date);
  self.umcliente.setUlt_Alt(Date);
  self.umcliente.setlimite(0.00);
  self.umFrmCadastroCliente.limpaedt;
  self.umFrmCadastroCliente.DesbloqueiaEdt;
  self.umFrmCadastroCliente.conhecaObj(umcliente, umactrlcliente);
  self.umFrmCadastroCliente.ShowModal;

  self.Pesquisar;
end;

procedure TFrmConsultaCliente.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlcliente.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('CLIENTE ' + self.edtPesquisar.Text + ' N�O ENCONTRADO');
end;

procedure TFrmConsultaCliente.Sair;
begin
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlcliente.Carregar(umcliente);
  inherited;
end;

procedure TFrmConsultaCliente.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umFrmCadastroCliente := TFrmCadastroCliente(pObj);
end;

end.
