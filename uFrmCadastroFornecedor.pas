unit uFrmCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastro, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons, System.Actions, Vcl.ActnList, Vcl.CheckLst,
  uFrmconsultacidade, uFrmConsultacondicao, uFornecedores, uControllerFornecedores;

type
  TFrmCadastroFornecedor = class(TFrmCadastro)
    Label1: TLabel;
    edtrazaosocial: TEdit;
    lbltipo: TLabel;
    edtcnpj: TEdit;
    Label3: TLabel;
    edtinscestadual: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtcodcidade: TEdit;
    edtcidade: TEdit;
    edtddd: TEdit;
    Label14: TLabel;
    edtendereco: TEdit;
    Label15: TLabel;
    edtnumero: TEdit;
    Label16: TLabel;
    edtbairro: TEdit;
    opcoes: TRadioGroup;
    Label2: TLabel;
    edtcelular: TEdit;
    edttelefone: TEdit;
    Label5: TLabel;
    status: TRadioGroup;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    edtnome_fantasia: TEdit;
    btnPesquisacidade: TSpeedButton;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    edtcodcondicao: TEdit;
    edtcondicao: TEdit;
    btnpesquisacondicao: TSpeedButton;
    Label18: TLabel;
    procedure opcoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnpesquisacondicaoClick(Sender: TObject);
    procedure btnPesquisacidadeClick(Sender: TObject);
    procedure edtcodcidadeExit(Sender: TObject);
    procedure edtcodcondicaoExit(Sender: TObject);
    procedure edtcnpjExit(Sender: TObject);
  private

  protected
    umfrmconsultacidade: TFrmConsultaCidade;
    umfrmconsultacondicao: TFrmconsultacondicao;
    umfornecedor : Fornecedores;
    umactrlfornecedor : ControllerFornecedores;
  public
    procedure ConhecaObj(pObj: TObject; pctrl: TObject); Override;
    procedure Salvar; Override;
    procedure Sair; Override;
    procedure CarregaEdt; Override;
    procedure LimpaEdt; Override;
    procedure BloqueiaEdt; Override;
    procedure DesbloqueiaEdt; Override;
    procedure SetFrmConsulta(pObj: TObject);
    procedure SetFrmConsultacondicao(pObj: TObject);
    function validacpf (num : string) : boolean;
    function ValidaCNPJ(num: string): boolean;
  end;

var
  FrmCadastroFornecedor: TFrmCadastroFornecedor;

implementation

{$R *.dfm}
{ TFrmCadastroFornecedor }

procedure TFrmCadastroFornecedor.BloqueiaEdt;
begin
  inherited;
  self.edtrazaosocial.Enabled := false;
  self.edtcnpj.Enabled := false;
  self.edtinscestadual.Enabled := false;
  self.edtcodcidade.Enabled := false;
  self.edtcidade.Enabled := false;
  self.edtddd.Enabled := false;
  self.edtendereco.Enabled := false;
  self.edtnumero.Enabled := false;
  self.edtbairro.Enabled := false;
  self.edtcodcondicao.Enabled := false;
  self.edtcondicao.Enabled := false;
end;

procedure TFrmCadastroFornecedor.CarregaEdt;
begin
  inherited;
  if umfornecedor.getstatus = 'A' then
  begin
    self.status.ItemIndex := 0;
  end
  else
  begin
    self.status.ItemIndex := 1;
  end;
   if umfornecedor.gettp_fornecedor = 'F' then
  begin
    self.opcoes.ItemIndex := 0;
  end
  else
  begin
    self.opcoes.ItemIndex := 1;
  end;
  self.edtCodigo.Text := inttostr(umfornecedor.getcodigo);
  self.edtrazaosocial.Text := umfornecedor.getrazao;
  self.edtcnpj.Text := umfornecedor.getcnpj;
  self.edtnome_fantasia.Text := umfornecedor.getnome_fantasia;
  self.edtinscestadual.Text := umfornecedor.getinsc_est;
  self.edtcodcidade.Text := inttostr(umfornecedor.getumacidade.getcodigo);
  self.edtcidade.Text := umfornecedor.getumacidade.getcidade;
  self.edtddd.Text := umfornecedor.getumacidade.getDDD;
  self.edtendereco.Text := umfornecedor.getendereco;
  self.edtnumero.Text := inttostr(umfornecedor.getnumero);
  self.edtbairro.Text := umfornecedor.getbairro;
  self.edtcelular.Text := umfornecedor.getceular;
  self.edttelefone.Text := umfornecedor.gettel_comercial;
  self.edtcodcondicao.Text := inttostr(umfornecedor.getumacondicao.getcodigo);
  self.edtcondicao.Text := umfornecedor.getumacondicao.getcondicao;
  self.edtCadastro.Text := DateToStr(umfornecedor.getCadastro);
  self.edtUlt_alt.Text := DateToStr(umfornecedor.getUlt_Alt);
