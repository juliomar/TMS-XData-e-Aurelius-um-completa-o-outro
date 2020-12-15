unit Entidades;

interface

uses
  SysUtils, 
  Generics.Collections, 
  Aurelius.Mapping.Attributes, 
  Aurelius.Types.Blob, 
  Aurelius.Types.DynamicProperties, 
  Aurelius.Types.Nullable, 
  Aurelius.Types.Proxy, 
  Aurelius.Criteria.Dictionary;

type
  TAlbum = class;
  TArtist = class;
  TCustomer = class;
  TEmployee = class;
  TGenre = class;
  TInvoice = class;
  TInvoiceLine = class;
  TMediaType = class;
  TPlaylist = class;
  TPlaylistTrack = class;
  TTrack = class;
  TUsuario = class;
  TAlbumTableDictionary = class;
  TArtistTableDictionary = class;
  TCustomerTableDictionary = class;
  TEmployeeTableDictionary = class;
  TGenreTableDictionary = class;
  TInvoiceTableDictionary = class;
  TInvoiceLineTableDictionary = class;
  TMediaTypeTableDictionary = class;
  TPlaylistTableDictionary = class;
  TPlaylistTrackTableDictionary = class;
  TTrackTableDictionary = class;
  TUsuarioTableDictionary = class;
  
  [Entity]
  [Table('Album')]
  [UniqueKey('AlbumId')]
  [Id('FAlbumId', TIdGenerator.None)]
  TAlbum = class
  private
    [Column('AlbumId', [TColumnProp.Required])]
    FAlbumId: Integer;
    
    [Column('Title', [TColumnProp.Required], 160)]
    FTitle: string;
    
    [Column('Column1', [TColumnProp.Lazy])]
    FColumn1: TBlob;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('ArtistId', [TColumnProp.Required], 'ArtistId')]
    FArtistId: Proxy<TArtist>;
    function GetArtistId: TArtist;
    procedure SetArtistId(const Value: TArtist);
  public
    property AlbumId: Integer read FAlbumId write FAlbumId;
    property Title: string read FTitle write FTitle;
    property Column1: TBlob read FColumn1 write FColumn1;
    property ArtistId: TArtist read GetArtistId write SetArtistId;
  end;
  
  [Entity]
  [Table('Artist')]
  [UniqueKey('ArtistId')]
  [Id('FArtistId', TIdGenerator.IdentityOrSequence)]
  TArtist = class
  private
    [Column('ArtistId', [TColumnProp.Required])]
    FArtistId: Integer;

    [Column('Name', [], 120)]
    FName: Nullable<string>;
  public
    property ArtistId: Integer read FArtistId write FArtistId;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('Customer')]
  [UniqueKey('CustomerId')]
  [Id('FCustomerId', TIdGenerator.None)]
  TCustomer = class
  private
    [Column('CustomerId', [TColumnProp.Required])]
    FCustomerId: Integer;
    
    [Column('FirstName', [TColumnProp.Required], 40)]
    FFirstName: string;
    
    [Column('LastName', [TColumnProp.Required], 20)]
    FLastName: string;
    
    [Column('Company', [], 80)]
    FCompany: Nullable<string>;
    
    [Column('Address', [], 70)]
    FAddress: Nullable<string>;
    
    [Column('City', [], 40)]
    FCity: Nullable<string>;
    
    [Column('State', [], 40)]
    FState: Nullable<string>;
    
    [Column('Country', [], 40)]
    FCountry: Nullable<string>;
    
    [Column('PostalCode', [], 10)]
    FPostalCode: Nullable<string>;
    
    [Column('Phone', [], 24)]
    FPhone: Nullable<string>;
    
    [Column('Fax', [], 24)]
    FFax: Nullable<string>;
    
    [Column('Email', [TColumnProp.Required], 60)]
    FEmail: string;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('SupportRepId', [], 'EmployeeId')]
    FSupportRepId: Proxy<TEmployee>;
    function GetSupportRepId: TEmployee;
    procedure SetSupportRepId(const Value: TEmployee);
  public
    property CustomerId: Integer read FCustomerId write FCustomerId;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Company: Nullable<string> read FCompany write FCompany;
    property Address: Nullable<string> read FAddress write FAddress;
    property City: Nullable<string> read FCity write FCity;
    property State: Nullable<string> read FState write FState;
    property Country: Nullable<string> read FCountry write FCountry;
    property PostalCode: Nullable<string> read FPostalCode write FPostalCode;
    property Phone: Nullable<string> read FPhone write FPhone;
    property Fax: Nullable<string> read FFax write FFax;
    property Email: string read FEmail write FEmail;
    property SupportRepId: TEmployee read GetSupportRepId write SetSupportRepId;
  end;
  
  [Entity]
  [Table('Employee')]
  [UniqueKey('EmployeeId')]
  [Id('FEmployeeId', TIdGenerator.None)]
  TEmployee = class
  private
    [Column('EmployeeId', [TColumnProp.Required])]
    FEmployeeId: Integer;
    
    [Column('LastName', [TColumnProp.Required], 20)]
    FLastName: string;
    
    [Column('FirstName', [TColumnProp.Required], 20)]
    FFirstName: string;
    
    [Column('Title', [], 30)]
    FTitle: Nullable<string>;
    
    [Column('BirthDate', [])]
    FBirthDate: Nullable<TDateTime>;
    
    [Column('HireDate', [])]
    FHireDate: Nullable<TDateTime>;
    
    [Column('Address', [], 70)]
    FAddress: Nullable<string>;
    
    [Column('City', [], 40)]
    FCity: Nullable<string>;
    
    [Column('State', [], 40)]
    FState: Nullable<string>;
    
    [Column('Country', [], 40)]
    FCountry: Nullable<string>;
    
    [Column('PostalCode', [], 10)]
    FPostalCode: Nullable<string>;
    
    [Column('Phone', [], 24)]
    FPhone: Nullable<string>;
    
    [Column('Fax', [], 24)]
    FFax: Nullable<string>;
    
    [Column('Email', [], 60)]
    FEmail: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('ReportsTo', [], 'EmployeeId')]
    FReportsTo: Proxy<TEmployee>;
    function GetReportsTo: TEmployee;
    procedure SetReportsTo(const Value: TEmployee);
  public
    property EmployeeId: Integer read FEmployeeId write FEmployeeId;
    property LastName: string read FLastName write FLastName;
    property FirstName: string read FFirstName write FFirstName;
    property Title: Nullable<string> read FTitle write FTitle;
    property BirthDate: Nullable<TDateTime> read FBirthDate write FBirthDate;
    property HireDate: Nullable<TDateTime> read FHireDate write FHireDate;
    property Address: Nullable<string> read FAddress write FAddress;
    property City: Nullable<string> read FCity write FCity;
    property State: Nullable<string> read FState write FState;
    property Country: Nullable<string> read FCountry write FCountry;
    property PostalCode: Nullable<string> read FPostalCode write FPostalCode;
    property Phone: Nullable<string> read FPhone write FPhone;
    property Fax: Nullable<string> read FFax write FFax;
    property Email: Nullable<string> read FEmail write FEmail;
    property ReportsTo: TEmployee read GetReportsTo write SetReportsTo;
  end;
  
  [Entity]
  [Table('Genre')]
  [UniqueKey('GenreId')]
  [Id('FGenreId', TIdGenerator.None)]
  TGenre = class
  private
    [Column('GenreId', [TColumnProp.Required])]
    FGenreId: Integer;
    
    [Column('Name', [], 120)]
    FName: Nullable<string>;
  public
    property GenreId: Integer read FGenreId write FGenreId;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('Invoice')]
  [UniqueKey('InvoiceId')]
  [Id('FInvoiceId', TIdGenerator.None)]
  TInvoice = class
  private
    [Column('InvoiceId', [TColumnProp.Required])]
    FInvoiceId: Integer;
    
    [Column('InvoiceDate', [TColumnProp.Required])]
    FInvoiceDate: TDateTime;
    
    [Column('BillingAddress', [], 70)]
    FBillingAddress: Nullable<string>;
    
    [Column('BillingCity', [], 40)]
    FBillingCity: Nullable<string>;
    
    [Column('BillingState', [], 40)]
    FBillingState: Nullable<string>;
    
    [Column('BillingCountry', [], 40)]
    FBillingCountry: Nullable<string>;
    
    [Column('BillingPostalCode', [], 10)]
    FBillingPostalCode: Nullable<string>;
    
    [Column('Total', [TColumnProp.Required], 10, 2)]
    FTotal: Double;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CustomerId', [TColumnProp.Required], 'CustomerId')]
    FCustomerId: Proxy<TCustomer>;
    function GetCustomerId: TCustomer;
    procedure SetCustomerId(const Value: TCustomer);
  public
    property InvoiceId: Integer read FInvoiceId write FInvoiceId;
    property InvoiceDate: TDateTime read FInvoiceDate write FInvoiceDate;
    property BillingAddress: Nullable<string> read FBillingAddress write FBillingAddress;
    property BillingCity: Nullable<string> read FBillingCity write FBillingCity;
    property BillingState: Nullable<string> read FBillingState write FBillingState;
    property BillingCountry: Nullable<string> read FBillingCountry write FBillingCountry;
    property BillingPostalCode: Nullable<string> read FBillingPostalCode write FBillingPostalCode;
    property Total: Double read FTotal write FTotal;
    property CustomerId: TCustomer read GetCustomerId write SetCustomerId;
  end;
  
  [Entity]
  [Table('InvoiceLine')]
  [UniqueKey('InvoiceLineId')]
  [Id('FInvoiceLineId', TIdGenerator.None)]
  TInvoiceLine = class
  private
    [Column('InvoiceLineId', [TColumnProp.Required])]
    FInvoiceLineId: Integer;
    
    [Column('UnitPrice', [TColumnProp.Required], 10, 2)]
    FUnitPrice: Double;
    
    [Column('Quantity', [TColumnProp.Required])]
    FQuantity: Integer;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('TrackId', [TColumnProp.Required], 'TrackId')]
    FTrackId: Proxy<TTrack>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('InvoiceId', [TColumnProp.Required], 'InvoiceId')]
    FInvoiceId: Proxy<TInvoice>;
    function GetTrackId: TTrack;
    procedure SetTrackId(const Value: TTrack);
    function GetInvoiceId: TInvoice;
    procedure SetInvoiceId(const Value: TInvoice);
  public
    property InvoiceLineId: Integer read FInvoiceLineId write FInvoiceLineId;
    property UnitPrice: Double read FUnitPrice write FUnitPrice;
    property Quantity: Integer read FQuantity write FQuantity;
    property TrackId: TTrack read GetTrackId write SetTrackId;
    property InvoiceId: TInvoice read GetInvoiceId write SetInvoiceId;
  end;
  
  [Entity]
  [Table('MediaType')]
  [UniqueKey('MediaTypeId')]
  [Id('FMediaTypeId', TIdGenerator.None)]
  TMediaType = class
  private
    [Column('MediaTypeId', [TColumnProp.Required])]
    FMediaTypeId: Integer;
    
    [Column('Name', [], 120)]
    FName: Nullable<string>;
  public
    property MediaTypeId: Integer read FMediaTypeId write FMediaTypeId;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('Playlist')]
  [UniqueKey('PlaylistId')]
  [Id('FPlaylistId', TIdGenerator.None)]
  TPlaylist = class
  private
    [Column('PlaylistId', [TColumnProp.Required])]
    FPlaylistId: Integer;
    
    [Column('Name', [], 120)]
    FName: Nullable<string>;
  public
    property PlaylistId: Integer read FPlaylistId write FPlaylistId;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('PlaylistTrack')]
  [UniqueKey('PlaylistId, TrackId')]
  [Id('FPlaylistId', TIdGenerator.None)]
  [Id('FTrackId', TIdGenerator.None)]
  TPlaylistTrack = class
  private
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('TrackId', [TColumnProp.Required], 'TrackId')]
    FTrackId: Proxy<TTrack>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('PlaylistId', [TColumnProp.Required], 'PlaylistId')]
    FPlaylistId: Proxy<TPlaylist>;
    function GetTrackId: TTrack;
    procedure SetTrackId(const Value: TTrack);
    function GetPlaylistId: TPlaylist;
    procedure SetPlaylistId(const Value: TPlaylist);
  public
    property TrackId: TTrack read GetTrackId write SetTrackId;
    property PlaylistId: TPlaylist read GetPlaylistId write SetPlaylistId;
  end;
  
  [Entity]
  [Table('Track')]
  [UniqueKey('TrackId')]
  [Id('FTrackId', TIdGenerator.None)]
  TTrack = class
  private
    [Column('TrackId', [TColumnProp.Required])]
    FTrackId: Integer;
    
    [Column('Name', [TColumnProp.Required], 200)]
    FName: string;
    
    [Column('Composer', [], 220)]
    FComposer: Nullable<string>;
    
    [Column('Milliseconds', [TColumnProp.Required])]
    FMilliseconds: Integer;
    
    [Column('Bytes', [])]
    FBytes: Nullable<Integer>;
    
    [Column('UnitPrice', [TColumnProp.Required], 10, 2)]
    FUnitPrice: Double;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('MediaTypeId', [TColumnProp.Required], 'MediaTypeId')]
    FMediaTypeId: Proxy<TMediaType>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('GenreId', [], 'GenreId')]
    FGenreId: Proxy<TGenre>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('AlbumId', [], 'AlbumId')]
    FAlbumId: Proxy<TAlbum>;
    function GetMediaTypeId: TMediaType;
    procedure SetMediaTypeId(const Value: TMediaType);
    function GetGenreId: TGenre;
    procedure SetGenreId(const Value: TGenre);
    function GetAlbumId: TAlbum;
    procedure SetAlbumId(const Value: TAlbum);
  public
    property TrackId: Integer read FTrackId write FTrackId;
    property Name: string read FName write FName;
    property Composer: Nullable<string> read FComposer write FComposer;
    property Milliseconds: Integer read FMilliseconds write FMilliseconds;
    property Bytes: Nullable<Integer> read FBytes write FBytes;
    property UnitPrice: Double read FUnitPrice write FUnitPrice;
    property MediaTypeId: TMediaType read GetMediaTypeId write SetMediaTypeId;
    property GenreId: TGenre read GetGenreId write SetGenreId;
    property AlbumId: TAlbum read GetAlbumId write SetAlbumId;
  end;
  
  [Entity]
  [Table('Usuario')]
  [Id('Fid', TIdGenerator.IdentityOrSequence)]
  TUsuario = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    Fid: Integer;
    
    [Column('usuario', [TColumnProp.Required], 15)]
    Fusuario: string;
    
    [Column('senha', [], 32)]
    Fsenha: Nullable<string>;
  public
    property id: Integer read Fid write Fid;
    property usuario: string read Fusuario write Fusuario;
    property senha: Nullable<string> read Fsenha write Fsenha;
  end;
  
  TDicDictionary = class
  private
    FAlbum: TAlbumTableDictionary;
    FArtist: TArtistTableDictionary;
    FCustomer: TCustomerTableDictionary;
    FEmployee: TEmployeeTableDictionary;
    FGenre: TGenreTableDictionary;
    FInvoice: TInvoiceTableDictionary;
    FInvoiceLine: TInvoiceLineTableDictionary;
    FMediaType: TMediaTypeTableDictionary;
    FPlaylist: TPlaylistTableDictionary;
    FPlaylistTrack: TPlaylistTrackTableDictionary;
    FTrack: TTrackTableDictionary;
    FUsuario: TUsuarioTableDictionary;
    function GetAlbum: TAlbumTableDictionary;
    function GetArtist: TArtistTableDictionary;
    function GetCustomer: TCustomerTableDictionary;
    function GetEmployee: TEmployeeTableDictionary;
    function GetGenre: TGenreTableDictionary;
    function GetInvoice: TInvoiceTableDictionary;
    function GetInvoiceLine: TInvoiceLineTableDictionary;
    function GetMediaType: TMediaTypeTableDictionary;
    function GetPlaylist: TPlaylistTableDictionary;
    function GetPlaylistTrack: TPlaylistTrackTableDictionary;
    function GetTrack: TTrackTableDictionary;
    function GetUsuario: TUsuarioTableDictionary;
  public
    destructor Destroy; override;
    property Album: TAlbumTableDictionary read GetAlbum;
    property Artist: TArtistTableDictionary read GetArtist;
    property Customer: TCustomerTableDictionary read GetCustomer;
    property Employee: TEmployeeTableDictionary read GetEmployee;
    property Genre: TGenreTableDictionary read GetGenre;
    property Invoice: TInvoiceTableDictionary read GetInvoice;
    property InvoiceLine: TInvoiceLineTableDictionary read GetInvoiceLine;
    property MediaType: TMediaTypeTableDictionary read GetMediaType;
    property Playlist: TPlaylistTableDictionary read GetPlaylist;
    property PlaylistTrack: TPlaylistTrackTableDictionary read GetPlaylistTrack;
    property Track: TTrackTableDictionary read GetTrack;
    property Usuario: TUsuarioTableDictionary read GetUsuario;
  end;
  
  TAlbumTableDictionary = class
  private
    FAlbumId: TDictionaryAttribute;
    FTitle: TDictionaryAttribute;
    FColumn1: TDictionaryAttribute;
    FArtistId: TDictionaryAssociation;
  public
    constructor Create;
    property AlbumId: TDictionaryAttribute read FAlbumId;
    property Title: TDictionaryAttribute read FTitle;
    property Column1: TDictionaryAttribute read FColumn1;
    property ArtistId: TDictionaryAssociation read FArtistId;
  end;
  
  TArtistTableDictionary = class
  private
    FArtistId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property ArtistId: TDictionaryAttribute read FArtistId;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TCustomerTableDictionary = class
  private
    FCustomerId: TDictionaryAttribute;
    FFirstName: TDictionaryAttribute;
    FLastName: TDictionaryAttribute;
    FCompany: TDictionaryAttribute;
    FAddress: TDictionaryAttribute;
    FCity: TDictionaryAttribute;
    FState: TDictionaryAttribute;
    FCountry: TDictionaryAttribute;
    FPostalCode: TDictionaryAttribute;
    FPhone: TDictionaryAttribute;
    FFax: TDictionaryAttribute;
    FEmail: TDictionaryAttribute;
    FSupportRepId: TDictionaryAssociation;
  public
    constructor Create;
    property CustomerId: TDictionaryAttribute read FCustomerId;
    property FirstName: TDictionaryAttribute read FFirstName;
    property LastName: TDictionaryAttribute read FLastName;
    property Company: TDictionaryAttribute read FCompany;
    property Address: TDictionaryAttribute read FAddress;
    property City: TDictionaryAttribute read FCity;
    property State: TDictionaryAttribute read FState;
    property Country: TDictionaryAttribute read FCountry;
    property PostalCode: TDictionaryAttribute read FPostalCode;
    property Phone: TDictionaryAttribute read FPhone;
    property Fax: TDictionaryAttribute read FFax;
    property Email: TDictionaryAttribute read FEmail;
    property SupportRepId: TDictionaryAssociation read FSupportRepId;
  end;
  
  TEmployeeTableDictionary = class
  private
    FEmployeeId: TDictionaryAttribute;
    FLastName: TDictionaryAttribute;
    FFirstName: TDictionaryAttribute;
    FTitle: TDictionaryAttribute;
    FBirthDate: TDictionaryAttribute;
    FHireDate: TDictionaryAttribute;
    FAddress: TDictionaryAttribute;
    FCity: TDictionaryAttribute;
    FState: TDictionaryAttribute;
    FCountry: TDictionaryAttribute;
    FPostalCode: TDictionaryAttribute;
    FPhone: TDictionaryAttribute;
    FFax: TDictionaryAttribute;
    FEmail: TDictionaryAttribute;
    FReportsTo: TDictionaryAssociation;
  public
    constructor Create;
    property EmployeeId: TDictionaryAttribute read FEmployeeId;
    property LastName: TDictionaryAttribute read FLastName;
    property FirstName: TDictionaryAttribute read FFirstName;
    property Title: TDictionaryAttribute read FTitle;
    property BirthDate: TDictionaryAttribute read FBirthDate;
    property HireDate: TDictionaryAttribute read FHireDate;
    property Address: TDictionaryAttribute read FAddress;
    property City: TDictionaryAttribute read FCity;
    property State: TDictionaryAttribute read FState;
    property Country: TDictionaryAttribute read FCountry;
    property PostalCode: TDictionaryAttribute read FPostalCode;
    property Phone: TDictionaryAttribute read FPhone;
    property Fax: TDictionaryAttribute read FFax;
    property Email: TDictionaryAttribute read FEmail;
    property ReportsTo: TDictionaryAssociation read FReportsTo;
  end;
  
  TGenreTableDictionary = class
  private
    FGenreId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property GenreId: TDictionaryAttribute read FGenreId;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TInvoiceTableDictionary = class
  private
    FInvoiceId: TDictionaryAttribute;
    FInvoiceDate: TDictionaryAttribute;
    FBillingAddress: TDictionaryAttribute;
    FBillingCity: TDictionaryAttribute;
    FBillingState: TDictionaryAttribute;
    FBillingCountry: TDictionaryAttribute;
    FBillingPostalCode: TDictionaryAttribute;
    FTotal: TDictionaryAttribute;
    FCustomerId: TDictionaryAssociation;
  public
    constructor Create;
    property InvoiceId: TDictionaryAttribute read FInvoiceId;
    property InvoiceDate: TDictionaryAttribute read FInvoiceDate;
    property BillingAddress: TDictionaryAttribute read FBillingAddress;
    property BillingCity: TDictionaryAttribute read FBillingCity;
    property BillingState: TDictionaryAttribute read FBillingState;
    property BillingCountry: TDictionaryAttribute read FBillingCountry;
    property BillingPostalCode: TDictionaryAttribute read FBillingPostalCode;
    property Total: TDictionaryAttribute read FTotal;
    property CustomerId: TDictionaryAssociation read FCustomerId;
  end;
  
  TInvoiceLineTableDictionary = class
  private
    FInvoiceLineId: TDictionaryAttribute;
    FUnitPrice: TDictionaryAttribute;
    FQuantity: TDictionaryAttribute;
    FTrackId: TDictionaryAssociation;
    FInvoiceId: TDictionaryAssociation;
  public
    constructor Create;
    property InvoiceLineId: TDictionaryAttribute read FInvoiceLineId;
    property UnitPrice: TDictionaryAttribute read FUnitPrice;
    property Quantity: TDictionaryAttribute read FQuantity;
    property TrackId: TDictionaryAssociation read FTrackId;
    property InvoiceId: TDictionaryAssociation read FInvoiceId;
  end;
  
  TMediaTypeTableDictionary = class
  private
    FMediaTypeId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property MediaTypeId: TDictionaryAttribute read FMediaTypeId;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TPlaylistTableDictionary = class
  private
    FPlaylistId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property PlaylistId: TDictionaryAttribute read FPlaylistId;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TPlaylistTrackTableDictionary = class
  private
    FTrackId: TDictionaryAssociation;
    FPlaylistId: TDictionaryAssociation;
  public
    constructor Create;
    property TrackId: TDictionaryAssociation read FTrackId;
    property PlaylistId: TDictionaryAssociation read FPlaylistId;
  end;
  
  TTrackTableDictionary = class
  private
    FTrackId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
    FComposer: TDictionaryAttribute;
    FMilliseconds: TDictionaryAttribute;
    FBytes: TDictionaryAttribute;
    FUnitPrice: TDictionaryAttribute;
    FMediaTypeId: TDictionaryAssociation;
    FGenreId: TDictionaryAssociation;
    FAlbumId: TDictionaryAssociation;
  public
    constructor Create;
    property TrackId: TDictionaryAttribute read FTrackId;
    property Name: TDictionaryAttribute read FName;
    property Composer: TDictionaryAttribute read FComposer;
    property Milliseconds: TDictionaryAttribute read FMilliseconds;
    property Bytes: TDictionaryAttribute read FBytes;
    property UnitPrice: TDictionaryAttribute read FUnitPrice;
    property MediaTypeId: TDictionaryAssociation read FMediaTypeId;
    property GenreId: TDictionaryAssociation read FGenreId;
    property AlbumId: TDictionaryAssociation read FAlbumId;
  end;
  
  TUsuarioTableDictionary = class
  private
    Fid: TDictionaryAttribute;
    Fusuario: TDictionaryAttribute;
    Fsenha: TDictionaryAttribute;
  public
    constructor Create;
    property id: TDictionaryAttribute read Fid;
    property usuario: TDictionaryAttribute read Fusuario;
    property senha: TDictionaryAttribute read Fsenha;
  end;
  
