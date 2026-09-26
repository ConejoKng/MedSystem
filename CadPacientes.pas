unit CadPacientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TformCadPacientes = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    txtNome: TEdit;
    txtCpf: TMaskEdit;
    txtCelular: TMaskEdit;
    txtData: TMaskEdit;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    bntGravar: TButton;
    bntCancelar: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bntGravarClick(Sender: TObject);
    function validarCampos: Boolean;
    procedure limparCampos;
    procedure bntNovoClick(Sender: TObject);
    procedure bntCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadPacientes: TformCadPacientes;

implementation

{$R *.dfm}

uses unitDM, UnitViewPessoas;

procedure TformCadPacientes.bntCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TformCadPacientes.bntGravarClick(Sender: TObject);
begin
  if validarCampos then
  begin
    DM.insertPaciente.ParamByName('CPF').AsString := txtCpf.Text;
    DM.insertPaciente.ParamByName('NOME').AsString := txtNome.Text;
    DM.insertPaciente.ParamByName('CELULAR').AsString := txtCelular.Text;
    DM.insertPaciente.ParamByName('DATA_CADASTRO').AsDate := StrToDate(txtData.Text);

    DM.insertPaciente.ExecSQL;
    ShowMessage('Paciente Cadastrado');
    DM.tdPaciente.Refresh;
  end;
end;

procedure TformCadPacientes.bntNovoClick(Sender: TObject);
begin
   limparCampos
end;

procedure TformCadPacientes.Button2Click(Sender: TObject);
begin
  Application.CreateForm(TviewPessoas, viewPessoas);
  viewPessoas.ShowModal;
end;

procedure TformCadPacientes.FormCreate(Sender: TObject);
begin
  dm.tdPaciente.Open;
  LimparCampos;
end;

procedure TformCadPacientes.FormShow(Sender: TObject);
begin
  Dm.tdPaciente.Open;
end;

procedure TformCadPacientes.limparCampos;
begin
  txtNome.Clear;
  txtCpf.Clear;
  txtCelular.Clear;
  txtData.Clear;
end;

procedure TformCadPacientes.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

function TformCadPacientes.validarCampos: Boolean;
var
  resultado: Boolean;
begin

  if (Trim(txtNome.Text) = '') or (Trim(txtCPF.Text) = '') then
  begin
    ShowMessage('Preencha corretamente os campos obrigatórios(CPF, NOME)');
    resultado := False;
  end;

  if (Trim(txtNome.Text) <> '') and (Trim(txtCPF.Text) <> '') then
  begin
    resultado := True;
  end;

  Result := resultado;
end;


end.
