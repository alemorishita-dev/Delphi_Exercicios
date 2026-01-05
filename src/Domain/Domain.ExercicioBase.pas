unit Domain.ExercicioBase;

interface

uses
  System.SysUtils,
  Utils.Console,
  Domain.IExercicio;

type
  TExercicioBase = class(TInterfacedObject, IExercicio)
  protected
    function LerInteiro(const Prompt: string): Integer;
    function LerDouble(const Prompt: string): Double;
    procedure LimparTela;

    procedure Executar; virtual; abstract;
    function Numero: string; virtual; abstract;
  end;

implementation

{ TExercicioBase }

function TExercicioBase.LerInteiro(const Prompt: string): Integer;
begin
  while True do
  begin
    Write(Prompt);
    try
      Readln(Result);
      Exit;
    except
      on E: Exception do
        Writeln('Entrada invalida! Digite um numero inteiro.');
    end;
  end;
end;

function TExercicioBase.LerDouble(const Prompt: string): Double;
begin
  while True do
  begin
    Write(Prompt);
    try
      Readln(Result);
      Exit;
    except
      on E: Exception do
        Writeln('Entrada invalida! Digite um valor numerico (ex: 10,5).');
    end;
  end;
end;

procedure TExercicioBase.LimparTela;
begin
  Utils.Console.LimparConsole;
end;

end.
