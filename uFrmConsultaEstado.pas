unit uFrmConsultaEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Vcl.ComCtrls,
  Vcl.StdCtrls, uFrmCadastroEstado,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, uDM,
  uEstados, uControllerEstados,
  Vcl.Buttons;

type
  TFrmConsultaEstado = class(TFrmConsulta)
    mmtableestado: TFDMemTable;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umFrmCadastroEstado: TFrmCadastroEstado;
    umdm: TDM;
    umestado: Estados;
    umactrlestado: ControllerEstados;
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
  FrmConsultaEstado: TFrmConsultaEstado;

implementation

{$R *.dfm}
{ TFrmConsultaEstado }

procedure TFrmConsultaEstado.Alterar;
begin
  inherited;
  self.umactrlestado.Carregar(umestado);
  self.umFrmCadastroEstado.conhecaObj(umestado, umactrlestado);
  self.umFrmCadastroEstado.carregaedt;
  self.umFrmCadastroEstado.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaEstado.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  self.Pesquisar;
end;

procedure TFrmConsultaEstado.conhecaObj(pObj: TObject; pctrl: TObject);
begin
  inherited;
  umestado := Estados(pObj);
  umactrlestado := ControllerEstados(pctrl);
  self.umFrmCadastroEstado.conhecaObj(umestado, umactrlestado);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlestado.getds;
end;

procedure TFrmConsultaEstado.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlestado.Carregar(umestado);
  self.umFrmCadastroEstado.conhecaObj(umestado, umactrlestado);
  self.umFrmCadastroEstado.limpaedt;
  self.umFrmCadastroEstado.carregaedt;
  self.umFrmCadastroEstado.bloqueiaedt;
  mtitulo := umFrmCadastroEstado.btnSalvar.Caption;
  umFrmCadastroEstado.btnSalvar.Caption := '&Excluir';
  umFrmCadastroEstado.ShowModal;
  self.umFrmCadastroEstado.DesbloqueiaEdt;
  umFrmCadastroEstado.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaEstado.Novo;
begin
  inherited;
  self.umestado.setcodigo(0);
  self.umestado.setCadastro(Date);
  self.umestado.setUlt_Alt(Date);
  self.umFrmCadastroEstado.limpaedt;
  self.umFrmCadastroEstado.DesbloqueiaEdt;
  self.umFrmCadastroEstado.conhecaObj(umestado, umactrlestado);
  self.umFrmCadastroEstado.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaEstado.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlestado.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('ESTADO' + self.edtPesquisar.Text + 'N�O ENCONTRADO');
end;

procedure TFrmConsultaEstado.Sair;
begin
  inherited;
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlestado.Carregar(umestado);
end;

procedure TFrmConsultaEstado.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umFrmCadastroEstado := TFrmCadastroEstado(pObj);
end;

end.