function Dic: TDicDictionary;

implementation

var
  __Dic: TDicDictionary;

function Dic: TDicDictionary;
begin
  if __Dic = nil then __Dic := TDicDictionary.Create;
  result := __Dic
end;

{ TAlbum }

function TAlbum.GetArtistId: TArtist;
begin
  result := FArtistId.Value;
end;

procedure TAlbum.SetArtistId(const Value: TArtist);
begin
  FArtistId.Value := Value;
end;

{ TCustomer }

function TCustomer.GetSupportRepId: TEmployee;
begin
  result := FSupportRepId.Value;
end;

procedure TCustomer.SetSupportRepId(const Value: TEmployee);
begin
  FSupportRepId.Value := Value;
end;

{ TEmployee }

function TEmployee.GetReportsTo: TEmployee;
begin
  result := FReportsTo.Value;
end;

procedure TEmployee.SetReportsTo(const Value: TEmployee);
begin
  FReportsTo.Value := Value;
end;

{ TInvoice }

function TInvoice.GetCustomerId: TCustomer;
begin
  result := FCustomerId.Value;
end;

procedure TInvoice.SetCustomerId(const Value: TCustomer);
begin
  FCustomerId.Value := Value;
end;

{ TInvoiceLine }

function TInvoiceLine.GetTrackId: TTrack;
begin
  result := FTrackId.Value;
