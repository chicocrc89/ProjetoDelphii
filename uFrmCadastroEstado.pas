unit uFrmCadastroEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls,
  uFrmConsultaPais, uEstados, uControllerEstados,
  uPaises, uControllerPaises, Vcl.Buttons;

type
  TFrmCadastroEstado = class(TFrmCadastro)
    Label1: TLabel;
    edtestado: TEdit;
    Label2: TLabel;
    edtuf: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtcodpais: TEdit;
    edtpais: TEdit;
    Label8: TLabel;
    edtddi: TEdit;
    Label3: TLabel;
    edtsigla: TEdit;
    Label22: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    procedure btnpesquisarClick(Sender: TObject);
    procedure edtcodpaisExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    umestado: Estados;
    umactrlestado: ControllerEstados;
    umfrmconsultapais: TFrmConsultaPais;
  public
    { Public declarations }
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
  FrmCadastroEstado: TFrmCadastroEstado;

implementation

{$R *.dfm}
{ TFrmCadastroEstado }

procedure TFrmCadastroEstado.BloqueiaEdt;
begin
  inherited;
  self.edtCodigo.Enabled := false;
  self.edtestado.Enabled := false;
  self.edtuf.Enabled := false;
  self.edtcodpais.Enabled := false;
  self.edtpais.Enabled := false;
  self.edtddi.Enabled := false;
end;

procedure TFrmCadastroEstado.btnpesquisarClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultapais.btnSair.Caption;
  umfrmconsultapais.btnSair.Caption := 'SELECIONAR';
  umfrmconsultapais.ConhecaObj(umestado.getumpais, umactrlestado.getctrlpais);
  umfrmconsultapais.ShowModal;

  umfrmconsultapais.btnSair.Caption := mbotao;
  self.edtcodpais.Text := inttostr(umestado.getumpais.getcodigo);
  self.edtpais.Text := umestado.getumpais.getpais;
  self.edtddi.Text := umestado.getumpais.getDDI;
  self.edtsigla.Text := umestado.getumpais.getsigla;
end;

procedure TFrmCadastroEstado.CarregaEdt;
begin
  inherited;
  self.edtCodigo.Text := inttostr(umestado.getcodigo);
  self.edtestado.Text := umestado.getestado;
  self.edtuf.Text := umestado.getUF;
  self.edtcodpais.Text := inttostr(umestado.getumpais.getcodigo);
  self.edtpais.Text := umestado.getumpais.getpais;
  self.edtddi.Text := umestado.getumpais.getDDI;
  self.edtsigla.Text := umestado.getumpais.getsigla;
  self.edtCadastro.Text := DateToStr(umestado.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umestado.getUlt_Alt);
end;

procedure TFrmCadastroEstado.ConhecaObj(pObj: TObject; pctrl: TObject);
begin
  inherited;
  umestado := Estados(pObj);
  umactrlestado := ControllerEstados(pctrl);
  self.edtCodigo.Text := inttostr(self.umestado.getcodigo);
  self.edtCadastro.Text := DateToStr(umestado.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umestado.getUlt_Alt);
end;

procedure TFrmCadastroEstado.DesbloqueiaEdt;
begin
  inherited;
  self.edtestado.Enabled := true;
  self.edtuf.Enabled := true;
  self.edtcodpais.Enabled := true;
  self.edtpais.Enabled := true;
  self.edtddi.Enabled := true;
  self.edtsigla.Enabled := true;
end;

procedure TFrmCadastroEstado.edtcodpaisExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  mMSG := umactrlestado.getctrlpais.Pesquisar(self.edtcodpais.Text);

  umactrlestado.getctrlpais.Carregar(umestado.getumpais);

  self.edtcodpais.Text := inttostr(umestado.getumpais.getcodigo);
  self.edtpais.Text := umestado.getumpais.getpais;
  self.edtddi.Text := umestado.getumpais.getDDI;
  self.edtsigla.Text := umestado.getumpais.getsigla;
end;

procedure TFrmCadastroEstado.LimpaEdt;
begin
  inherited;
  self.edtestado.Clear;
  self.edtuf.Clear;
  self.edtcodpais.Clear;
  self.edtpais.Clear;
  self.edtddi.Clear;
  self.edtsigla.Clear;
end;

procedure TFrmCadastroEstado.Sair;
begin
  inherited;

end;

procedure TFrmCadastroEstado.Salvar;
begin
  inherited;
  if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclus�o ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlestado.Excluir(umestado);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if (self.edtestado.Text = '') then
    begin
      ShowMessage('Campo Estado precisa ser preenchido!!!');
      self.edtestado.SetFocus;
    end
    else if (self.edtuf.Text = '') then
    begin
      ShowMessage('Campo UF precisa ser preenchido!!!');
      self.edtuf.SetFocus
    end
    else if (self.edtcodpais.Text = '') then
    begin
      ShowMessage('� necessario Selecionar um Pais!!!!');
      self.edtcodpais.SetFocus;
    end
    else
    umestado.setcodigo(strtoint(self.edtCodigo.Text));
    umestado.setestado(self.edtestado.Text);
    umestado.setuf(self.edtuf.Text);
    umestado.getumpais.setcodigo(strtoint(self.edtcodpais.Text));
    umestado.getumpais.setpais(self.edtpais.Text);
    umestado.getumpais.setDDI(self.edtddi.Text);
    umestado.getumpais.setsigra(self.edtsigla.Text);
    umestado.setCadastro(StrToDate(self.edtCadastro.Text));
    umestado.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
    umactrlestado.Salvar(umestado.clone);
    ShowMessage('Salvo com Sucesso!!!');
    self.Sair;
  end;
end;

procedure TFrmCadastroEstado.SetFrmConsulta(pObj: TObject);
begin
  umfrmconsultapais := TFrmConsultaPais(pObj);
end;

procedure TFrmCadastroEstado.SpeedButton1Click(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultapais.btnSair.Caption;
  umfrmconsultapais.btnSair.Caption := 'SELECIONAR';
  umfrmconsultapais.ConhecaObj(umestado.getumpais, umactrlestado.getctrlpais);
  umfrmconsultapais.ShowModal;

  umfrmconsultapais.btnSair.Caption := mbotao;
  self.edtcodpais.Text := inttostr(umestado.getumpais.getcodigo);
  self.edtpais.Text := umestado.getumpais.getpais;
  self.edtddi.Text := umestado.getumpais.getDDI;
  self.edtsigla.Text := umestado.getumpais.getsigla;
end;

end.
