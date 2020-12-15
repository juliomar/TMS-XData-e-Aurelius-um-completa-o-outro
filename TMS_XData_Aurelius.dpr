program TMS_XData_Aurelius;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Generics.Collections,
  Aurelius.Drivers.Interfaces,
  Aurelius.Drivers.SQLite,
  Aurelius.Sql.SQLite,
  Sparkle.HttpSys.Server,
  XData.Aurelius.ConnectionPool,
  XData.Server.Module,
  Server.Module in 'Server.Module.pas' {ServerModule: TDataModule},
  Entidades in 'Entidades.pas',
  MyService in 'MyService.pas',
  MyServiceImplementation in 'MyServiceImplementation.pas';

const
  CURLBase = 'http://localhost:2001/tms/xdata';

var
  Servers : TDictionary<String,TServerModule>;

procedure StartServer;
var
  LServerModule : TServerModule;
  i: integer;
begin
  Servers := TObjectDictionary<String, TServerModule>.Create([doOwnsValues]);
  try
    if ParamCount > 0 then
    begin
      for i := 1 to ParamCount do
      begin
        if Servers.ContainsKey(ParamStr(i)) then
          Continue;
        LServerModule := TServerModule.Create(nil);
        LServerModule.StartServer(ParamStr(i));
        Servers.Add(ParamStr(i),LServerModule);
      end;
    end
    else
    begin
      LServerModule := TServerModule.Create(nil);
      LServerModule.StartServer(CURLBase);
      Servers.Add(CURLBase,LServerModule);
    end;


    Writeln('Server Rodando. Pressione Enter to stop');
    Readln;
  finally
    FreeAndNil(Servers);
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := true;
  try
    StartServer;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
