unit uCombinacao;

interface

uses
  System.Classes, System.StrUtils, System.SysUtils, System.Math;

type
  TCombinacao = class
  private type
    TMatriz = TArray<TArray<string>>;
  private
    class function PegarMatriz(const piTamanhoLinha, piTamanhoColuna: Integer): TMatriz;
  public
    class function GerarCombinacoes(const Value: Integer; const Values: TArray<Integer>;
      const pslCombinacoes: TStringList): Boolean;
  end;

implementation

{ TCombinations }

class function TCombinacao.GerarCombinacoes(const Value: Integer; const Values: TArray<Integer>;
  const pslCombinacoes: TStringList): Boolean;
var
  Matrix: TMatriz;
  iLinha, iColuna, Parse, iTamanhoLinha, iTamanhoColuna: Integer;
  sCombinacao: string;
begin
  iTamanhoColuna := Length(Values);
  iTamanhoLinha := iTamanhoColuna * iTamanhoColuna;

  Matrix := PegarMatriz(iTamanhoLinha, iTamanhoColuna);

  Parse := 0;
  for iLinha := 0 to Pred(iTamanhoLinha) do
  begin
    sCombinacao := string.Empty;
    for iColuna := 0 to Pred(iTamanhoColuna) do
    begin
      if iColuna = 0 then
      begin
        if Matrix[iLinha][iColuna] = '+' then
          Parse := + Values[iColuna]
        else
          Parse := - Values[iColuna];
      end
      else
      begin
        if Matrix[iLinha][iColuna] = '+' then
          Parse := Parse + Values[iColuna]
        else
          Parse := Parse - Values[iColuna];
      end;
      sCombinacao := sCombinacao + Matrix[iLinha][iColuna] + Values[iColuna].ToString
    end;

    if Parse = Value then
      pslCombinacoes.Add(sCombinacao);
  end;

  Result := pslCombinacoes.Count > 0;
end;

class function TCombinacao.PegarMatriz(const piTamanhoLinha, piTamanhoColuna: Integer): TMatriz;
var
  iLinha, iColuna: Integer;
  Value: Integer;
begin
  SetLength(Result, piTamanhoLinha, piTamanhoColuna);
  for iLinha := 0 to Pred(piTamanhoLinha) do
    for iColuna := Pred(piTamanhoColuna) downto 0 do
    begin
      Value := Trunc(iLinha /(Trunc(Power(2, iColuna)))) mod 2;
      Result[iLinha][iColuna] := IfThen(Value = 0, '+', '-');
    end;
end;

end.
