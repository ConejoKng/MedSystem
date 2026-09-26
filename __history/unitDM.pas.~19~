unit unitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    dsPaciente: TDataSource;
    dsAgendamento: TDataSource;
    tdPaciente: TFDQuery;
    tdAgendamento: TFDQuery;
    insertPaciente: TFDQuery;
    insertAgendamento: TFDQuery;
    tdPacienteID: TIntegerField;
    tdPacienteCPF: TStringField;
    tdPacienteNOME: TStringField;
    tdPacienteCELULAR: TStringField;
    tdPacienteDATA_CADASTRO: TDateField;
    tdPacienteFiltroId: TFDQuery;
    tdPacienteFiltroNome: TFDQuery;
    tdPacienteFiltroCpf: TFDQuery;
    updatePaciente: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
