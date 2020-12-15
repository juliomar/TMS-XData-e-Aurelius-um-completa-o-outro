unit MyService;

interface

uses
  XData.Service.Common;

type
  [ServiceContract]
  IMyService = interface(IInvokable)
    ['{38EFC57A-DF94-441D-AB33-BE62E4635C77}']
    [HttpGet] function Sum(A, B: double): double;
    // By default, any service operation responds to (is invoked by) a POST request from the client.
    function EchoString(Value: string): string;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(IMyService));

end.
