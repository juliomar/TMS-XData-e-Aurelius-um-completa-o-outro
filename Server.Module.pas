unit Server.Module;

interface

uses
  System.SysUtils, System.Classes, Sparkle.Comp.Server,
  Sparkle.Comp.HttpSysDispatcher, XData.Server.Module,
  Sparkle.HttpServer.Module, Sparkle.HttpServer.Context, XData.Comp.Server,
  Aurelius.Drivers.SQLite, Aurelius.Comp.Connection,
  Aurelius.Drivers.Interfaces, XData.Comp.ConnectionPool;

type
  TServerModule = class(TDataModule)
    SparkleHttpSysDispatcher1: TSparkleHttpSysDispatcher;
    XDataServer1: TXDataServer;
    AureliusConnection1: TAureliusConnection;
    XDataConnectionPool1: TXDataConnectionPool;
  private
    { Private declarations }
  public
    procedure StartServer(ABaseURL : string);
  end;

//var
//  ServerModule: TServerModule;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServerModule }

procedure TServerModule.StartServer(ABaseURL: string);
begin
  XDataServer1.BaseUrl := ABaseURL;

  ///
  SparkleHttpSysDispatcher1.Start;
  Writeln(Format('Modulo rodando "%s"',[ABaseURL]));
end;

end.
