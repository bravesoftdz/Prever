unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, uFrase, FMX.Layouts;

type
  TPrincipalFrm = class(TForm)
    EdtFrase: TEdit;
    BtnMaiorPalavra: TButton;
    BtnQuantidadePalindromos: TButton;
    EdtPalavra: TEdit;
    procedure BtnMaiorPalavraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnQuantidadePalindromosClick(Sender: TObject);
  private
    FFrase: TFrase;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrincipalFrm: TPrincipalFrm;

implementation

uses
  StrUtils;

{$R *.fmx}

procedure TPrincipalFrm.BtnMaiorPalavraClick(Sender: TObject);
begin
  ShowMessage(Format('A maior palavra é "%s"', [FFrase.VerificarMaiorPalavra(EdtFrase.Text)]));
end;

procedure TPrincipalFrm.BtnQuantidadePalindromosClick(Sender: TObject);
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

procedure TPrincipalFrm.FormCreate(Sender: TObject);
begin
  FFrase := TFrase.Create;
end;

procedure TPrincipalFrm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FFrase);
end;

end.
