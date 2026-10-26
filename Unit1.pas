unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.Edit, FMX.Objects,
  System.Actions, FMX.ActnList;

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
    Edit3: TEdit;
    Rectangle7: TRectangle;
    Label5: TLabel;
    Edit4: TEdit;
    Rectangle8: TRectangle;
    Label6: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
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

  for I := 0 to 10 do
  begin
    Frame := TFrameAluno.Create(nil);

    Frame.Label1.Text := 'Nome do aluno ' + IntToStr(i);
    Frame.Label2.Text := 'email@gmail.com';

    Frame.Align := TAlignLayout.Top;
    VertAluno.AddObject(Frame);
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

end.
