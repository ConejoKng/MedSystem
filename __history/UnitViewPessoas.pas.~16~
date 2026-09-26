unit UnitViewPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TviewPessoas = class(TForm)
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    filtroId: TRadioButton;
    filtroCpf: TRadioButton;
    txtFiltro: TEdit;
    lblFiltro: TLabel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    txtFiltroCpf: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure conexaoBanco;
    procedure lblFiltroClick(Sender: TObject);
    procedure filtroCpfClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewPessoas: TviewPessoas;

implementation

{$R *.dfm}

uses unitDM;

procedure TviewPessoas.Button1Click(Sender: TObject);
begin

  if filtroId.Checked = True then
  begin
    DM.tdPaciente.Close;

    DM.tdPaciente.SQL.Text := ('SELECT * FROM PACIENTE WHERE ID = :ID');

    DM.tdPaciente.ParamByName('ID').AsInteger := StrToInt(txtFiltro.Text);

    DM.tdPaciente.Open;
    if DM.tdPaciente.IsEmpty then
    begin
      ShowMessage('Nenhum Registro Encontrado')
    end;
  end;

  if filtroCpf.Checked = True then
  begin
    DM.tdPaciente.Close;

    DM.tdPaciente.SQL.Text := ('SELECT * FROM PACIENTE WHERE CPF = :CPF');
    DM.tdPaciente.ParamByName('CPF').AsString := txtFiltroCpf.Text;

    Dm.tdPaciente.Open;
    if DM.tdPaciente.IsEmpty then
    begin
      ShowMessage('Nenhum Registro Encontrado')
    end;
  end;

end;

procedure TviewPessoas.Button2Click(Sender: TObject);
begin
  txtFiltro.Text := '';
  txtFiltroCpf.Text := '';
  conexaoBanco;
end;

procedure TviewPessoas.conexaoBanco;
begin
  DM.tdPaciente.close;

  DM.tdPaciente.SQL.Text := ('SELECT * FROM PACIENTE');

  DM.tdPaciente.Open;
end;

procedure TviewPessoas.filtroCpfClick(Sender: TObject);
begin
  txtFiltroCpf.Visible := True;
  txtFiltro.Visible := False;
  lblFiltro.Caption := ('Buscar por CPF');
end;

procedure TviewPessoas.FormCreate(Sender: TObject);
begin
  conexaoBanco;
end;

procedure TviewPessoas.lblFiltroClick(Sender: TObject);
begin
  txtFiltro.Visible := True;
  txtFiltroCpf.Visible := False;
  lblFiltro.Caption := ('Buscar por ID');
end;

procedure TviewPessoas.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

end.
