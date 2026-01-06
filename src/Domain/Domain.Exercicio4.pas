unit Domain.Exercicio4;

interface

uses
  System.SysUtils,
  Domain.ExercicioBase;

type
  TExercicio4 = class(TExercicioBase)
  private
    const
      CEDULAS_DISPONIVEIS: array[0..6] of Integer = (100, 50, 20, 10, 5, 2, 1);

    procedure DecomporEExibir(pValorTotal: Integer);
  public
    procedure Executar; override;
    function Numero: string; override;
  end;

implementation

{ TExercicio4 }

procedure TExercicio4.DecomporEExibir(pValorTotal: Integer);
var
  lSaldo, lQuantidade, lCedula: Integer;
begin
  lSaldo := pValorTotal;

  Writeln;
  Writeln(Format('Para o valor de R$ %d,00:', [pValorTotal]));
  Writeln('-----------------------------------------');

  for lCedula in CEDULAS_DISPONIVEIS do
  begin
    lQuantidade := lSaldo div lCedula;
    lSaldo      := lSaldo mod lCedula;

    Writeln(Format('%3d nota(s) de R$ %3d,00', [lQuantidade, lCedula]));
  end;

  Writeln('-----------------------------------------');
end;

procedure TExercicio4.Executar;
var
  lValor: Integer;
begin
  LimparTela;
  Writeln('=== EXERCICIO 4: DECOMPOSICAO DE NOTAS ===');
  Writeln;

  lValor := LerInteiro('Digite o valor inteiro para saque: R$ ');

  if lValor <= 0 then
    Writeln('Valor invalido para calculo.')
  else
    DecomporEExibir(lValor);
end;

function TExercicio4.Numero: string;
begin
  Result := '4';
end;

end.