end;

procedure TInvoiceLine.SetTrackId(const Value: TTrack);
begin
  FTrackId.Value := Value;
end;

function TInvoiceLine.GetInvoiceId: TInvoice;
begin
  result := FInvoiceId.Value;
end;

procedure TInvoiceLine.SetInvoiceId(const Value: TInvoice);
begin
  FInvoiceId.Value := Value;
end;

{ TPlaylistTrack }

function TPlaylistTrack.GetTrackId: TTrack;
begin
  result := FTrackId.Value;
end;

procedure TPlaylistTrack.SetTrackId(const Value: TTrack);
begin
  FTrackId.Value := Value;
end;

function TPlaylistTrack.GetPlaylistId: TPlaylist;
begin
  result := FPlaylistId.Value;
end;

procedure TPlaylistTrack.SetPlaylistId(const Value: TPlaylist);
begin
  FPlaylistId.Value := Value;
end;

{ TTrack }

function TTrack.GetMediaTypeId: TMediaType;
begin
  result := FMediaTypeId.Value;
end;

procedure TTrack.SetMediaTypeId(const Value: TMediaType);
begin
  FMediaTypeId.Value := Value;
end;

function TTrack.GetGenreId: TGenre;
begin
  result := FGenreId.Value;
end;

procedure TTrack.SetGenreId(const Value: TGenre);
begin
  FGenreId.Value := Value;
