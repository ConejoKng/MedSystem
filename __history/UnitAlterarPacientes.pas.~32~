unit UnitAlterarPacientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TalterarPessoas = class(TForm)
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    buscarId: TRadioButton;
    buscarNome: TRadioButton;
    grupoBoxBuscar: TGroupBox;
    DBGrid1: TDBGrid;
    txtBusca: TEdit;
    buscarCpf: TRadioButton;
    txtBuscaCpf: TMaskEdit;
    GroupBox2: TGroupBox;
    editId: TEdit;
    Label2: TLabel;
    editNome: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    editCpf: TMaskEdit;
    editCelular: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure buscarIdClick(Sender: TObject);
    procedure buscarNomeClick(Sender: TObject);
    procedure txtBuscaChange(Sender: TObject);
    procedure buscarCpfClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure conexaoBanco;
    procedure txtBuscaCpfChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure limparCampos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  alterarPessoas: TalterarPessoas;

implementation

{$R *.dfm}

uses unitDM;

// Botões Filtro ---------------------------------

procedure TalterarPessoas.buscarCpfClick(Sender: TObject);
begin
  grupoBoxBuscar.Caption := 'Buscar por CPF';
  txtBusca.Visible := False;
  txtBuscaCpf.Visible := True;

  dm.dsPaciente.DataSet := dm.tdPaciente;
  DM.tdPaciente.Open;
end;

procedure TalterarPessoas.buscarIdClick(Sender: TObject);
begin
  txtBusca.NumbersOnly := True;;
  txtBusca.Text := '';
  txtBusca.Visible := True;
  txtBuscaCpf.Visible := False;
  grupoBoxBuscar.Caption := 'Buscar por ID';

  dm.dsPaciente.DataSet := dm.tdPaciente;
  DM.tdPaciente.Open;
end;

procedure TalterarPessoas.buscarNomeClick(Sender: TObject);
begin
  txtBusca.NumbersOnly := False;
  txtBusca.Text := '';
  txtBusca.Visible := True;
  txtBuscaCpf.Visible := False;
  grupoBoxBuscar.Caption := ('Buscar por Nome');

  dm.dsPaciente.DataSet := dm.tdPaciente;
  DM.tdPaciente.Open;
end;

procedure TalterarPessoas.Button1Click(Sender: TObject);
begin
  dm.updatePaciente.Close;
  DM.updatePaciente.ParamByName('ID').AsInteger := StrToInt(editId.Text);
  DM.updatePaciente.ParamByName('NOME').AsString := editNome.Text;
  DM.updatePaciente.ParamByName('CPF').AsString := editCpf.Text;
  DM.updatePaciente.ParamByName('CELULAR').AsString := editCelular.Text;

  Dm.updatePaciente.ExecSQL;
  DM.tdPaciente.Refresh;
  ShowMessage('Paciente ' + editNome.Text + ' Atualizado');
  limparCampos;
end;

procedure TalterarPessoas.Button2Click(Sender: TObject);
begin
  limparCampos;
end;

procedure TalterarPessoas.conexaoBanco;
begin
  dm.tdPaciente.Close;
  dm.tdPaciente.Open
end;

procedure TalterarPessoas.DBGrid1CellClick(Column: TColumn);
begin
  editId.Text := IntToStr(DM.dsPaciente.DataSet.FieldByName('ID').AsInteger);
  editNome.Text := DM.dsPaciente.DataSet.FieldByName('NOME').AsString;
  editCPF.Text := DM.dsPaciente.DataSet.FieldByName('CPF').AsString;
  editCelular.Text := DM.dsPaciente.DataSet.FieldByName('CELULAR').AsString;
end;

procedure TalterarPessoas.FormCreate(Sender: TObject);
begin
  conexaoBanco;
end;

procedure TalterarPessoas.limparCampos;
begin
  editId.Text := '';
  editNome.Text := '';
  editCpf.Text := '';
  editCelular.Text := '';
end;

// -----------------------------------------------

procedure TalterarPessoas.txtBuscaChange(Sender: TObject);
begin

  // BUSCA POR ID
  if buscarId.Checked then
  begin
    if Trim(txtBusca.Text) = '' then
    begin
      DM.dsPaciente.DataSet := DM.tdPaciente;
      DM.tdPaciente.Open;
      Exit;
    end;

    DM.tdPacienteFiltroId.Close;

    DM.tdPacienteFiltroId.ParamByName('ID').AsInteger :=
      StrToIntDef(txtBusca.Text, 0);

    DM.tdPacienteFiltroId.Open;

    DM.dsPaciente.DataSet := DM.tdPacienteFiltroId;
  end

  // BUSCA POR NOME
  else if buscarNome.Checked then
  begin
    if Trim(txtBusca.Text) = '' then
    begin
      DM.dsPaciente.DataSet := DM.tdPaciente;
      DM.tdPaciente.Open;
      Exit;
    end;

    DM.tdPacienteFiltroNome.Close;

    DM.tdPacienteFiltroNome.ParamByName('NOME').AsString :=
      '%' + txtBusca.Text + '%';

    DM.tdPacienteFiltroNome.Open;

    DM.dsPaciente.DataSet := DM.tdPacienteFiltroNome;
  end;

end;

procedure TalterarPessoas.txtBuscaCpfChange(Sender: TObject);
begin
  if Trim(txtBuscaCpf.Text) = '___.___.___-__' then
  begin
    DM.dsPaciente.DataSet := DM.tdPaciente;
    DM.tdPaciente.Open;
    Exit;
  end;

  DM.tdPacienteFiltroCpf.Close;

  DM.tdPacienteFiltroCpf.ParamByName('CPF').AsString :=
    '%' + txtBuscaCpf.Text + '%';

  DM.tdPacienteFiltroCpf.Open;

  DM.dsPaciente.DataSet := DM.tdPacienteFiltroCpf;
end;

procedure TalterarPessoas.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
