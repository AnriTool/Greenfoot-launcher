{$apptype windows}
{$reference 'System.Windows.Forms.dll'}
{$reference 'System.Drawing.dll'}
{$mainresource icon.res}
Uses System ,System.IO, System.Windows.Forms, System.Drawing;



var
  bLeft, bRight, bStart :Button;
  f : Form;
  img: PictureBox;
  gametxt :  System.Windows.Forms.Label;
  counter: integer;
  curGame: String;
  var files := Directory.GetFiles('games\', '*.jar',SearchOption.AllDirectories);
  
procedure next(sender: object; e: EventArgs); 
begin
  files := Directory.GetFiles('games\', '*.jar',SearchOption.AllDirectories);
  curGame := files[counter].ToString;
  curGame := Copy(curGame,7,curGame.Length-10);
  
  if counter < files.Length-1 then
    counter:= counter + 1
  else counter := 0;  
  curGame := files[counter].ToString;
  curGame := Copy(curGame,7,curGame.Length-10);
  if FileExists(Concat('images\', curGame, '.png')) then
    img.Image:= Image.FromFile(Concat('images\', curGame, '.png'))
  else img.Image:= Image.FromFile('images\NOIMAGE.png');
  gametxt.Text := curGame+'.jar';
  //writeln(curGame);
end;

procedure previous(sender: object; e: EventArgs); 
begin
  var files := Directory.GetFiles('games\', '*.jar',SearchOption.AllDirectories);
  curGame := files[counter].ToString;
  curGame := Copy(curGame,7,curGame.Length-10);
  
  if counter > 0 then
    counter:= counter - 1
  else counter := files.Length-1;  
  curGame := files[counter].ToString;
  curGame := Copy(curGame,7,curGame.Length-10);
  if FileExists(Concat('images\', curGame, '.png')) then
    img.Image:= Image.FromFile(Concat('images\', curGame, '.png'))
  else img.Image:= Image.FromFile('images\NOIMAGE.png');
  gametxt.Text := curGame+'.jar';
  //writeln(curGame);
end;

procedure start(sender: object; e: EventArgs); 
begin
  //var cmd : string;
  var fl: text;
  assign(fl,'start.bat');
  Rewrite(fl);
  Write(fl,'jdk\bin\java.exe -cp "lib\javafx\lib\javafx.base.jar;lib\javafx\lib\javafx.controls.jarlib\javafx\lib\javafx.fxml.jar;lib\javafx\lib\javafx.media.jar;lib\javafx\lib\javafx.properties.jar;lib\javafx\lib\javafx.swing.jar;lib\javafx\lib\javafx.web.jar;GAMES\'+curGame+'.jar" --module-path "lib\javafx\lib" --add-modules=ALL-MODULE-PATH greenfoot.export.GreenfootScenarioApplication');
  close(fl);
  Exec('start.bat');
end;

begin

counter := 0;
//var files := Directory.GetFiles('games\', '*.jar',SearchOption.AllDirectories);
curGame := files[counter].ToString;
curGame := Copy(curGame,7,curGame.Length-10);
//writeln(curGame);

f:= new Form;
f.Text := 'ZPSKTR';
f.FormBorderStyle := System.Windows.Forms.FormBorderStyle.FixedSingle;
f.Height := 215; f.Width := 324;
f.Icon := new Icon('icon.ico'); 
  
bLeft := new Button;
bLeft.Height := 26; bLeft.Width := 60; bLeft.Text := 'Previous';   
bLeft.Top := 58; bLeft.Left := 5; bLeft.Click += previous;

bRight := new Button;
bRight.Height := 26; bRight.Width := 60; bRight.Text := 'Next';   
bRight.Top := 58; bRight.Left := 254; bRight.Click += next;

bStart := new Button;
bStart.Height := 26; bStart.Width := 60; bStart.Text := 'Start';   
bStart.Top := 145; bStart.Left := 188; bStart.Click += start;

img := new PictureBox;
img.Height := 130; img.Width := 178;
img.Top := 5; img.Left := 70;
if FileExists(Concat('images\', curGame, '.png')) then
  img.Image:= Image.FromFile(Concat('images\', curGame, '.png'))
else img.Image:= Image.FromFile('images\NOIMAGE.png');

gametxt := new  System.Windows.Forms.Label();
gametxt.Width := 120; gametxt.Height := 30;
gametxt.Top := 142; gametxt.Left :=  62;

gametxt.TextAlign := System.Drawing.ContentAlignment.MiddleRight;
gametxt.Text := curGame+'.jar';

  f.Controls.Add(bLeft);
  f.Controls.Add(bRight);
  f.Controls.Add(bStart);
  f.Controls.Add(img);
  f.Controls.Add(gametxt);
  Application.Run(f);
end.




//var files := Directory.GetFiles('games\', '*.jar',SearchOption.AllDirectories);
//var name:string;
//for var i:=0 to files.Length-1 do begin
  //name := files[i].ToString;
  //name := Copy(name,7,name.Length-6);
  //writeln(name);
  //end;