end;

function TTrack.GetAlbumId: TAlbum;
begin
  result := FAlbumId.Value;
end;

procedure TTrack.SetAlbumId(const Value: TAlbum);
begin
  FAlbumId.Value := Value;
end;

{ TDicDictionary }

destructor TDicDictionary.Destroy;
begin
  if FUsuario <> nil then FUsuario.Free;
  if FTrack <> nil then FTrack.Free;
  if FPlaylistTrack <> nil then FPlaylistTrack.Free;
  if FPlaylist <> nil then FPlaylist.Free;
  if FMediaType <> nil then FMediaType.Free;
  if FInvoiceLine <> nil then FInvoiceLine.Free;
  if FInvoice <> nil then FInvoice.Free;
  if FGenre <> nil then FGenre.Free;
  if FEmployee <> nil then FEmployee.Free;
  if FCustomer <> nil then FCustomer.Free;
  if FArtist <> nil then FArtist.Free;
  if FAlbum <> nil then FAlbum.Free;
  inherited;
end;

function TDicDictionary.GetAlbum: TAlbumTableDictionary;
begin
  if FAlbum = nil then FAlbum := TAlbumTableDictionary.Create;
  result := FAlbum;
end;

function TDicDictionary.GetArtist: TArtistTableDictionary;
begin
  if FArtist = nil then FArtist := TArtistTableDictionary.Create;
  result := FArtist;
