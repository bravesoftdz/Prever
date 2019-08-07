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
    BtnQuantidadePalindromos: TButton;
    EdtPalavra: TEdit;
    Memo1: TMemo;
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

{$R *.fmx}

procedure TPrincipalFrm.BtnMaiorPalavraClick(Sender: TObject);
begin
  ShowMessage(Format('A maior palavra é "%s"', [FFrase.VerificarMaiorPalavra(EdtFrase.Text)]));
end;

procedure TPrincipalFrm.BtnQuantidadePalindromosClick(Sender: TObject);
var
  I: Integer;
begin
{  ShowMessage(Format('Palíndromos da palavra "%s": %s', [
    EdtPalavra.Text,
    FFrase.VerificarQuantidadePalindromos(EdtPalavra.Text, EdtFrase.Text)]));}

  Memo1.Lines.Add(FFrase.VerificarQuantidadePalindromos(EdtPalavra.Text, EdtFrase.Text));
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
