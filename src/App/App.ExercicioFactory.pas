unit App.ExercicioFactory;

interface

uses
  System.SysUtils,
  Domain.IExercicio,
  Domain.Exercicio1;

type
  TExercicioFactory = class
  public
    class function Criar(const pNumeroExercicio: string): IExercicio;
    class function Listar(): TArray<string>;
  end;

implementation

{ TExercicioFactory }

class function TExercicioFactory.Criar(const pNumeroExercicio: string): IExercicio;
begin
  Result := nil;

  if pNumeroExercicio = '1' then
    Result := TExercicio1.Create
//  else if pNumeroExercicio = '2' then
//    Result := TExercicio2.Create ();
  ;
  if not Assigned(Result) then
    raise Exception.CreateFmt('Exercício "%s" não encontrado na Fábrica.', [pNumeroExercicio]);
end;

class function TExercicioFactory.Listar: TArray<string>;
begin
  Result := ['1']; // futuramente: ['1', '2', '3']
end;

end.
