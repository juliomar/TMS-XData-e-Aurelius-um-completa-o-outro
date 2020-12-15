unit MyServiceImplementation;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  MyService;

type
  [ServiceImplementation]
  TMyService = class(TInterfacedObject, IMyService)
  private
    function Sum(A, B: double): double;
    function EchoString(Value: string): string;
  end;

implementation

function TMyService.Sum(A, B: double): double;
begin
  Result := A + B;
end;

function TMyService.EchoString(Value: string): string;
begin
  Result := Value;
end;

initialization
  RegisterServiceType(TMyService);

end.
