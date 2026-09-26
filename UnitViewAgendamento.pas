unit UnitViewAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TViewAgendamentos = class(TForm)
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    RadioGroup1: TRadioGroup;
    filtroId: TRadioButton;
    filtroMedico: TRadioButton;
    txtFiltro: TEdit;
    lblFiltro: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure filtroIdClick(Sender: TObject);
    procedure filtroMedicoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure conexaoBanco;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewAgendamentos: TViewAgendamentos;

implementation

{$R *.dfm}

uses unitDM;

procedure TViewAgendamentos.Button1Click(Sender: TObject);
begin
  if Trim(txtFiltro.Text) = '' then
    begin
      ShowMessage('Escreva algo na caixa de texto antes de realizar a consulta!');
      exit
    end
  else
    begin

    if filtroId.Checked = True then
    begin
      DM.tdAgendamento.Close;


      DM.tdAgendamento.SQL.Text := ('SELECT * FROM AGENDAMENTO A INNER JOIN PACIENTE P' +
      ' ON A.ID_PACIENTE = P.ID WHERE P.ID = :ID;');

      DM.tdAgendamento.ParamByName('ID').AsInteger := StrToInt(txtFiltro.Text);

      DM.tdAgendamento.Open;
      if DM.tdAgendamento.IsEmpty then
      begin
        ShowMessage('Nenhum Registro Encontrado')
      end;
    end;

    if filtroMedico.Checked = True then
    begin
      DM.tdAgendamento.Close;

      DM.tdAgendamento.SQL.Text := ('SELECT * FROM AGENDAMENTO WHERE MEDICO LIKE :MEDICO');

      DM.tdAgendamento.ParamByName('MEDICO').AsString := '%' + Trim(txtFiltro.Text) + '%';

      DM.tdAgendamento.Open;
      if DM.tdAgendamento.IsEmpty then
      begin
        ShowMessage('Nenhum Registro Encontrado')
      end;
    end;
  end;
end;

procedure TViewAgendamentos.Button2Click(Sender: TObject);
begin
  txtFiltro.Text := '';
  conexaoBanco;
end;

procedure TViewAgendamentos.conexaoBanco;
begin
  DM.tdAgendamento.Close;

  DM.tdAgendamento.SQL.Text := ('SELECT * FROM AGENDAMENTO');

  DM.tdAgendamento.Open;
end;

procedure TViewAgendamentos.filtroIdClick(Sender: TObject);
begin
  if filtroId.Checked = True then
  begin
    lblFiltro.Caption := 'Buscar por ID';
  end;
end;

procedure TViewAgendamentos.filtroMedicoClick(Sender: TObject);
begin
  if filtroMedico.Checked = True then
  begin
    txtFiltro.NumbersOnly := False;
    lblFiltro.Caption := 'Buscar por Medico';
  end;
end;

procedure TViewAgendamentos.FormCreate(Sender: TObject);
begin
  conexaoBanco;
end;

procedure TViewAgendamentos.SpeedButton1Click(Sender: TObject);
begin
  DM.tdAgendamento.Close;
  close;
end;

end.
