unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TformPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    Cadastros1: TMenuItem;
    Pacientes1: TMenuItem;
    Agendamentos1: TMenuItem;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    Pesquisar1: TMenuItem;
    Pessoas1: TMenuItem;
    Agendamentos2: TMenuItem;
    Alterar1: TMenuItem;
    Pessoas2: TMenuItem;
    Agendamentos3: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Pacientes1Click(Sender: TObject);
    procedure Agendamentos1Click(Sender: TObject);
    procedure Agendamentos2Click(Sender: TObject);
    procedure Pessoas1Click(Sender: TObject);
    procedure Pessoas2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses CadPacientes, CadAgendamentos, UnitViewAgendamento, UnitViewPessoas,
  UnitAlterarPacientes;

procedure TformPrincipal.Agendamentos1Click(Sender: TObject);
begin
    if not Assigned(formCadAgendamentos) then
      Application.CreateForm(TformCadAgendamentos, formCadAgendamentos);

    formCadAgendamentos.ShowModal;

    FreeAndNil(formCadAgendamentos);
end;

procedure TformPrincipal.Agendamentos2Click(Sender: TObject);
begin
  if not Assigned(ViewAgendamentos) then
  Application.CreateForm(TViewAgendamentos, ViewAgendamentos);

  ViewAgendamentos.ShowModal;
  FreeAndNil(ViewAgendamentos)
end;

procedure TformPrincipal.Pacientes1Click(Sender: TObject);
begin
  if not Assigned(formCadPacientes) then
  Application.CreateForm(TformCadPacientes, formCadPacientes);

  formCadPacientes.ShowModal;
  FreeAndNil(formCadPacientes)
end;

procedure TformPrincipal.Pessoas1Click(Sender: TObject);
begin
  if not Assigned(viewPessoas) then
  Application.CreateForm(TviewPessoas, viewPessoas);

  viewPessoas.ShowModal;
  FreeAndNil(viewPessoas)
end;

procedure TformPrincipal.Pessoas2Click(Sender: TObject);
begin
  if not Assigned(alterarPessoas) then
  Application.CreateForm(TalterarPessoas, alterarPessoas);

  alterarPessoas.ShowModal;
  FreeAndNil(alterarPessoas)
end;

procedure TformPrincipal.Sair1Click(Sender: TObject);
begin
   close;
end;

end.
