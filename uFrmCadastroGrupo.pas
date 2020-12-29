unit uFrmCadastroGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls, Vcl.Buttons,
  uGrupos, uControllerGrupos;

type
  TFrmCadastroGrupo = class(TFrmCadastro)
    Label1: TLabel;
    edtgrupo: TEdit;
    Label3: TLabel;
  private
    { Private declarations }
  protected
    umgrupo : Grupos;
    umactrlgrupo : ControllerGrupos;
  public
    { Public declarations }
    procedure ConhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure CarregaEdt; Override;
    procedure LimpaEdt; Override;
    procedure BloqueiaEdt; Override;
    procedure DesbloqueiaEdt; Override;
  end;

var
  FrmCadastroGrupo: TFrmCadastroGrupo;

implementation

{$R *.dfm}
{ TFrmCadastroGrupo }

procedure TFrmCadastroGrupo.BloqueiaEdt;
begin
  inherited;
  self.edtgrupo.Enabled := false;
end;

procedure TFrmCadastroGrupo.CarregaEdt;
begin
  inherited;
  self.edtCodigo.Text := inttostr(umgrupo.getCodigo);
  self.edtgrupo.Text := umgrupo.getgrupo;
  self.edtCadastro.Text := DateToStr(umgrupo.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umgrupo.getUlt_Alt);
end;

procedure TFrmCadastroGrupo.ConhecaObj(pObj: TObject; pctrl: TObject);
begin
  inherited;
  umgrupo := Grupos (pObj);
  umactrlgrupo := ControllerGrupos (pctrl);
  self.edtCodigo.Text := inttostr(umgrupo.getCodigo);
  self.edtCadastro.Text := DateToStr(umgrupo.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umgrupo.getUlt_Alt);
end;

procedure TFrmCadastroGrupo.DesbloqueiaEdt;
begin
  inherited;
  self.edtgrupo.Enabled := true;
end;

procedure TFrmCadastroGrupo.LimpaEdt;
begin
  inherited;
  self.edtgrupo.Clear;
end;

procedure TFrmCadastroGrupo.Sair;
begin
  inherited;

end;

procedure TFrmCadastroGrupo.Salvar;
begin
  inherited;
  if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclus�o ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlgrupo.Excluir(umgrupo);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if (self.edtgrupo.Text = '') then
    begin
      ShowMessage('Campo Grupo precisa ser preenchido!!!');
      self.edtgrupo.SetFocus;
    end
    else
    begin
      umgrupo.setcodigo(strtoint(self.edtcodigo.Text));
      umgrupo.setgrupo(self.edtgrupo.Text);
      umgrupo.setCadastro(StrToDate(self.edtCadastro.Text));
      umgrupo.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
      umactrlgrupo.Salvar(umgrupo.clone);
      ShowMessage('Salvo com Sucesso!!!');
      self.Sair;
    end;
  end;
end;

end.
