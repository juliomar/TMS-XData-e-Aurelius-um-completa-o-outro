unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  XData.Client, Vcl.StdCtrls, Entidades, Data.DB, Aurelius.Bind.BaseDataset,
  Aurelius.Bind.Dataset, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    AureliusDataset1: TAureliusDataset;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LClient : TXDataClient;
  LArtist : TArtist;
begin
  LClient := TXDataClient.Create;
  try
    LClient.Uri := 'http://localhost:2001/tms/xdata';

    AureliusDataset1.SetSourceList( LClient.List<TArtist>);
    AureliusDataset1.Open;
//    LArtist := LClient.Get<TArtist>(277);
//
//    ShowMessage(LArtist.Name);

  finally
    //LClient.Free;
  end;
end;

end.
