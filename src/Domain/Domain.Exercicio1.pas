unit Domain.Exercicio1;

interface

uses
  System.SysUtils,
  Domain.IExercicio;

type
  TExercicio1 = class(TInterfacedObject, IExercicio)
  private
    function CalcularSalarioBruto(pHorasPorDia, pDiasTrabalhados: Integer; pValorHora: Double): Double;
    function CalcularDesconto(pSalarioBruto: Double): Double;
    function CalcularSalarioLiquido(pSalarioBruto, pDesconto: Double): Double;
  public
    procedure Executar();

    function Numero: string;
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
      Write('Digite a quantidade de horas trabalhadas por dia: ');
      Readln(lHorasPorDia);

      Write('Digite o valor da hora trabalhada: R$ ');
      Readln(lValorHora);

      Write('Digite a quantidade de dias trabalhados no mes: ');
      Readln(lDiasTrabalhados);

      lSalarioBruto := CalcularSalarioBruto(lHorasPorDia, lDiasTrabalhados, lValorHora);
      lDesconto := CalcularDesconto(lSalarioBruto);
      lSalarioLiquido := CalcularSalarioLiquido(lSalarioBruto, lDesconto);

      Writeln('------------------------------------------');
      Writeln('Salario Bruto  : R$ ', lSalarioBruto:0:2);
      Writeln('Desconto (15%) : R$ ', lDesconto:0:2);
      Writeln('Salario Liquido: R$ ', lSalarioLiquido:0:2);
      Writeln('------------------------------------------');

      Writeln('Pressione Enter para sair...');

      Readln;

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
