unit Domain.Exercicio7;

interface

uses
  System.SysUtils,
  System.StrUtils,
  Domain.ExercicioBase;

type
  TExercicio7 = class(TExercicioBase)
  private
    const
      LARGURA_MOLDURA = 50;
      CARACTERE_BORDA = '#';

    function FormatarLinhaTexto(pTexto: string): string;
  public
    procedure Executar; override;
    function Numero: string; override;
  end;

implementation


{ TExercicio7 }

procedure TExercicio7.Executar;
var
  lSuperior, lInferior: string;
  lBordaHorizontal, lLinhaVazia: string;
begin
  LimparTela;
  Writeln('=== EXERCICIO 7: GERADOR DE MOLDURAS ===');
  Writeln;

  Write('Digite o titulo principal (Superior): ');
  Readln(lSuperior);
  Write('Digite o subtitulo (Inferior): ');
  Readln(lInferior);

  lBordaHorizontal := StringOfChar(CARACTERE_BORDA, LARGURA_MOLDURA);
  lLinhaVazia      := CARACTERE_BORDA + StringOfChar(' ', LARGURA_MOLDURA - 2) + CARACTERE_BORDA;

  Writeln;
  Writeln(lBordaHorizontal);
  Writeln(lLinhaVazia);

  Writeln(FormatarLinhaTexto(lSuperior));
  Writeln(FormatarLinhaTexto(lInferior));

  Writeln(lLinhaVazia);
  Writeln(lBordaHorizontal);
end;

function TExercicio7.FormatarLinhaTexto(pTexto: string): string;
var
  lTextoProcessado: string;
  lEspacosEsquerda, lEspacosDireita: Integer;
  lLarguraUtil: Integer;
begin
  lLarguraUtil := LARGURA_MOLDURA - 2;

  lTextoProcessado := Copy(pTexto.Trim, 1, lLarguraUtil);

  lEspacosEsquerda := (lLarguraUtil - Length(lTextoProcessado)) div 2;
  lEspacosDireita  := lLarguraUtil - Length(lTextoProcessado) - lEspacosEsquerda;

  Result := CARACTERE_BORDA +
            StringOfChar(' ', lEspacosEsquerda) +
            lTextoProcessado +
            StringOfChar(' ', lEspacosDireita) +
            CARACTERE_BORDA;
end;

function TExercicio7.Numero: string;
begin
  Result := '7';
end;

end.
