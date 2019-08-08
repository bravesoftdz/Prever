unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, uFrase, FMX.Layouts, FMX.Memo;

type
  TPrincipalFrm = class(TForm)
    EdtFrase: TEdit;
    BtnMaiorPalavra: TButton;
    BtnPalindromo: TButton;
    EdtPalavra: TEdit;
    GbxExercicioCombinacoes: TGroupBox;
    BtnCombinacoes: TButton;
    EdtConjuntoNumeros: TEdit;
    EdtNumero: TEdit;
    MmoResultado: TMemo;
    GroupBox1: TGroupBox;
    procedure BtnMaiorPalavraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnPalindromoClick(Sender: TObject);
    procedure BtnCombinacoesClick(Sender: TObject);
  private
    FFrase: TFrase;
    function PegarConjuntoNumeros: TArray<Integer>;
    function PegarNumero: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrincipalFrm: TPrincipalFrm;

implementation

uses
  StrUtils, uCombinacao;

{$R *.fmx}

{$REGION 'Construtor/Destrutor'}
procedure TPrincipalFrm.FormCreate(Sender: TObject);
begin
  FFrase := TFrase.Create;
end;

procedure TPrincipalFrm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FFrase);
end;
{$ENDREGION}

{$REGION 'Ações dos botões'}
procedure TPrincipalFrm.BtnCombinacoesClick(Sender: TObject);
var
  slCombinacoes: TStringList;
begin
  MmoResultado.Lines.Clear;
  slCombinacoes := TStringList.Create;
  try
    if TCombinacao.GerarCombinacoes(PegarNumero, PegarConjuntoNumeros, slCombinacoes) then
      MmoResultado.Lines.Assign(slCombinacoes);
  finally
    FreeAndNil(slCombinacoes);
  end;
end;

procedure TPrincipalFrm.BtnMaiorPalavraClick(Sender: TObject);
begin
  ShowMessage(Format('A maior palavra é "%s"', [FFrase.VerificarMaiorPalavra(EdtFrase.Text)]));
end;

procedure TPrincipalFrm.BtnPalindromoClick(Sender: TObject);
var
  sResultado: string;
begin
  sResultado := FFrase.VerificarPalindromo(EdtPalavra.Text, EdtFrase.Text);

  if sResultado.Length > 0 then
    ShowMessage(Format('Encontrado o palíndromo "%s" da palavra "%s" na lista de palavras: %s"%s"', [
    sResultado, EdtPalavra.Text, sLineBreak, EdtFrase.Text]))
  else
    ShowMessage(Format('Não encontrado o palíndromo da palavra "%s"', [EdtPalavra.Text]));
end;

{$ENDREGION}

{$REGION 'Auxiliares exercício operações'}
function TPrincipalFrm.PegarNumero: Integer;
begin
  Result := StrToIntDef(EdtNumero.Text, 0);
end;

function TPrincipalFrm.PegarConjuntoNumeros: TArray<Integer>;
var
  LArray: TArray<string>;
  iIndice: Integer;
begin
  LArray := string(EdtConjuntoNumeros.Text).Split([',', ', '], None);
  SetLength(Result, Length(LArray));
  for iIndice := Low(Result) to High(Result) do
    Result[iIndice] := StrToIntDef(LArray[iIndice], 0);
end;
{$ENDREGION}

end.
