unit Domain.Exercicio1;

interface

uses
  System.SysUtils,
  Domain.ExercicioBase;

type
  TExercicio1 = class(TExercicioBase)
  private
    function CalcularSalarioBruto(pHorasPorDia, pDiasTrabalhados: Integer; pValorHora: Double): Double;
    function CalcularDesconto(pSalarioBruto: Double): Double;
    function CalcularSalarioLiquido(pSalarioBruto, pDesconto: Double): Double;
  public
    procedure Executar(); override;

    function Numero: string; override;
  end;

implementation

{ TExercicio1 }

function TExercicio1.CalcularDesconto(pSalarioBruto: Double): Double;
begin
  Result := pSalarioBruto * 0.15;
end;

function TExercicio1.CalcularSalarioBruto(pHorasPorDia, pDiasTrabalhados: Integer; pValorHora: Double): Double;
begin
  Result := (pHorasPorDia * pDiasTrabalhados) * pValorHora;
end;

function TExercicio1.CalcularSalarioLiquido(pSalarioBruto, pDesconto: Double): Double;
begin
  Result := pSalarioBruto - pDesconto;
end;

procedure TExercicio1.Executar;
var
  lHorasPorDia, lDiasTrabalhados: Integer;
  lValorHora, lSalarioBruto, lDesconto, lSalarioLiquido: Double;
begin
  try
    try
      LimparTela;

      lHorasPorDia     := LerInteiro('Digite a quantidade de horas trabalhadas por dia: ');
      lValorHora       := LerDouble('Digite o valor da hora trabalhada: R$ ');
      lDiasTrabalhados := LerInteiro('Digite a quantidade de dias trabalhados no mes: ');

      lSalarioBruto := CalcularSalarioBruto(lHorasPorDia, lDiasTrabalhados, lValorHora);
      lDesconto := CalcularDesconto(lSalarioBruto);
      lSalarioLiquido := CalcularSalarioLiquido(lSalarioBruto, lDesconto);

      Writeln('------------------------------------------');
      Writeln(Format('Salario Bruto  : R$ %10.2f', [lSalarioBruto]));
      Writeln(Format('Desconto (15%%) : R$ %10.2f', [lDesconto]));
      Writeln(Format('Salario Liquido: R$ %10.2f', [lSalarioLiquido]));
      Writeln('------------------------------------------');
      Writeln('');

    except
    on E: EInOutError do
      raise Exception.Create('Erro na entrada de dados. Digite apenas numeros.');
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end;

function TExercicio1.Numero: string;
begin
  Result:= '1';
end;

end.
