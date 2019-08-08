unit uFrase;

interface

type
  TFrase = class
  private
    const ESPACO = ' ';
  public
    function VerificarMaiorPalavra(psFrase: string): string;
    function VerificarPalindromo(psPalavra, psFrase: string): string;
  end;

implementation

uses
  Classes, SysUtils, StrUtils;

function RemoveAcento(aText : string) : string;
const
  ComAcento = 'àâêôûãõáéíóúçüñıÀÂÊÔÛÃÕÁÉÍÓÚÇÜÑİ';
  SemAcento = 'aaeouaoaeioucunyAAEOUAOAEIOUCUNY';
var
  x: Cardinal;
begin;
  for x := 1 to Length(aText) do
    if (Pos(aText[x], ComAcento) <> 0) then
      aText[x] := SemAcento[ Pos(aText[x], ComAcento) ];
  Result := aText;
end;

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

function TFrase.VerificarPalindromo(psPalavra, psFrase: string): string;
var
  slListapalavras: TStringList;
  iContador: Integer;
begin
  slListapalavras := TStringList.Create;
  try
    slListapalavras.Text := ReverseString(psFrase).Replace(ESPACO, sLineBreak);
    for iContador := 0 to Pred(slListapalavras.Count) do
      if UpperCase(RemoveAcento(psPalavra)) = UpperCase(RemoveAcento(slListapalavras[iContador])) then
      begin
        Result := ReverseString(slListapalavras[iContador]);
        break;
      end;
  finally
    FreeAndNil(slListapalavras);
  end;
end;

end.
