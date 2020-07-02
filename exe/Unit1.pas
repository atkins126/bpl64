unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons;

type
  TForm1 = class(TForm)
    btnTeste: TSpeedButton;
    procedure btnTesteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
   untIMinhaInterface, untInterfaceController;

{$R *.dfm}

procedure TForm1.btnTesteClick(Sender: TObject);
begin
   try
      var result := TInterfaceController
         .CreateInterface<IMinhaInterface>()
         .Calcular(5, 5);

      ShowMessageFmt('result = %d', [result]);
   except
//      on E: EInterfaceControllerDllInvalid do
//      begin
//         ShowMessage(E.Message);
//      end;

      on E: Exception do
      begin
         if E is EInterfaceControllerDllInvalid then
         begin
            ShowMessage('EInterfaceControllerDllInvalid');
            var EE := E as EInterfaceControllerDllInvalid;
            ShowMessage(EE.Message);
         end
         else if E.InheritsFrom(EInterfaceControllerDllInvalid) then
         begin
            ShowMessage('EInterfaceControllerDllInvalid');
            var EE := E as EInterfaceControllerDllInvalid;
            ShowMessage(EE.Message);
         end
         else
            ShowMessageFmt('%s: %s', [E.ClassType.ClassName, E.Message]);
      end;
   end;
end;

end.
