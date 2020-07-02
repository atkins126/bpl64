unit untMinhaInterface;

interface

implementation

uses
   untIMinhaInterface, untInterfaceController;

type
   TMinhaInterface = class(TInterfacedObject, IMinhaInterface)
   public
      function Calcular(const intA: Integer; const intB: Integer): Integer;
   end;

{ TMinhaInterface }

function TMinhaInterface.Calcular(const intA, intB: Integer): Integer;
begin
   Result := intA + intB;
   raise EInterfaceControllerDllInvalid.Create('Error Message');
end;

initialization
   TInterfaceController.RegisterClass(TMinhaInterface);

end.
