object ServerModule: TServerModule
  OldCreateOrder = False
  Height = 432
  Width = 320
  object SparkleHttpSysDispatcher1: TSparkleHttpSysDispatcher
    Left = 92
    Top = 32
  end
  object XDataServer1: TXDataServer
    Dispatcher = SparkleHttpSysDispatcher1
    Pool = XDataConnectionPool1
    DefaultEntitySetPermissions = [List, Get, Insert, Modify, Delete]
    EntitySetPermissions = <>
    SwaggerOptions.Enabled = True
    SwaggerUIOptions.Enabled = True
    Left = 92
    Top = 108
  end
  object AureliusConnection1: TAureliusConnection
    DriverName = 'SQLite'
    Params.Strings = (
      
        'Database=C:\Users\juliomar\AppData\Roaming\DBeaverData\workspace' +
        '6\.metadata\sample-database-sqlite-1\Chinook.db')
    Left = 100
    Top = 272
  end
  object XDataConnectionPool1: TXDataConnectionPool
    Connection = AureliusConnection1
    Left = 96
    Top = 184
  end
end