end;

function TDicDictionary.GetCustomer: TCustomerTableDictionary;
begin
  if FCustomer = nil then FCustomer := TCustomerTableDictionary.Create;
  result := FCustomer;
end;

function TDicDictionary.GetEmployee: TEmployeeTableDictionary;
begin
  if FEmployee = nil then FEmployee := TEmployeeTableDictionary.Create;
  result := FEmployee;
end;

function TDicDictionary.GetGenre: TGenreTableDictionary;
begin
  if FGenre = nil then FGenre := TGenreTableDictionary.Create;
  result := FGenre;
end;

function TDicDictionary.GetInvoice: TInvoiceTableDictionary;
begin
  if FInvoice = nil then FInvoice := TInvoiceTableDictionary.Create;
  result := FInvoice;
end;

function TDicDictionary.GetInvoiceLine: TInvoiceLineTableDictionary;
begin
  if FInvoiceLine = nil then FInvoiceLine := TInvoiceLineTableDictionary.Create;
  result := FInvoiceLine;
end;

function TDicDictionary.GetMediaType: TMediaTypeTableDictionary;
begin
  if FMediaType = nil then FMediaType := TMediaTypeTableDictionary.Create;
  result := FMediaType;
end;

function TDicDictionary.GetPlaylist: TPlaylistTableDictionary;
begin
  if FPlaylist = nil then FPlaylist := TPlaylistTableDictionary.Create;
  result := FPlaylist;
