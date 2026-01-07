unit App.ExercicioFactory;

interface

uses
  System.SysUtils,
  Domain.IExercicio,
  Domain.Exercicio1,
  Domain.Exercicio2,
  Domain.Exercicio3,
  Domain.Exercicio4,
  Domain.Exercicio5,
  Domain.Exercicio6,
  Domain.Exercicio7,
  Domain.Exercicio8;
type
  TExercicioFactory = class
  public
    class function Criar(const pNumeroExercicio: string): IExercicio;
    class function Listar(): TArray<string>;
  end;

implementation

{ TExercicioFactory }

class function TExercicioFactory.Criar(const pNumeroExercicio: string): IExercicio;
var
  lOpcao: Integer;
begin
  Result := nil;

  lOpcao := StrToIntDef(pNumeroExercicio, -1);

  case lOpcao of
    1: Result := TExercicio1.Create;
    2: Result := TExercicio2.Create;
    3: Result := TExercicio3.Create;
    4: Result := TExercicio4.Create;
    5: Result := TExercicio5.Create;
    6: Result := TExercicio5.Create;
    7: Result := TExercicio7.Create;
    8: Result := TExercicio8.Create;
  else
    raise Exception.CreateFmt('Exercicio "%s" nao encontrado na Fabrica.', [pNumeroExercicio]);
  end;
end;

class function TExercicioFactory.Listar: TArray<string>;
begin
  Result := ['1', '2', '3', '4', '5', '6', '7', '8'];
end;

end.