end;

procedure TFrmCadastroFornecedor.ConhecaObj(pObj: TObject; pctrl: TObject);
begin
  inherited;
  umfornecedor := Fornecedores(pObj);
  umactrlfornecedor := ControllerFornecedores(pctrl);
  self.edtCodigo.Text := inttostr(self.umfornecedor.getcodigo);
  self.edtCadastro.Text := DateToStr(self.umfornecedor.getCadastro);
  self.edtUlt_alt.Text := DateToStr(self.umfornecedor.getUlt_Alt);
end;

procedure TFrmCadastroFornecedor.DesbloqueiaEdt;
begin
  inherited;
  self.edtrazaosocial.Enabled := true;
  self.edtcnpj.Enabled := true;
  self.edtinscestadual.Enabled := true;
  self.edtcodcidade.Enabled := true;
  self.edtcidade.Enabled := true;
  self.edtddd.Enabled := true;
  self.edtendereco.Enabled := true;
  self.edtnumero.Enabled := true;
  self.edtbairro.Enabled := true;
  self.edtcodcondicao.Enabled := true;
  self.edtcondicao.Enabled := true;
end;

procedure TFrmCadastroFornecedor.edtcnpjExit(Sender: TObject);
var mcontinua : boolean;
begin
  inherited;
  if self.edtcnpj.Text <> '' then
  begin
    if self.lbltipo.Caption = 'CPF' then
    begin
      self.validacpf(self.edtcnpj.Text);
      umfornecedor.setcnpj(self.edtcnpj.Text);
    end
    else if self.lbltipo.Caption = 'CNPJ' then
    begin
      self.ValidaCNPJ(self.edtcnpj.Text);
      umfornecedor.setcnpj(self.edtcnpj.Text);
    end;
    mcontinua := umactrlfornecedor.valida_fornecedor(umfornecedor);
    if mcontinua then
    begin

    end
    else
    begin
      if self.lbltipo.Caption = 'CPF' then
      begin
        showmessage('CPF JÁ CADASTRADO NO BANCO DE DADOS');
        self.edtcnpj.Clear;
        self.edtcnpj.SetFocus;
      end
      else if lbltipo.Caption = 'CNPJ' then
      begin
        showmessage('CNPJ JÁ CADASTRADO NO BANCO DE DADOS');
        self.edtcnpj.Clear;
        self.edtcnpj.SetFocus;
      end;
    end;
  end
  else
  begin

  end;
end;

procedure TFrmCadastroFornecedor.edtcodcidadeExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  if self.edtcodcidade.Text = '' then
  begin
    self.edtcodcidade.Text := '';
    self.edtcidade.Text := '';
    self.edtddd.Text := '';
  end
  else
  begin
    mMSG := umactrlfornecedor.getctrlcidade.Pesquisar(self.edtcodcidade.Text);
    umactrlfornecedor.getctrlcidade.Carregar(umfornecedor.getumacidade);
    self.edtcodcidade.Text := inttostr(umfornecedor.getumacidade.getcodigo);
    self.edtcidade.Text := umfornecedor.getumacidade.getcidade;
    self.edtddd.Text := umfornecedor.getumacidade.getDDD;
    if self.edtcodcidade.Text = inttostr(0) then
    begin
      ShowMessage('Cidade não encontrada');
      self.edtcodcidade.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroFornecedor.edtcodcondicaoExit(Sender: TObject);
var
  mMSG: string;
begin
  inherited;
  if self.edtcodcondicao.Text = '' then
  begin
    self.edtcodcondicao.Text := '';
    self.edtcondicao.Text := '';
  end
  else
  begin
    mMSG := umactrlfornecedor.getctrlcondicao.Pesquisar(self.edtcodcondicao.Text);
    umactrlfornecedor.getctrlcondicao.Carregar(umfornecedor.getumacondicao);
    self.edtcodcondicao.Text := inttostr(umfornecedor.getumacondicao.getcodigo);
    self.edtcondicao.Text := umfornecedor.getumacondicao.getcondicao;
    if self.edtcodcondicao.Text = inttostr(0) then
    begin
      ShowMessage('Condição não encontrada');
      self.edtcodcondicao.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  self.opcoes.ItemIndex := 0;
  self.status.ItemIndex := 0;
end;

