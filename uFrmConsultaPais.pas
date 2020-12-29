unit uFrmConsultaPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Vcl.ComCtrls,
  Vcl.StdCtrls, uFrmCadastroPais,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, uPaises,
  uControllerpaises, uDM,
  Vcl.Buttons;

type
  TFrmConsultaPais = class(TFrmConsulta)
    mmtablepais: TFDMemTable;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umFrmCadastroPais: TFrmCadastroPais;
    umpais: Paises;
    umactrlpais: Controllerpaises;
    umdm: TDM;
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
  FrmConsultaPais: TFrmConsultaPais;

implementation

{$R *.dfm}
{ TFrmConsultaPais }

procedure TFrmConsultaPais.Alterar;
begin
  inherited;
  self.umactrlpais.Carregar(umpais);
  self.umFrmCadastroPais.limpaedt;
  self.umFrmCadastroPais.conhecaObj(umpais, umactrlpais);
  self.umFrmCadastroPais.carregaedt;
  self.umFrmCadastroPais.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaPais.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  self.Pesquisar;
end;

procedure TFrmConsultaPais.conhecaObj(pObj: TObject; pctrl: TObject);
begin
  inherited;
  umpais := Paises(pObj);
  umactrlpais := Controllerpaises(pctrl);
  self.umFrmCadastroPais.conhecaObj(umpais, umactrlpais);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlpais.getds;
end;

procedure TFrmConsultaPais.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlpais.Carregar(umpais);
  self.umFrmCadastroPais.conhecaObj(umpais, umactrlpais);
  self.umFrmCadastroPais.limpaedt;
  self.umFrmCadastroPais.carregaedt;
  self.umFrmCadastroPais.bloqueiaedt;
  mtitulo := umFrmCadastroPais.btnSalvar.Caption;
  umFrmCadastroPais.btnSalvar.Caption := '&Excluir';
  umFrmCadastroPais.ShowModal;
  self.umFrmCadastroPais.DesbloqueiaEdt;
  umFrmCadastroPais.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaPais.Novo;
begin
  inherited;
  self.umpais.setcodigo(0);
  self.umpais.setCadastro(Date);
  self.umpais.setUlt_Alt(Date);
  self.umFrmCadastroPais.limpaedt;
  self.umFrmCadastroPais.conhecaObj(umpais, umactrlpais);
  self.umFrmCadastroPais.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaPais.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlpais.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('PA�S' + self.edtPesquisar.Text + 'N�O ENCONTRADO');
end;

procedure TFrmConsultaPais.Sair;
begin
  if self.btnSair.Caption = 'SELECIONAR' then
    umactrlpais.Carregar(umpais);
  inherited;

end;

procedure TFrmConsultaPais.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umFrmCadastroPais := TFrmCadastroPais(pObj);
end;

end.
