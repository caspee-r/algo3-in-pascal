unit stackdsa;

interface

procedure CreateStack;
function GetTop():Integer;
procedure Push(value: Integer);
procedure Pop;
function Full():Boolean;
function Empty():Boolean;

{$IFDEF ARRAY}
var
	Stack: array[1..100] of Integer;
	Top: Integer;

{$ELSE}
type TElement = Record
	value: Integer;
	next: ^TElement;
end;

var
	Top: ^TElement;
{$ENDIF}

implementation
{$IFDEF ARRAY}
procedure CreateStack;
begin
	Top := 0
end;

function GetTop():Integer;
begin
	GetTop := Stack[Top];
end;

function Full():Boolean;
begin
	Full := Top = 100;
end;

function Empty():Boolean;
begin
	Empty := Top = 0;
end;

procedure Push(value: Integer);
begin
	if not Full() then
	begin
		Top := Top + 1;
		Stack[Top] := value;
	end
	else
	begin
		writeln('Stack Is Full');
	end;
end;

procedure Pop;
begin
	if Empty then
	begin
		writeln('Stack Is Empty');
	end
	else
	begin
		Top := Top - 1;
	end;
end;
{$ELSE}

procedure CreateStack;
begin
	Top := Nil;
end;

function Full():Boolean;
begin
 Full:= False;
end;

function Empty():Boolean;
begin
	Empty := Top = nil;
end;

function GetTop():Integer;
begin
	if not Empty() then
		GetTop := Top^.value;
end;

procedure Push(value: Integer);
var 
	new_node: ^TElement;
begin
	New(new_node);
	new_node^.value := value;
	new_node^.next := Top;
	Top := new_node;
end;

procedure Pop;
var
	tmp: ^TElement;
begin
	if not Empty() then
	begin
		tmp := Top;
		Top := Top^.next;
		Dispose(tmp);
	end
end;

{$ENDIF}
end.


