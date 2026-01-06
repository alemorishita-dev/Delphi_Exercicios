unit Domain.Exercicio5;

interface

uses
  System.SysUtils,
  System.RegularExpressions,
  System.StrUtils,
  Domain.ExercicioBase;

type
  TExercicio5 = class(TExercicioBase)
  private
    const
      MAPA_MERCOSUL = 'ABCDEFGHIJ';
      REGEX_PLACA   = '^[A-Z]{3}[0-9][A-Z0-9][0-9]{2}$';

    function ValidarFormato(const pPlaca: string): Boolean;
    function IsMercosul(const pPlaca: string): Boolean;
    function ObterCorrespondente(const pPlaca: string): string;
  public
    procedure Executar; override;
    function Numero: string; override;
  end;

implementation

{ TExercicio5 }

function TExercicio5.Numero: string;
begin
  Result := '5';
end;

procedure TExercicio5.Executar;
var
  lPlacaOriginal, lPlacaConvertida: string;
begin
  LimparTela;
  Writeln('=== EXERCICIO 5: CONVERSOR DE PLACAS ===');
  Writeln;

  Write('Informe a placa (AAA9999 ou AAA9A99): ');
  Readln(lPlacaOriginal);
  lPlacaOriginal := lPlacaOriginal.Trim.ToUpper;

  if not ValidarFormato(lPlacaOriginal) then
    Writeln('Erro: Formato de placa invalido!')
  else
  begin
    lPlacaConvertida := ObterCorrespondente(lPlacaOriginal);

    Writeln('-----------------------------------------');
    Writeln('Placa Original : ', lPlacaOriginal);
    Writeln('Padrao Atual   : ', IfThen(IsMercosul(lPlacaOriginal), 'Mercosul', 'Brasil Antigo'));
    Writeln('Correspondente : ', lPlacaConvertida);
    Writeln('-----------------------------------------');
  end;
end;

function TExercicio5.ValidarFormato(const pPlaca: string): Boolean;
begin
  Result := TRegEx.IsMatch(pPlaca.ToUpper, REGEX_PLACA);
end;

function TExercicio5.IsMercosul(const pPlaca: string): Boolean;
begin
  Result := TRegEx.IsMatch(pPlaca[5], '[A-Z]');
end;

function TExercicio5.ObterCorrespondente(const pPlaca: string): string;
var
  lQuintoChar: Char;
  lNovoChar: Char;
  lPosicao: Integer;
begin
  Result := pPlaca.ToUpper;
  lQuintoChar := Result[5];

  if IsMercosul(Result) then
  begin
    lPosicao := Pos(lQuintoChar, MAPA_MERCOSUL);
    lNovoChar := IntToStr(lPosicao - 1)[1];
  end
  else
  begin
    lPosicao := StrToInt(lQuintoChar);
    lNovoChar := MAPA_MERCOSUL[lPosicao + 1];
  end;

  Result[5] := lNovoChar;
end;

end.
