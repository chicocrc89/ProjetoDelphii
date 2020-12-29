unit uFrmConsultaUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Vcl.ComCtrls,
  Vcl.StdCtrls, uFrmCadastroUsuario,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, uDM, uUsuarios, uControllerUsuarios;

type
  TFrmConsultaUsuario = class(TFrmConsulta)
    mmtableusuario: TFDMemTable;
  private
    { Private declarations }
  protected
    umusuario : Usuarios;
    umactrlusuario : ControllerUsuarios;
    umdm : TDM;
    umFrmCadastroUsuario: TFrmCadastroUsuario;
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
  FrmConsultaUsuario: TFrmConsultaUsuario;

implementation

{$R *.dfm}
{ TFrmConsultaUsuario }

procedure TFrmConsultaUsuario.Alterar;
begin
  inherited;
  self.umactrlusuario.Carregar(umusuario);
  self.umFrmCadastroUsuario.limpaedt;
  self.umFrmCadastroUsuario.conhecaObj(umusuario, umactrlusuario);
  self.umFrmCadastroUsuario.carregaedt;
  self.umFrmCadastroUsuario.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaUsuario.conhecaObj(pObj: TObject; pctrl: TObject);
begin
  inherited;
  umusuario := Usuarios (pObj);
  umactrlusuario := ControllerUsuarios (pctrl);
  self.umFrmCadastroUsuario.conhecaObj(umusuario, umactrlusuario);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlusuario.getds;
end;

procedure TFrmConsultaUsuario.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umactrlusuario.Carregar(umusuario);
  self.umFrmCadastroUsuario.conhecaObj(umusuario, umactrlusuario);
  self.umFrmCadastroUsuario.limpaedt;
  self.umFrmCadastroUsuario.carregaedt;
  self.umFrmCadastroUsuario.bloqueiaedt;
  mtitulo := umFrmCadastroUsuario.btnSalvar.Caption;
  umFrmCadastroUsuario.btnSalvar.Caption := '&Excluir';
  umFrmCadastroUsuario.ShowModal;
  self.umFrmCadastroUsuario.DesbloqueiaEdt;
  umFrmCadastroUsuario.btnSalvar.Caption := mtitulo;
  self.Pesquisar;
end;

procedure TFrmConsultaUsuario.Novo;
begin
  inherited;
  self.umusuario.setcodigo(0);
  self.umusuario.setCadastro(Date);
  self.umusuario.setUlt_Alt(Date);
  self.umusuario.setCodigo_Usuario(1);
  self.umFrmCadastroUsuario.limpaedt;
  self.umFrmCadastroUsuario.DesbloqueiaEdt;
  self.umFrmCadastroUsuario.conhecaObj(umusuario, umactrlusuario);
  self.umFrmCadastroUsuario.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaUsuario.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlusuario.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('USUARIO' + self.edtPesquisar.Text + 'NÃO ENCONTRADO');
end;

procedure TFrmConsultaUsuario.Sair;
begin
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlusuario.Carregar(umusuario);
  inherited;
end;

procedure TFrmConsultaUsuario.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umFrmCadastroUsuario := TFrmCadastroUsuario(pObj);
end;

end.
