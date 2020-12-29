unit uFrmCadastroModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls, Vcl.Buttons,
  uModelos, uControllerModelos,
  uFrmConsultaMarca;

type
  TFrmCadastroModelo = class(TFrmCadastro)
    Label1: TLabel;
    edtmodelo: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    edtcodmarca: TEdit;
    edtmarca: TEdit;
    Label2: TLabel;
    btnpesquisamarca: TSpeedButton;
    procedure btnpesquisarClick(Sender: TObject);
    procedure edtcodmarcaExit(Sender: TObject);
  private
    { Private declarations }
  protected
    ummodelo: Modelos;
    umactrlmodelo: ControllerModelos;
    umfrmconsultamarca: TFrmConsultaMarca;
  public
    procedure ConhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure CarregaEdt; Override;
    procedure LimpaEdt; Override;
    procedure BloqueiaEdt; Override;
    procedure DesbloqueiaEdt; Override;
    procedure SetFrmConsulta(pObj: TObject);

  end;

var
  FrmCadastroModelo: TFrmCadastroModelo;

implementation

{$R *.dfm}
{ TFrmCadastroModelo }

procedure TFrmCadastroModelo.BloqueiaEdt;
begin
  self.edtmarca.Enabled := false;
  self.edtmodelo.Enabled := false;
  self.edtcodmarca.Enabled := false;
end;

procedure TFrmCadastroModelo.btnpesquisarClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultamarca.btnSair.Caption;
  umfrmconsultamarca.btnSair.Caption := 'SELECIONAR';
  umfrmconsultamarca.ConhecaObj(ummodelo.getumamarca, umactrlmodelo.getctrlmarca);
  umfrmconsultamarca.ShowModal;

  umfrmconsultamarca.btnSair.Caption := mbotao;
  self.edtcodmarca.Text := inttostr(ummodelo.getumamarca.getcodigo);
  self.edtmarca.Text := ummodelo.getumamarca.getmarca;
end;

procedure TFrmCadastroModelo.CarregaEdt;
begin
  self.edtCodigo.Text := inttostr(ummodelo.getcodigo);
  self.edtmodelo.Text := ummodelo.getmodelo;
  self.edtcodmarca.Text := inttostr(ummodelo.getumamarca.getcodigo);
  self.edtmarca.Text := ummodelo.getumamarca.getmarca;
  self.edtCadastro.Text := DateToStr(ummodelo.getCadastro);
  self.edtUlt_alt.Text := DateToStr(ummodelo.getUlt_Alt);
end;

procedure TFrmCadastroModelo.ConhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  ummodelo := Modelos(pObj);
  umactrlmodelo := ControllerModelos(pctrl);
  self.edtCodigo.Text := inttostr(self.ummodelo.getcodigo);
  self.edtCadastro.Text := DateToStr(ummodelo.getCadastro);
  self.edtUlt_alt.Text := DateToStr(ummodelo.getUlt_Alt);
end;

procedure TFrmCadastroModelo.DesbloqueiaEdt;
begin
  self.edtmarca.Enabled := true;
  self.edtmodelo.Enabled := true;
  self.edtcodmarca.Enabled := true;
end;

procedure TFrmCadastroModelo.edtcodmarcaExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlmodelo.getctrlmarca.Pesquisar(self.edtcodmarca.Text);
  umactrlmodelo.getctrlmarca.Carregar(ummodelo.getumamarca);
  self.edtcodmarca.Text := inttostr(ummodelo.getumamarca.getcodigo);
  self.edtmarca.Text := ummodelo.getumamarca.getmarca;
  if self.edtcodmarca.Text = inttostr(0) then
  begin
    ShowMessage('Marca n�o encontrada');
    self.edtcodmarca.SetFocus;
  end;
end;

procedure TFrmCadastroModelo.LimpaEdt;
begin
  self.edtmodelo.Clear;
  self.edtcodmarca.Clear;
  self.edtmarca.Clear;
end;

procedure TFrmCadastroModelo.Sair;
begin
  inherited;
end;

procedure TFrmCadastroModelo.Salvar;
begin
  inherited;
  if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclus�o ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlmodelo.Excluir(ummodelo);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if (self.edtmodelo.Text = '') then
    begin
      ShowMessage('Campo Modelo precisa ser preenchido!!!');
      self.edtmodelo.SetFocus;
    end
    else if (self.edtmarca.Text = '') then
    begin
      ShowMessage('Campo Marca precisa ser preenchido!!!');
      self.edtmarca.SetFocus;
    end
    else
    begin
      ummodelo.setcodigo(strtoint(self.edtCodigo.Text));
      ummodelo.setmodelo(self.edtmodelo.Text);
      ummodelo.getumamarca.setcodigo(strtoint(self.edtcodmarca.Text));
      ummodelo.getumamarca.setmarca(self.edtmarca.Text);
      ummodelo.setCadastro(StrToDate(self.edtCadastro.Text));
      ummodelo.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
      umactrlmodelo.Salvar(ummodelo.clone);
      ShowMessage('Salvo com Sucesso!!!');
      self.Sair;
    end;
  end;
end;

procedure TFrmCadastroModelo.SetFrmConsulta(pObj: TObject);
begin
  umfrmconsultamarca := TFrmConsultaMarca(pObj);
end;

end.