end;

function TDicDictionary.GetPlaylistTrack: TPlaylistTrackTableDictionary;
begin
  if FPlaylistTrack = nil then FPlaylistTrack := TPlaylistTrackTableDictionary.Create;
  result := FPlaylistTrack;
end;

function TDicDictionary.GetTrack: TTrackTableDictionary;
begin
  if FTrack = nil then FTrack := TTrackTableDictionary.Create;
  result := FTrack;
end;

function TDicDictionary.GetUsuario: TUsuarioTableDictionary;
begin
  if FUsuario = nil then FUsuario := TUsuarioTableDictionary.Create;
  result := FUsuario;
end;

{ TAlbumTableDictionary }

constructor TAlbumTableDictionary.Create;
begin
  inherited;
  FAlbumId := TDictionaryAttribute.Create('AlbumId');
  FTitle := TDictionaryAttribute.Create('Title');
  FColumn1 := TDictionaryAttribute.Create('Column1');
  FArtistId := TDictionaryAssociation.Create('ArtistId');
end;

{ TArtistTableDictionary }

constructor TArtistTableDictionary.Create;
begin
  inherited;
  FArtistId := TDictionaryAttribute.Create('ArtistId');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TCustomerTableDictionary }

constructor TCustomerTableDictionary.Create;
begin
  inherited;
  FCustomerId := TDictionaryAttribute.Create('CustomerId');
  FFirstName := TDictionaryAttribute.Create('FirstName');
  FLastName := TDictionaryAttribute.Create('LastName');
  FCompany := TDictionaryAttribute.Create('Company');
  FAddress := TDictionaryAttribute.Create('Address');
  FCity := TDictionaryAttribute.Create('City');
  FState := TDictionaryAttribute.Create('State');
  FCountry := TDictionaryAttribute.Create('Country');
  FPostalCode := TDictionaryAttribute.Create('PostalCode');
  FPhone := TDictionaryAttribute.Create('Phone');
  FFax := TDictionaryAttribute.Create('Fax');
  FEmail := TDictionaryAttribute.Create('Email');
  FSupportRepId := TDictionaryAssociation.Create('SupportRepId');
