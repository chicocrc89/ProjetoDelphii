unit uFrmCadastroCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls, Vcl.Buttons, uControllerCombustiveis, uCombustiveis;

type
  TFrmCadastroCombustivel = class(TFrmCadastro)
    Label3: TLabel;
    Label4: TLabel;
    edtcombustivel: TEdit;
  protected
    umcombustivel : Combustiveis;
    umactrlcombustivel : ControllerCombustiveis;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConhecaObj(pObj, pctrl: TObject); Override;
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure CarregaEdt; Override;
    procedure LimpaEdt; Override;
    procedure BloqueiaEdt; Override;
    procedure DesbloqueiaEdt; Override;
  end;

var
  FrmCadastroCombustivel: TFrmCadastroCombustivel;

implementation

{$R *.dfm}

{ TFrmCadastroCombustivel }

procedure TFrmCadastroCombustivel.BloqueiaEdt;
begin
  inherited;
  self.edtcombustivel.Enabled := false;
end;

procedure TFrmCadastroCombustivel.CarregaEdt;
begin
  inherited;
  self.edtcodigo.Text := inttostr(umcombustivel.getcodigo);
  self.edtcombustivel.Text := umcombustivel.getcombustivel;
  self.edtCadastro.Text := datetostr(umcombustivel.getCadastro);
  self.edtUlt_alt.Text := datetostr(umcombustivel.getUlt_Alt);
end;

procedure TFrmCadastroCombustivel.ConhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umcombustivel := Combustiveis(pobj);
  umactrlcombustivel := controllercombustiveis (pctrl);
  self.edtCodigo.Text := inttostr(self.umcombustivel.getcodigo);
  self.edtCadastro.Text := Datetostr(umcombustivel.getCadastro);
  self.edtUlt_alt.Text := Datetostr(umcombustivel.getUlt_Alt);
end;

procedure TFrmCadastroCombustivel.DesbloqueiaEdt;
begin
  inherited;
  self.edtcombustivel.Enabled := true;
end;

procedure TFrmCadastroCombustivel.LimpaEdt;
begin
  inherited;
  self.edtcombustivel.Clear;
end;

procedure TFrmCadastroCombustivel.Sair;
begin
  inherited;

end;

procedure TFrmCadastroCombustivel.Salvar;
begin
  inherited;
   if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclus�o ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlcombustivel.Excluir(umcombustivel);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if (self.edtcombustivel.Text = '') then
    begin
      ShowMessage('Campo Combust�vel precisa ser preenchido!!!');
      self.edtcombustivel.SetFocus;
    end
    else
      begin
        umcombustivel.setcodigo(strtoint(self.edtcodigo.Text));
        umcombustivel.setcombustivel(self.edtcombustivel.Text);
        umcombustivel.setCadastro(StrToDate(self.edtCadastro.Text));
        umcombustivel.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
        umactrlcombustivel.Salvar(umcombustivel.clone);
        ShowMessage('Salvo com Sucesso!!!');
        self.Sair;
      end;
  end;
end;

end.
