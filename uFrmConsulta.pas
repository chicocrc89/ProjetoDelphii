unit uFrmConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  uFrmCadastro,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TFrmConsulta = class(TForm)
    edtPesquisar: TEdit;
    DBGrid1: TDBGrid;
    btnPesquisar: TSpeedButton;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  protected
    umFrmCadastro: TFrmCadastro;
    procedure Novo; Virtual;
    procedure Alterar; Virtual;
    procedure Excluir; Virtual;
    procedure Sair; Virtual;
    procedure Pesquisar; Virtual;
  public
    { Public declarations }
    procedure conhecaObj(pObj: TObject; pctrl: TObject); Virtual;
    procedure SetFrmCadastro(pObj: TObject); Virtual;
  end;

var
  FrmConsulta: TFrmConsulta;

implementation

{$R *.dfm}
{ TFrmConsulta }

procedure TFrmConsulta.Alterar;
begin

end;

procedure TFrmConsulta.btnAlterarClick(Sender: TObject);
begin
  Alterar;
end;

procedure TFrmConsulta.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFrmConsulta.btnNovoClick(Sender: TObject);
begin
  Novo;
end;

procedure TFrmConsulta.btnSairClick(Sender: TObject);
begin
  Sair;
end;

procedure TFrmConsulta.conhecaObj(pObj: TObject; pctrl: TObject);
begin

end;

procedure TFrmConsulta.Excluir;
begin

end;

procedure TFrmConsulta.Novo;
begin

end;

procedure TFrmConsulta.Pesquisar;
begin

end;

procedure TFrmConsulta.Sair;
begin
  Close;
end;

procedure TFrmConsulta.SetFrmCadastro(pObj: TObject);
begin

end;

end.