end;

{ TEmployeeTableDictionary }

constructor TEmployeeTableDictionary.Create;
begin
  inherited;
  FEmployeeId := TDictionaryAttribute.Create('EmployeeId');
  FLastName := TDictionaryAttribute.Create('LastName');
  FFirstName := TDictionaryAttribute.Create('FirstName');
  FTitle := TDictionaryAttribute.Create('Title');
  FBirthDate := TDictionaryAttribute.Create('BirthDate');
  FHireDate := TDictionaryAttribute.Create('HireDate');
  FAddress := TDictionaryAttribute.Create('Address');
  FCity := TDictionaryAttribute.Create('City');
  FState := TDictionaryAttribute.Create('State');
  FCountry := TDictionaryAttribute.Create('Country');
  FPostalCode := TDictionaryAttribute.Create('PostalCode');
  FPhone := TDictionaryAttribute.Create('Phone');
  FFax := TDictionaryAttribute.Create('Fax');
  FEmail := TDictionaryAttribute.Create('Email');
  FReportsTo := TDictionaryAssociation.Create('ReportsTo');
end;

{ TGenreTableDictionary }

constructor TGenreTableDictionary.Create;
begin
  inherited;
  FGenreId := TDictionaryAttribute.Create('GenreId');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TInvoiceTableDictionary }

