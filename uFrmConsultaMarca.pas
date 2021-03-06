unit uFrmConsultaMarca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, uDM, uFrmCadastroMarca, uMarcas,
  uControllerMarcas;

type
  TFrmConsultaMarca = class(TFrmConsulta)
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umFrmCadastroMarca: TFrmCadastroMarca;
    umamarca: Marcas;
    umactrlmarca: Controllermarcas;
    umdm: TDM;
    procedure Novo; Override;
    procedure Alterar; Override;
    procedure Excluir; Override;
    procedure Sair; Override;
    procedure Pesquisar; Override;

  public
    procedure conhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure SetFrmCadastro(pObj: TObject); Override;

  end;

var
  FrmConsultaMarca: TFrmConsultaMarca;

implementation

{$R *.dfm}
{ TFrmConsultaMarca }

procedure TFrmConsultaMarca.Alterar;
begin
  inherited;
  self.umactrlmarca.Carregar(umamarca);
  self.umFrmCadastroMarca.limpaedt;
  self.umFrmCadastroMarca.conhecaObj(umamarca, umactrlmarca);
  self.umFrmCadastroMarca.carregaedt;
  self.umFrmCadastroMarca.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaMarca.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  self.Pesquisar;
end;

procedure TFrmConsultaMarca.btnSairClick(Sender: TObject);
begin
  inherited;
  CLOSE;
end;

procedure TFrmConsultaMarca.conhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umamarca := Marcas(pObj);
  umactrlmarca := Controllermarcas(pctrl);
  self.umFrmCadastroMarca.conhecaObj(umamarca, umactrlmarca);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlmarca.getds;
end;

procedure TFrmConsultaMarca.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlmarca.Carregar(umamarca);
  self.umFrmCadastroMarca.conhecaObj(umamarca, umactrlmarca);
  self.umFrmCadastroMarca.limpaedt;
  self.umFrmCadastroMarca.carregaedt;
  self.umFrmCadastroMarca.bloqueiaedt;
  mtitulo := umFrmCadastroMarca.btnSalvar.Caption;
  umFrmCadastroMarca.btnSalvar.Caption := '&Excluir';
  umFrmCadastroMarca.ShowModal;
  self.umFrmCadastroMarca.DesbloqueiaEdt;
  umFrmCadastroMarca.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaMarca.Novo;
begin
  inherited;
  self.umamarca.setcodigo(0);
  self.umamarca.setCadastro(Date);
  self.umamarca.setUlt_Alt(Date);
  self.umFrmCadastroMarca.limpaedt;
  self.umFrmCadastroMarca.conhecaObj(umamarca, umactrlmarca);
  self.umFrmCadastroMarca.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaMarca.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlmarca.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('MARCA' + self.edtPesquisar.Text + 'N�O ENCONTRADO');
end;

procedure TFrmConsultaMarca.Sair;
begin
  if self.btnSair.Caption = 'SELECIONAR' then
    umactrlmarca.Carregar(umamarca);
end;

procedure TFrmConsultaMarca.SetFrmCadastro(pObj: TObject);
begin
  umFrmCadastroMarca := TFrmCadastroMarca(pObj);
end;

end.
