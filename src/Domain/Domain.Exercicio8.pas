unit Domain.Exercicio8;

interface

uses
  System.SysUtils, System.Math, Domain.ExercicioBase;

type
  TMatrizDinamica = array of array of Integer;

  TExercicio8 = class(TExercicioBase)
  private
    function CriarMatrizCaracol(pN: Integer): TMatrizDinamica;
    procedure ImprimirMatriz(const pMatriz: TMatrizDinamica);
  public
    procedure Executar; override;
    function Numero: string; override;
  end;

implementation

{ TExercicio8 }

function TExercicio8.CriarMatrizCaracol(pN: Integer): TMatrizDinamica;
var
  I, J, lContador: Integer;
  lLinhaInicio, lLinhaFim, lColInicio, lColFim: Integer;
begin
  SetLength(Result, pN, pN);

  lContador := 2;
  lLinhaInicio := 0;
  lLinhaFim := pN - 1;
  lColInicio := 0;
  lColFim := pN - 1;

  while (lLinhaInicio <= lLinhaFim) and (lColInicio <= lColFim) do
  begin
    // Direita
    for J := lColInicio to lColFim do
    begin
      Result[lLinhaInicio, J] := lContador;
      Inc(lContador, 2);
    end;
    Inc(lLinhaInicio);

    // Baixo
    for I := lLinhaInicio to lLinhaFim do
    begin
      Result[I, lColFim] := lContador;
      Inc(lContador, 2);
    end;
    Dec(lColFim);

    // Esquerda
    if (lLinhaInicio <= lLinhaFim) then
    begin
      for J := lColFim downto lColInicio do
      begin
        Result[lLinhaFim, J] := lContador;
        Inc(lContador, 2);
      end;
      Dec(lLinhaFim);
    end;

    // Cima
    if (lColInicio <= lColFim) then
    begin
      for I := lLinhaFim downto lLinhaInicio do
      begin
        Result[I, lColInicio] := lContador;
        Inc(lContador, 2);
      end;
      Inc(lColInicio);
    end;
  end;
end;

procedure TExercicio8.ImprimirMatriz(const pMatriz: TMatrizDinamica);
var
  I, J, lN, lMaxValor, lEspacamento: Integer;
  lBorda: string;
begin
  lN := Length(pMatriz);
  if lN = 0 then
    Exit;

  lMaxValor := lN * lN * 2;
  lEspacamento := Length(IntToStr(lMaxValor)) + 1;

  lBorda := StringOfChar('-', lN * lEspacamento + 2);

  Writeln;
  Writeln(Format('Matriz Caracol %dx%d:', [lN, lN]));
  Writeln(lBorda);

  for I := 0 to lN - 1 do
  begin
    Write('|');
    for J := 0 to lN - 1 do
    begin
      Write(Format('%*d', [lEspacamento, pMatriz[I, J]]));
    end;
    Writeln(' |');
  end;

  Writeln(lBorda);
end;

procedure TExercicio8.Executar;
var
  lN: Integer;
  lMatriz: TMatrizDinamica;
begin
  LimparTela;
  Writeln('=== EXERCICIO 8: MATRIZ CARACOL DINAMICA ===');
  Writeln;

  lN := LerInteiro('Digite o tamanho da matriz quadrada (N): ');

  if lN <= 0 then
  begin
    Writeln('Erro: Tamanho invalido.');
  end
  else if lN > 20 then
  begin
    Writeln('Aviso: Tamanhos maiores que 20 podem comprometer a visualizacao no console.');
    if (UpperCase(LerString('Deseja continuar? (S/N): ')) <> 'S') then
      Exit;
  end;

  lMatriz := CriarMatrizCaracol(lN);
  ImprimirMatriz(lMatriz);
end;

function TExercicio8.Numero: string;
begin
  Result := '8';
end;

end.