constructor TInvoiceTableDictionary.Create;
begin
  inherited;
  FInvoiceId := TDictionaryAttribute.Create('InvoiceId');
  FInvoiceDate := TDictionaryAttribute.Create('InvoiceDate');
  FBillingAddress := TDictionaryAttribute.Create('BillingAddress');
  FBillingCity := TDictionaryAttribute.Create('BillingCity');
  FBillingState := TDictionaryAttribute.Create('BillingState');
  FBillingCountry := TDictionaryAttribute.Create('BillingCountry');
  FBillingPostalCode := TDictionaryAttribute.Create('BillingPostalCode');
  FTotal := TDictionaryAttribute.Create('Total');
  FCustomerId := TDictionaryAssociation.Create('CustomerId');
end;

{ TInvoiceLineTableDictionary }

constructor TInvoiceLineTableDictionary.Create;
begin
  inherited;
  FInvoiceLineId := TDictionaryAttribute.Create('InvoiceLineId');
  FUnitPrice := TDictionaryAttribute.Create('UnitPrice');
  FQuantity := TDictionaryAttribute.Create('Quantity');
  FTrackId := TDictionaryAssociation.Create('TrackId');
  FInvoiceId := TDictionaryAssociation.Create('InvoiceId');
end;

{ TMediaTypeTableDictionary }

constructor TMediaTypeTableDictionary.Create;
begin
  inherited;
  FMediaTypeId := TDictionaryAttribute.Create('MediaTypeId');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TPlaylistTableDictionary }

constructor TPlaylistTableDictionary.Create;
begin
  inherited;
  FPlaylistId := TDictionaryAttribute.Create('PlaylistId');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TPlaylistTrackTableDictionary }

constructor TPlaylistTrackTableDictionary.Create;
begin
  inherited;
  FTrackId := TDictionaryAssociation.Create('TrackId');
  FPlaylistId := TDictionaryAssociation.Create('PlaylistId');
end;

{ TTrackTableDictionary }

constructor TTrackTableDictionary.Create;
begin
  inherited;
  FTrackId := TDictionaryAttribute.Create('TrackId');
  FName := TDictionaryAttribute.Create('Name');
  FComposer := TDictionaryAttribute.Create('Composer');
  FMilliseconds := TDictionaryAttribute.Create('Milliseconds');
  FBytes := TDictionaryAttribute.Create('Bytes');
  FUnitPrice := TDictionaryAttribute.Create('UnitPrice');
  FMediaTypeId := TDictionaryAssociation.Create('MediaTypeId');
  FGenreId := TDictionaryAssociation.Create('GenreId');
  FAlbumId := TDictionaryAssociation.Create('AlbumId');
end;

{ TUsuarioTableDictionary }

constructor TUsuarioTableDictionary.Create;
begin
  inherited;
  Fid := TDictionaryAttribute.Create('id');
  Fusuario := TDictionaryAttribute.Create('usuario');
  Fsenha := TDictionaryAttribute.Create('senha');
end;

initialization
  RegisterEntity(TAlbum);
  RegisterEntity(TArtist);
  RegisterEntity(TCustomer);
  RegisterEntity(TEmployee);
  RegisterEntity(TGenre);
  RegisterEntity(TInvoice);
  RegisterEntity(TInvoiceLine);
  RegisterEntity(TMediaType);
  RegisterEntity(TPlaylist);
  RegisterEntity(TPlaylistTrack);
  RegisterEntity(TTrack);
  RegisterEntity(TUsuario);

finalization
  if __Dic <> nil then __Dic.Free

end.
