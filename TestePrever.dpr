program TestePrever;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {PrincipalFrm},
  uFrase in 'uFrase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipalFrm, PrincipalFrm);
  Application.Run;
end.
