unit Domain.Exercicio6;

interface

uses
  System.SysUtils,
  System.Classes,
  Domain.ExercicioBase;

type
  { TExercicio6: Analisador de Propriedades Numéricas }
  TExercicio6 = class(TExercicioBase)
  private
    function IsPrimo(pNumero: Integer): Boolean;
    function IsPerfeito(pNumero: Integer): Boolean;
    function ClassificarNumero(pNumero: Integer): string;
  public
    procedure Executar; override;
    function Numero: string; override;
  end;

implementation

{ TExercicio6 }

function TExercicio6.Numero: string;
begin
  Result := '6';
end;

function TExercicio6.IsPrimo(pNumero: Integer): Boolean;
var
  I: Integer;
begin
  if pNumero < 2 then Exit(False);
  if pNumero = 2 then Exit(True);
  if pNumero mod 2 = 0 then Exit(False);

  I := 3;
  while (I * I <= pNumero) do
  begin
    if (pNumero mod I = 0) then Exit(False);
    Inc(I, 2);
  end;
  Result := True;
end;

function TExercicio6.IsPerfeito(pNumero: Integer): Boolean;
var
  I, lSoma: Integer;
begin
  if pNumero < 2 then Exit(False);

  lSoma := 1; // 1 sempre é divisor
  for I := 2 to Trunc(Sqrt(pNumero)) do
  begin
    if (pNumero mod I = 0) then
    begin
      lSoma := lSoma + I;
      if (I <> pNumero div I) then
        lSoma := lSoma + (pNumero div I);
    end;
  end;
  Result := (lSoma = pNumero);
end;

function TExercicio6.ClassificarNumero(pNumero: Integer): string;
var
  lLista: TStringList;
begin
  lLista := TStringList.Create;
  try
    if Odd(pNumero) then lLista.Add('[impar]')
    else lLista.Add('[par]');

    if IsPrimo(pNumero) then lLista.Add('[primo]');
    if IsPerfeito(pNumero) then lLista.Add('[perfeito]');

    Result := lLista.Text.Replace(sLineBreak, ' ').Trim;
  finally
    lLista.Free;
  end;
end;

procedure TExercicio6.Executar;
var
  lLimite, I: Integer;
begin
  LimparTela;
  Writeln('=== EXERCICIO 6: ANALISADOR DE SEQUENCIA ===');
  Writeln;

  lLimite := LerInteiro('Digite o limite da sequencia (N): ');

  if lLimite <= 0 then
    Writeln('Erro: O numero deve ser maior que zero.')
  else
  begin
    Writeln;
    Writeln(Format('Analisando numeros de 1 a %d:', [lLimite]));
    Writeln('-------------------------------------------');

    for I := 1 to lLimite do
      Writeln(Format('%3d: %s', [I, ClassificarNumero(I)]));

    Writeln('-------------------------------------------');
  end;
end;

end.
