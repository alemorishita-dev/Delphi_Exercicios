program Delphi_Exercicios;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Winapi.Windows,
  Domain.IExercicio in 'src\Domain\Domain.IExercicio.pas',
  Domain.Exercicio1 in 'src\Domain\Domain.Exercicio1.pas',
  App.ExercicioFactory in 'src\App\App.ExercicioFactory.pas';

procedure LimparTela;
var
  hConsole: THandle;
  csbi: TConsoleScreenBufferInfo;
  CellsWritten: DWORD;
  ConsoleSize: DWORD;
  HomeCoords: TCoord;
begin
  hConsole := GetStdHandle(STD_OUTPUT_HANDLE);
  if hConsole = INVALID_HANDLE_VALUE then Exit;

  GetConsoleScreenBufferInfo(hConsole, csbi);
  ConsoleSize := csbi.dwSize.X * csbi.dwSize.Y;

  HomeCoords.X := 0;
  HomeCoords.Y := 0;

  FillConsoleOutputCharacter(
    hConsole,
    ' ',
    ConsoleSize,
    HomeCoords,
    CellsWritten
  );

  SetConsoleCursorPosition(hConsole, HomeCoords);
end;

procedure MostrarMenu;
var
  Item: string;
begin
  Writeln('==============================');
  Writeln('   MENU DE EXERCÍCIOS');
  Writeln('==============================');

  for Item in TExercicioFactory.Listar do
    Writeln(Item, ' - Exercício ', Item);

  Writeln('0 - Sair');
  Writeln;
  Write('Opção: ');
end;

procedure ExecutarExercicio(const pNumeroExercicio: string);
var
  Exercicio: IExercicio;
begin
  Exercicio := TExercicioFactory.Criar(pNumeroExercicio);

  if not Assigned(Exercicio) then
  begin
    Writeln('Exercício não encontrado.');
    Exit;
  end;

  Writeln('Iniciando Exercício: ', Exercicio.Numero);
  Exercicio.Executar;
end;

var
  lNumeroExercicio: string;
begin
  try
    repeat
      LimparTela;
      MostrarMenu;
      Readln(lNumeroExercicio);

      if lNumeroExercicio = '0' then
        Break;

      LimparTela;

      ExecutarExercicio(lNumeroExercicio);

      Writeln;
      Writeln('Pressione ENTER para continuar...');
      Readln;

    until False;

    LimparTela;
    Writeln('Saindo, até a próxima!');

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
