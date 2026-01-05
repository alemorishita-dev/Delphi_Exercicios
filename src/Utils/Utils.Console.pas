unit Utils.Console;

interface

uses Winapi.Windows;

procedure LimparConsole;

implementation

procedure LimparConsole;
var
  hConsole: THandle;
  csbi: TConsoleScreenBufferInfo;
  CellsWritten, ConsoleSize: DWORD;
  HomeCoords: TCoord;
begin
  hConsole := GetStdHandle(STD_OUTPUT_HANDLE);
  if hConsole = INVALID_HANDLE_VALUE then Exit;

  GetConsoleScreenBufferInfo(hConsole, csbi);
  ConsoleSize := csbi.dwSize.X * csbi.dwSize.Y;
  HomeCoords.X := 0; HomeCoords.Y := 0;

  FillConsoleOutputCharacter(hConsole, ' ', ConsoleSize, HomeCoords, CellsWritten);
  SetConsoleCursorPosition(hConsole, HomeCoords);
end;

end.
