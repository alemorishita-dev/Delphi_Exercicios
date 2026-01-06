unit Domain.Exercicio3;

interface

uses
  System.SysUtils,
  Domain.ExercicioBase;

type
  TExercicio3 = class(TExercicioBase)
  private
    const
      PERC_DISTRIBUIDOR = 0.125;
      PERC_IMPOSTOS     = 0.33;
      PERC_DESCONTO_AV  = 0.05;

    function CalcularValorDistribuidor(pCustoFabrica: Double): Double;
    function CalcularValorImpostos(pCustoFabrica: Double): Double;
    function CalcularValorDesconto(pValorTotal: Double): Double;
  public
    procedure Executar; override;
    function Numero: string; override;
  end;

implementation

{ TExercicio }

function TExercicio3.CalcularValorDesconto(pValorTotal: Double): Double;
begin
  Result := pValorTotal * PERC_DESCONTO_AV;
end;

function TExercicio3.CalcularValorDistribuidor(pCustoFabrica: Double): Double;
begin
  Result := pCustoFabrica * PERC_DISTRIBUIDOR;
end;

function TExercicio3.CalcularValorImpostos(pCustoFabrica: Double): Double;
begin
  Result := pCustoFabrica * PERC_IMPOSTOS;
end;

procedure TExercicio3.Executar;
var
  lCustoFabrica, lValorDistribuidor, lValorImpostos: Double;
  lValorCarroFinal, lValorDesconto, lValorComDesconto: Double;
begin
  inherited;

  try
    LimparTela;
    Writeln('=== EXERCICIO 3: CUSTO DE VEICULO NOVO ===');
    Writeln;

    lCustoFabrica := LerDouble('Digite o custo de fabrica do veiculo: R$ ');

    lValorDistribuidor := CalcularValorDistribuidor(lCustoFabrica);
    lValorImpostos     := CalcularValorImpostos(lCustoFabrica);
    lValorCarroFinal   := lCustoFabrica + lValorDistribuidor + lValorImpostos;
    lValorDesconto     := CalcularValorDesconto(lValorCarroFinal);
    lValorComDesconto  := lValorCarroFinal - lValorDesconto;

    Writeln;
    Writeln('=========================================');
    Writeln('         DETALHAMENTO DE CUSTOS          ');
    Writeln('=========================================');
    Writeln(Format('Custo de Fabrica     : R$ %10.2f', [lCustoFabrica]));
    Writeln(Format('Valor do Distribuidor: R$ %10.2f', [lValorDistribuidor]));
    Writeln(Format('Valor dos Impostos   : R$ %10.2f', [lValorImpostos]));
    Writeln('-----------------------------------------');
    Writeln(Format('VALOR DO CARRO       : R$ %10.2f', [lValorCarroFinal]));
    Writeln('-----------------------------------------');
    Writeln(Format('Valor do Desconto    : R$ %10.2f', [lValorDesconto]));
    Writeln(Format('VALOR A VISTA (-5%%)  : R$ %10.2f', [lValorComDesconto]));
    Writeln('=========================================');

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end;

function TExercicio3.Numero: string;
begin
  Result := '3';
end;

end.
