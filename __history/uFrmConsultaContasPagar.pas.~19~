unit uFrmConsultaContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, uDM, Vcl.ExtCtrls, uContasPagar, uControllerContasPagar,
  uFrmCadastroContasPagar;

type
  TFrmConsultaContasPagar = class(TFrmConsulta)
    SpeedButton1: TSpeedButton;
    FILTROS: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure btnNovoClick(Sender: TObject);
  private
    umFrmCadastroContasPagar: TFrmCadastroContasPagar;
    umaContapagar: ContasPagar;
    umactrlcontapagar: ControllerContasPagar;
    umdm : Tdm;
  protected
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
  FrmConsultaContasPagar: TFrmConsultaContasPagar;

implementation

{$R *.dfm}

{ TFrmConsultaContasPagar }

procedure TFrmConsultaContasPagar.Alterar;
begin
  inherited;
  self.umactrlcontapagar.Carregar(umacontapagar);
  self.umFrmCadastroContaspagar.conhecaObj(umacontapagar, umactrlcontapagar);
  self.umFrmCadastroContaspagar.CarregaEdt;
  umFrmCadastroContaspagar.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaContasPagar.btnNovoClick(Sender: TObject);
begin
  inherited;
  self.umFrmCadastroContasPagar.ShowModal;
end;

procedure TFrmConsultaContasPagar.conhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umacontapagar := ContasPagar(pObj);
  umactrlcontapagar := ControllerContasPagar(pctrl);
  self.umFrmCadastrocontaspagar.conhecaObj(umacontapagar, umactrlcontapagar);
  self.Pesquisar;
  self.DBGrid1.DataSource := umactrlcontapagar.getds;
end;

procedure TFrmConsultaContasPagar.Excluir;
var
  mtitulo: string;
begin
  inherited;
  self.umacontapagar.setcodigo(5);
  self.umactrlcontapagar.Carregar(umacontapagar);
  self.umFrmCadastrocontaspagar.conhecaObj(umacontapagar, umactrlcontapagar);
  self.umFrmCadastrocontaspagar.limpaedt;
  self.umFrmCadastrocontaspagar.CarregaEdt;
  self.umFrmCadastrocontaspagar.bloqueiaedt;
  self.umFrmCadastroContasPagar.liberapagamento;
  mtitulo := umFrmCadastrocontaspagar.btnSalvar.Caption;
  //umFrmCadastrocontaspagar.btnSalvar.Caption := '&Excluir';
  umFrmCadastrocontaspagar.btnSalvar.Visible := false;
  umFrmCadastrocontaspagar.ShowModal;
  self.umFrmCadastrocontaspagar.DesbloqueiaEdt;
  //umFrmCadastrocontaspagar.btnSalvar.Caption := mtitulo;
  umfrmcadastrocontaspagar.btnSalvar.Visible := true;
  self.Pesquisar;
end;

procedure TFrmConsultaContasPagar.Novo;
begin
  inherited;
  self.umacontapagar.setcodigo(0);
  self.umacontapagar.setCadastro(Date);
  self.umacontapagar.setUlt_Alt(Date);
  self.umFrmCadastrocontaspagar.limpaedt;
  self.umFrmCadastrocontaspagar.DesbloqueiaEdt;
  self.umFrmCadastroContasPagar.bloqueiapagamento;
  self.umFrmCadastrocontaspagar.conhecaObj(umacontapagar, umactrlcontapagar);
  self.umFrmCadastrocontaspagar.ShowModal;
  self.Pesquisar;
end;

procedure TFrmConsultaContasPagar.Pesquisar;
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlcontapagar.Pesquisar(self.edtPesquisar.Text);
  if mMSG <> '' then
    ShowMessage('Contas a Pagar ' + self.edtPesquisar.Text + ' NÃO ENCONTRADA');
end;

procedure TFrmConsultaContasPagar.Sair;
begin
  inherited;
  if self.btnsair.Caption = 'SELECIONAR' then
    umactrlcontapagar.Carregar(umacontapagar);
end;

procedure TFrmConsultaContasPagar.SetFrmCadastro(pObj: TObject);
begin
  inherited;
  umfrmcadastrocontaspagar := TFrmCadastroContasPagar(pObj);
end;

end.