procedure TFrmCadastroFornecedor.LimpaEdt;
begin
  inherited;
  self.edtrazaosocial.Clear;
  self.edtcnpj.Clear;
  self.edtinscestadual.Clear;
  self.edtnome_fantasia.Clear;
  self.edtcodcidade.Clear;
  self.edtcidade.Clear;
  self.edtddd.Clear;
  self.edttelefone.Clear;
  self.edtcelular.Clear;
  self.edtendereco.Clear;
  self.edtnumero.Clear;
  self.edtbairro.Clear;
  self.edtcodcondicao.Clear;
  self.edtcondicao.Clear;
end;

procedure TFrmCadastroFornecedor.opcoesClick(Sender: TObject);
begin
  inherited;
  if opcoes.ItemIndex = 0 then
    lbltipo.Caption := 'CPF'
  else
    lbltipo.Caption := 'CNPJ';
end;

procedure TFrmCadastroFornecedor.Sair;
begin
  inherited;

end;

procedure TFrmCadastroFornecedor.Salvar;
begin
  inherited;
  if self.btnSalvar.Caption = '&Excluir' then
  begin
    If Application.MessageBox('Confirma Exclusão ?', 'Cuidado !!!',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
    begin
      self.umactrlfornecedor.Excluir(umfornecedor);
      ShowMessage('Excluido com Sucesso!!!');
      self.Sair;
    end;
  end
  else
  begin
    if self.status.ItemIndex < 0 then
    begin
      ShowMessage('Campo Status precisa ser selecionado!!!');
      self.status.SetFocus;
    end
    else if (self.edtrazaosocial.Text = '') then
    begin
      ShowMessage('Campo Razão Social precisa ser preenchido!!!');
      self.edtrazaosocial.SetFocus;
    end
    else if (self.edtcnpj.Text = '') then
    begin
      ShowMessage('Campo CNPJ precisa ser preenchido!!!');
      self.edtcnpj.SetFocus
    end
    else if (self.edtinscestadual.Text = '') then
    begin
      ShowMessage('Campo Insc. Est. precisa ser preenchido!!!');
      self.edtinscestadual.SetFocus;
    end
    else if (self.edtcodcidade.Text = '') then
    begin
      ShowMessage('Campo Codigo Cidade precisa ser preenchido!!!');
      self.edtcodcidade.SetFocus;
    end
    else if (self.edtendereco.Text = '') then
    //begin
      //ShowMessage('Campo Endereço precisa ser preenchido!!!');
      //self.edtendereco.SetFocus;
    //end
    //else if (self.edtnumero.Text = '') then
    //begin
      //ShowMessage('Campo Numero precisa ser preenchido!!!');
      //self.edtnumero.SetFocus;
    //end
    //else if (self.edtbairro.Text = '') then
    //begin
      //ShowMessage('Campo Bairro precisa ser preenchido!!!');
      //self.edtbairro.SetFocus;
    //end
    //else if (self.edttelefone.Text = '') then
    //begin
      //ShowMessage('Campo Telefone precisa ser preenchido!!!');
      //self.edttelefone.SetFocus;
    //end
    //else if (self.edtcelular.Text = '') then
    //begin
      //ShowMessage('Campo Celular precisa ser preenchido!!!');
      //self.edtcelular.SetFocus;
    //end
    else if (self.edtcodcondicao.Text = '') then
    begin
      ShowMessage('Campo Condição precisa ser preenchido!!!');
      self.edtcodcondicao.SetFocus;
    end
    else
    begin
      umfornecedor.setcodigo(strtoint(self.edtCodigo.Text));
      umfornecedor.setrazao(self.edtrazaosocial.Text);
      umfornecedor.setcnpj(self.edtcnpj.Text);
      umfornecedor.setnome_fantasia(self.edtnome_fantasia.Text);
      umfornecedor.setinsc_est(self.edtinscestadual.Text);
      umfornecedor.getumacondicao.setcodigo(strtoint(self.edtcodcondicao.Text));
      umfornecedor.setendereco(self.edtendereco.Text);
      umfornecedor.setnumero(strtoint(self.edtnumero.Text));
      umfornecedor.setbairro(self.edtbairro.Text);
      umfornecedor.getumacidade.setcodigo(strtoint(self.edtcodcidade.Text));
      umfornecedor.setcelular(self.edtcelular.Text);
      umfornecedor.settel_comercial(self.edttelefone.Text);
      if self.status.ItemIndex = 0 then
      begin
        umfornecedor.setstatus('A');
      end
      else
      begin
        umfornecedor.setstatus('I');
      end;
      if self.opcoes.ItemIndex = 0 then
      begin
        umfornecedor.settp_fornecedor('F');
      end
      else
      begin
        umfornecedor.settp_fornecedor('J');
      end;
      umfornecedor.setCadastro(StrToDate(self.edtCadastro.Text));
      umfornecedor.setUlt_Alt(StrToDate(self.edtUlt_alt.Text));
      umactrlfornecedor.Salvar(umfornecedor.clone);
      ShowMessage('Salvo com Sucesso!!!');
      self.Sair;
    end;
  end;

end;

procedure TFrmCadastroFornecedor.SetFrmConsulta(pObj: TObject);
begin
  umfrmconsultacidade := TFrmConsultaCidade(pObj);
end;

procedure TFrmCadastroFornecedor.SetFrmConsultacondicao(pObj: TObject);
begin
  umfrmconsultacondicao := TFrmConsultaCondicao (pObj);
end;

function TFrmCadastroFornecedor.ValidaCNPJ(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
d1,d2: integer;
digitado, calculado: string;
begin
  if (Length(num)<>14) then
  begin
    Result:=False;
  end
  else
  begin
    n1:=StrToInt(num[1]);
    n2:=StrToInt(num[2]);
    n3:=StrToInt(num[3]);
    n4:=StrToInt(num[4]);
    n5:=StrToInt(num[5]);
    n6:=StrToInt(num[6]);
    n7:=StrToInt(num[7]);
    n8:=StrToInt(num[8]);
    n9:=StrToInt(num[9]);
    n10:=StrToInt(num[10]);
    n11:=StrToInt(num[11]);
    n12:=StrToInt(num[12]);
    d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
    d1:=11-(d1 mod 11);
    if d1>=10 then d1:=0;
      d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
    d2:=11-(d2 mod 11);
    if d2>=10 then d2:=0;
      calculado:=inttostr(d1)+inttostr(d2);
    digitado:=num[13]+num[14];
    if calculado=digitado then
      Result:=true
    else
      Result:=false;
    end;
    if result  then
    begin

    end
    else
    begin
      showmessage('CNPJ INVÁLIDO');
      self.edtcnpj.SetFocus;
      exit;
    end;
end;

function TFrmCadastroFornecedor.validacpf(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
d1,d2: integer;
digitado, calculado: string;
begin
  num := self.edtcnpj.Text;
  if (Length(num)<>11) then
  begin
    Result:=False;
  end
  else
  begin
    n1:=StrToInt(num[1]);
    n2:=StrToInt(num[2]);
    n3:=StrToInt(num[3]);
    n4:=StrToInt(num[4]);
    n5:=StrToInt(num[5]);
    n6:=StrToInt(num[6]);
    n7:=StrToInt(num[7]);
    n8:=StrToInt(num[8]);
    n9:=StrToInt(num[9]);
    d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
    d1:=11-(d1 mod 11);
    if d1>=10 then d1:=0;
      d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
    d2:=11-(d2 mod 11);
    if d2>=10 then d2:=0;
      calculado:=inttostr(d1)+inttostr(d2);
    digitado:=num[10]+num[11];
    if calculado=digitado then
      Result :=true
    else
      Result :=false;
  end;
  if result  then
  begin

  end
  else
  begin
    showmessage('CPF INVÁLIDO');
    self.edtcnpj.SetFocus;
    exit;
  end;
end;

procedure TFrmCadastroFornecedor.btnPesquisacidadeClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultacidade.btnSair.Caption;
  umfrmconsultacidade.btnSair.Caption := 'SELECIONAR';
  umfrmconsultacidade.ConhecaObj(umfornecedor.getumacidade, umactrlfornecedor.getctrlcidade);
  umfrmconsultacidade.ShowModal;

  umfrmconsultacidade.btnSair.Caption := mbotao;
  self.edtcodcidade.Text := inttostr(umfornecedor.getumacidade.getcodigo);
  self.edtcidade.Text := umfornecedor.getumacidade.getcidade;
  self.edtddd.Text := umfornecedor.getumacidade.getDDD;
end;

procedure TFrmCadastroFornecedor.btnpesquisacondicaoClick(Sender: TObject);
var
  mbotao: string;
begin
  inherited;
  mbotao := umfrmconsultacondicao.btnSair.Caption;
  umfrmconsultacondicao.btnSair.Caption := 'SELECIONAR';
  umfrmconsultacondicao.ConhecaObj(umfornecedor.getumacondicao,umactrlfornecedor.getctrlcondicao);
  umfrmconsultacondicao.ShowModal;

  umfrmconsultacondicao.btnSair.Caption := mbotao;
  self.edtcodcondicao.Text := inttostr(umfornecedor.getumacondicao.getcodigo);
  self.edtcondicao.Text := umfornecedor.getumacondicao.getcondicao;
end;

end.
