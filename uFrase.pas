unit uFrase;

interface

type
  TFrase = class
  private
    const ESPACO = ' ';

    var FQuantidadeEspacos: integer;
  public
    function VerificarMaiorPalavra(psFrase: string): string;
    function VerificarQuantidadePalindromos(psPalavra, psFrase: string): string;
  end;

implementation

uses
  Classes, SysUtils, StrUtils;

function TFrase.VerificarMaiorPalavra(psFrase: string): string;
var
  slPalavrasQuebradas: TStringList;
  iContador: Integer;
begin
  slPalavrasQuebradas := TStringList.Create;
  try
    slPalavrasQuebradas.Text := psFrase.Replace(ESPACO, sLineBreak);
    for iContador := 0 to Pred(slPalavrasQuebradas.Count) do
      if Result.Length < slPalavrasQuebradas[iContador].Length then
        Result := slPalavrasQuebradas[iContador];
  finally
    FreeAndNil(slPalavrasQuebradas);
  end;
end;

function TFrase.VerificarQuantidadePalindromos(psPalavra, psFrase: string): string;
var
  iContador, j, iQuantidadeEspacos, iPosicaoEspaco: Integer;
  sPalavraAux, sPalavraAux2, sFraseReversa: string;
  bTemEspaco: boolean;
  qtAux: integer;
begin
  sFraseReversa := ReverseString(psFrase);
  for iContador := 0 to Pred(sFraseReversa.Length) do
  begin
    sPalavraAux := sFraseReversa.Substring(iContador, psPalavra.Length);

    iQuantidadeEspacos := 0;
    qtAux := sPalavraAux.CountChar(' ');
    while qtAux > 0 do
    begin
      Delete(sPalavraAux, sPalavraAux.IndexOf(' ')+1, 1);
      Inc(iQuantidadeEspacos);
      sPalavraAux := sPalavraAux + Copy(sFraseReversa, iContador + sPalavraAux.Length + iQuantidadeEspacos, iQuantidadeEspacos);
      qtAux := sPalavraAux.CountChar(' ');
    end;

{    sPalavraAux := sPalavraAux.Replace(ESPACO, EmptyStr);
    sPalavraAux := Copy(sPalavraAux, 0, psPalavra.Length);}
    if UpperCase(sPalavraAux) = UpperCase(psPalavra.Replace(ESPACO, EmptyStr)) then
      Result := Result + sLineBreak + psFrase.Substring(iContador-psPalavra.Length);
  end;
end;

end.
