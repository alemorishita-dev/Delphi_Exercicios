program Delphi_Exercicios;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Domain.IExercicio in 'src\Domain\Domain.IExercicio.pas',
  App.ExercicioFactory in 'src\App\App.ExercicioFactory.pas',
  Utils.Console in 'src\Utils\Utils.Console.pas';

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
  lExercicio: IExercicio;
begin
  try
    lExercicio := TExercicioFactory.Criar(pNumeroExercicio);

    Writeln('>>> Exercício: ', lExercicio.Numero);
    Writeln;
    lExercicio.Executar;
  except
    on E: Exception do
      Writeln('ERRO: ', E.Message);
  end;
end;

var
  lNumeroExercicio: string;
begin
  try
    repeat
      Utils.Console.LimparConsole;

      MostrarMenu;
      Readln(lNumeroExercicio);

      if lNumeroExercicio = '0' then
        Break;

      Utils.Console.LimparConsole;

      ExecutarExercicio(lNumeroExercicio);

      Writeln;
      Writeln('Pressione Enter para voltar ao menu...');
      Readln;

    until False;

    Utils.Console.LimparConsole;
    Writeln('Saindo, até a próxima!');

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
