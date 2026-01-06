unit Domain.Exercicio2;

interface

uses
  System.SysUtils,
  Domain.ExercicioBase;

type
  TExercicio2 = class(TExercicioBase)
  private
    function IsValoresAceitos(pValorA, pValorB, pValorC, pValorD: Integer): Boolean;
  public
    procedure Executar(); override;
    function Numero: string; override;
  end;

implementation

{ TExercicio2 }

procedure TExercicio2.Executar;
var
  lValorA, lValorB, lValorC, lValorD: Integer;
begin
  try
    Writeln('--- Validação de Valores ---');
    Writeln('Digite quatro valores inteiros (A, B, C, D):');

    lValorA := LerInteiro('Digite o valor A: ');
    lValorB := LerInteiro('Digite o valor B: ');
    lValorC := LerInteiro('Digite o valor C: ');
    lValorD := LerInteiro('Digite o valor D: ');

    if IsValoresAceitos(lValorA, lValorB, lValorC, lValorD) then
      Writeln('Valores aceitos')
    else
      Writeln('Valores nao aceitos');

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end;

function TExercicio2.IsValoresAceitos(pValorA, pValorB, pValorC, pValorD: Integer): Boolean;
begin
  Result := (pValorB > pValorC) and (pValorD > pValorA)
            and ((pValorC + pValorD) > (pValorA + pValorB))
            and (pValorC > 0) and (pValorD > 0) and (pValorA mod 2 = 0);
end;

function TExercicio2.Numero: string;
begin
  Result := '2';
end;

end.
