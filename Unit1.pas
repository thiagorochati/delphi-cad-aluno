unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.Edit, FMX.Objects,
  System.Actions, FMX.ActnList, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, System.IOUtils, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    VertAluno: TVertScrollBox;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Rectangle2: TRectangle;
    Image1: TImage;
    Rectangle3: TRectangle;
    Label2: TLabel;
    Image2: TImage;
    ActionList1: TActionList;
    MudaAba: TChangeTabAction;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Label3: TLabel;
    Image4: TImage;
    Rectangle6: TRectangle;
    Label4: TLabel;
    EditNome: TEdit;
    Rectangle7: TRectangle;
    Label5: TLabel;
    EditEmail: TEdit;
    Rectangle8: TRectangle;
    Label6: TLabel;
    FDConnection: TFDConnection;
    Rectangle9: TRectangle;
    Label7: TLabel;
    EditRM: TEdit;
    QDados: TFDQuery;
    procedure Image1Click(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure Rectangle8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses UFrameAluno;

procedure TForm1.FDConnectionAfterConnect(Sender: TObject);
begin
  var Aux : String;

  Aux := 'CREATE TABLE IF NOT EXISTS ALUNO (' +
         ' ID_ALUNO INTEGER,' +
         ' NOME TEXT,' +
         ' EMAIL TEXT, ' +
         ' RM TEXT, ' +
         ' PRIMARY KEY (ID_ALUNO) )';

  FDConnection.ExecSQL(Aux);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  FDConnection.Params.Values['Database'] := System.IOUtils.TPath.GetDocumentsPath +
     '/BDAula.SQL';
end;

procedure TForm1.Image1Click(Sender: TObject);
var
  i : integer;
  Frame: TFrameAluno;
begin
  VertAluno.BeginUpdate;

  //Limpando todos os itens do VertScrollBox
  for i := VertAluno.Content.ChildrenCount - 1 downto 0 do
    if VertAluno.Content.Children[i] is TFrame then
      TFrame(VertAluno.Content.Children[i]).DisposeOf;

  QDados.Close;
  QDados.SQL.Clear;
  QDados.SQL.Add('SELECT * FROM ALUNO ORDER BY NOME');
  QDados.Open;

  While not QDados.Eof do
  begin
    Frame := TFrameAluno.Create(nil);

    Frame.Label1.Text := QDados.FieldByName('NOME').AsString;
    Frame.Label2.Text := QDados.FieldByName('EMAIL').AsString;

    Frame.Align := TAlignLayout.Top;
    VertAluno.AddObject(Frame);

    QDados.Next;
  end;
  VertAluno.EndUpdate;


end;

procedure TForm1.Image4Click(Sender: TObject);
begin
  MudaAba.Tab := TabItem1;
  MudaAba.ExecuteTarget(Self);
end;

procedure TForm1.Rectangle1Click(Sender: TObject);
begin
  MudaAba.Tab := TabItem2;
  MudaAba.ExecuteTarget(Self);
end;

procedure TForm1.Rectangle8Click(Sender: TObject);
begin
  Var Aux : String;

  Aux := 'INSERT INTO ALUNO (RM, NOME, EMAIL) VALUES (:RM, :NOME, :EMAIL)';

  QDados.Close;
  QDados.SQL.Clear;
  QDados.SQL.Add(Aux);
  QDados.ParamByName('RM').Value    := EditRM.Text;
  QDados.ParamByName('NOME').Value  := EditNome.Text;
  QDados.ParamByName('EMAIL').Value := EditEmail.Text;
  QDados.ExecSQL;

  EditRM.Text    := '';
  EditNome.Text  := '';
  EditEmail.Text := '';
end;

end.
