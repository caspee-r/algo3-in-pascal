unit queuedsa;

interface

procedure CreateQueue;
procedure Enqueue(value: Integer);
procedure Dequeue;
function GetHead(): Integer;
function GetTail(): Integer;
function Full():Boolean;
function Empty():Boolean;

{$IFDEF ARRAY}
var
	queue: array[0..100] of Integer;
	Head,Tail:Integer;
{$ELSE}
type TElement = Record
	value: Integer;
	next: ^TElement;
end;
var
Head,Tail: ^TElement;
{$ENDIF}

implementation

{$IFDEF ARRAY}
{$IFDEF BYSHIFT}

procedure CreateQueue;
begin
	Tail:= 0;
	Head := 0;
end;

function Full():Boolean;
begin
	Full := Tail = 100;
end;

function Empty():Boolean;
begin
	Empty := Head = Tail;
end;

procedure Enqueue(value: Integer);
begin
	if Full() then
	begin
		WriteLn('Queue Is Full');
	end
	else 
begin
	queue[Tail] := value;
	Tail := Tail + 1;
end;
end;

procedure QueueShift;
var
	i: integer;
begin
	for i:= 0 to Tail do
		queue[i] := queue[i+1];
end;

procedure Dequeue;
begin
	if Empty() then
	begin
		WriteLn('Queue Is Empty')
	end
	else 
begin
	QueueShift();
	Tail:= Tail - 1;
end;
end;

function GetHead(): Integer;
begin
	if not Empty() then
		GetHead := queue[Head];
end;

function GetTail(): Integer;
begin
	if not Empty() then
		GetTail := queue[Tail];
end;

{$ELSE} // by flow

procedure CreateQueue;
begin
	Tail:= 0;
	Head := 0;
end;

function Full():Boolean;
begin
	Full := (Tail + 1) mod 100  = Head;
end;

function Empty():Boolean;
begin
	Empty := Head = Tail;
end;

procedure Enqueue(value: Integer);
begin
	if Full() then
	begin
		WriteLn('Queue Is Full');
	end
	else 
begin
	queue[Tail] := value;
	Tail := (Tail + 1) mod 100;
end;
end;

procedure Dequeue;
begin
	if Empty() then
		WriteLn('Queue Is Empty')
	else 
	Head := (Head + 1)	mod 100;
end;

function GetHead(): Integer;
begin
	if not Empty() then
		GetHead := queue[Head];
end;

function GetTail(): Integer;
begin
	if not Empty() then
	begin
		if Tail = 0 then
			GetTail := queue[100]
		else
			GetTail := queue[Tail - 1];
	end;
end;
{$ENDIF}
{$ELSE} // implementation using linked lists

procedure CreateQueue;
begin
	Head:= Nil;	
	Tail:= Nil;	
end;

function Full():Boolean;
begin
	Full:= False;
end;

function Empty():Boolean;
begin
	Empty:= Head = Nil
end;

procedure Enqueue(value: Integer);
var
	new_node:^TElement;
begin
	if not Full then
	begin
		if Tail = Nil then
		begin
			New(new_node);
			new_node^.value := value;
			Tail:= new_node;
			Head := Tail;
		end else begin
			New(new_node);
			new_node^.value := value;
			Tail^.next := new_node;
			Tail := new_node;
		end;
	end else begin
		WriteLn('Queue Is Full');
	end;
end;

procedure Dequeue;
var
	tmp:^TElement;
begin
	if not Empty() then
	begin
		tmp := Head;
		Head := Head^.next;
		Dispose(tmp);
	end else begin
		WriteLn('Queue Is Empty');
	end;
end;

function GetHead():Integer;
begin
	if not empty then
		GetHead := Head^.value
end;

function GetTail():Integer;
begin
	if not empty then
		GetTail := Tail^.value
end;
{$ENDIF}

end.
