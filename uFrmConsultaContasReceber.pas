unit uFrmConsultaContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmConsulta, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, uContasReceber, uControllerContasReceber, uDM, uFrmCadastroContasReceber;

type
  TFrmConsultaContasReceber = class(TFrmConsulta)
  private
    umFrmCadastroContasReceber: TFrmCadastroContasReceber;
    umaContareceber: ContasReceber;
    umactrlcontareceber: ControllerContasReceber;
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
  FrmConsultaContasReceber: TFrmConsultaContasReceber;

implementation

{$R *.dfm}

{ TFrmConsultaContasReceber }

procedure TFrmConsultaContasReceber.Alterar;
begin
  inherited;

end;

procedure TFrmConsultaContasReceber.conhecaObj(pObj, pctrl: TObject);
begin
  inherited;

end;

procedure TFrmConsultaContasReceber.Excluir;
begin
  inherited;

end;

procedure TFrmConsultaContasReceber.Novo;
begin
  inherited;

end;

procedure TFrmConsultaContasReceber.Pesquisar;
begin
  inherited;

end;

procedure TFrmConsultaContasReceber.Sair;
begin
  inherited;

end;

procedure TFrmConsultaContasReceber.SetFrmCadastro(pObj: TObject);
begin
  inherited;

end;

end.
