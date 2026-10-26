unit UFrameAluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TFrameAluno = class(TFrame)
    Rectangle1: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
