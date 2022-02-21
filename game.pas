uses GraphWPF, WPFObjects;

var ballRadius := 20;

var Ball := new CircleWPF(ballRadius,ballRadius,ballRadius,gcolor.FromRgb(255,0,0));
var Enemy := new CircleWPF(810-ballRadius,610-ballRadius,ballRadius,gcolor.FromRgb(0,0,255));
var (ml,mr,mt,mb) := (false,false,false,false);
var (el,er,et,eb) := (false,false,false,false);

procedure setup();
begin
  Window.SetSize(800,600);
  Window.Caption := 'Игра из лужи';
  Window.IsFixedSize := true;
  //Window.CenterOnScreen();
   
end;

procedure KeyDown(k: Key);
begin
  case k of
    Key.W: mt := true;
    Key.S: mb := true; 
    Key.A: ml := true;
    Key.D: mr := true;
    
    Key.Up: et := true;
    Key.Down: eb := true; 
    Key.Left: el := true;
    Key.Right: er := true;
  end;
end;

procedure KeyUp(k: Key);
begin
  case k of
    Key.W: mt := false;
    Key.S: mb := false; 
    Key.A: ml := false;
    Key.D: mr := false;
    
    Key.Up: et := false;
    Key.Down: eb := false; 
    Key.Left: el := false;
    Key.Right: er := false;
  end;
end;

{
procedure MouseDown(x, y: real; mousebutton: integer);
begin
  if (mousebutton = 1) then 
  begin
    var c := new CircleWPF(x,y,20,gcolor.FromRgb(0,0,255));
  end;
end;
}

begin
  setup();
  //OnMouseDown := MouseDown;
  OnKeyDown := KeyDown;
  OnKeyUp := KeyUp;
  
  var gameState := true;
  
  var (x,y) := (ballRadius,ballRadius);
  var (x1,y1) := (810-ballRadius,610-ballRadius);
  
  while gameState do 
  begin
    
    if ObjectsIntersect(Ball,Enemy) then 
    begin
      Ball.Left := 0;
      Ball.Top := 0;
      (x,y) := (ballRadius,ballRadius);
      
      Enemy.Left := 810-2*ballRadius;
      Enemy.Top := 610-2*ballRadius;
      (x1,y1) := (810-ballRadius,610-ballRadius);
      
    end;
    
    
    if ((ml) and (x>ballRadius)) then 
      begin
        Ball.Left -= 1;
        x -= 1;
      end;
    if ((mr) and (x<810-ballRadius)) then 
      begin
        Ball.Left += 1;
        x += 1;
      end;

    if ((mt) and (y>ballRadius)) then 
      begin
        Ball.Top -= 1;
        y -= 1;
      end;

     if ((mb) and (y<610-ballRadius)) then 
      begin
        Ball.Top += 1;
        y += 1;
      end;
     {----------------------------------------} 
    if ((el) and (x1>ballRadius)) then 
      begin
        Enemy.Left -= 1;
        x1 -= 1;
      end;
    if ((er) and (x1<810-ballRadius)) then 
      begin
        Enemy.Left += 1;
        x1 += 1;
      end;

    if ((et) and (y1>ballRadius)) then 
      begin
        Enemy.Top -= 1;
        y1 -= 1;
      end;

     if ((eb) and (y1<610-ballRadius)) then 
      begin
        Enemy.Top += 1;
        y1 += 1;
      end;
    
    sleep(1);
  end;
  
  
end.