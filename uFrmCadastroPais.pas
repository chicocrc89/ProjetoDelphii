unit uFrmCadastroPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls,
  uControllerpaises, uPaises,
  Vcl.Buttons;

type
  TFrmCadastroPais = class(TFrmCadastro)
    Label1: TLabel;
    edtpais: TEdit;
    Label2: TLabel;
    edtddi: TEdit;
    Label3: TLabel;
    edtsigla: TEdit;
    Label9: TLabel;
    Label4: TLabel;
    Label5: TLabel;
  private
    { Private declarations }
  protected
    umactrlpais: Controllerpaises;
    umpais: Paises;
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
  FrmCadastroPais: TFrmCadastroPais;

implementation

{$R *.dfm}
{ TFrmCadastroPais }

procedure TFrmCadastroPais.BloqueiaEdt;
begin
  inherited;
  self.edtpais.Enabled := false;
  self.edtddi.Enabled := false;
  self.edtsigla.Enabled := false;
end;

procedure TFrmCadastroPais.CarregaEdt;
begin
  inherited;
  self.edtcodigo.Text := inttostr(umpais.getcodigo);
  self.edtpais.Text := umpais.getpais;
  self.edtddi.Text := umpais.getDDI;
  self.edtsigla.Text := umpais.getsigla;
  self.edtCadastro.Text := DateToStr(umpais.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umpais.getUlt_Alt);
end;

procedure TFrmCadastroPais.ConhecaObj(pObj, pctrl: TObject);
begin
  inherited;
  umpais := Paises(pObj);
  umactrlpais := Controllerpaises(pctrl);
  self.edtcodigo.Text := inttostr(self.umpais.getcodigo);
  self.edtCadastro.Text := DateToStr(umpais.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umpais.getUlt_Alt);
end;

procedure TFrmCadastroPais.DesbloqueiaEdt;
begin
  inherited;
  self.edtpais.Enabled := true;
  self.edtddi.Enabled := true;
  self.edtsigla.Enabled := true;
end;

procedure TFrmCadastroPais.LimpaEdt;
begin
  inherited;
  self.edtpais.Clear;
  self.edtddi.Clear;
  self.edtsigla.Clear;
  self.edtcodigo.Clear;
end;

procedure TFrmCadastroPais.Sair;
begin
  inherited;

end;

procedure TFrmCadastroPais.Salvar;
begin
  inherited;
  if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclus�o ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlpais.Excluir(umpais);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if (self.edtpais.Text = '') then
    begin
      ShowMessage('Campo Pa�s precisa ser preenchido!!!');
      self.edtpais.SetFocus;
    end
    else if (self.edtddi.Text = '') then
    begin
      ShowMessage('Campo DDI precisa ser preenchido!!!');
      self.edtddi.SetFocus;
    end
    else if (self.edtsigla.Text = '') then
    begin
      ShowMessage('Campo Sigla precisa ser preenchido!!!');
      self.edtsigla.SetFocus;
    end
    else
      begin
        umpais.setcodigo(strtoint(self.edtcodigo.Text));
        umpais.setpais(self.edtpais.Text);
        umpais.setddi(self.edtddi.Text);
        umpais.setsigra(self.edtsigla.Text);
        umpais.setCadastro(StrToDate(self.edtCadastro.Text));
        umpais.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
        umactrlpais.Salvar(umpais.clone);
        ShowMessage('Salvo com Sucesso!!!');
        self.Sair;
      end;
  end;
end;

end.
