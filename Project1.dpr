program Project1;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {formPrincipal},
  CadPacientes in 'CadPacientes.pas' {formCadPacientes},
  CadAgendamentos in 'CadAgendamentos.pas' {formCadAgendamentos},
  unitDM in 'unitDM.pas' {DM: TDataModule},
  UnitViewAgendamento in 'UnitViewAgendamento.pas' {ViewAgendamentos},
  UnitViewPessoas in 'UnitViewPessoas.pas' {viewPessoas},
  UnitAlterarPacientes in 'UnitAlterarPacientes.pas' {alterarPessoas},
  UnitAlterarTelaAgendamento in 'UnitAlterarTelaAgendamento.pas' {UnitAlterarAgendamento},
  CadEspecialidade in 'CadEspecialidade.pas' {UnitCadEspecialidade},
  CadMedico in 'CadMedico.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TForm1, Form1);
  //  Application.CreateForm(TUnitCadEspecialidade, UnitCadEspecialidade);
  //  Application.CreateForm(TUnitAlterarAgendamento, UnitAlterarAgendamento);
  //  Application.CreateForm(TalterarPessoas, alterarPessoas);
  //  Application.CreateForm(TviewPessoas, viewPessoas);
  //  Application.CreateForm(TViewAgendamentos, ViewAgendamentos);
  //  Application.CreateForm(TformCadPacientes, formCadPacientes);
//  Application.CreateForm(TformCadAgendamentos, formCadAgendamentos);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
