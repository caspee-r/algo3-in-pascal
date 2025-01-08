unit ll;

interface


type
	TNode = record
		value: Integer;
		next: ^Tnode;
	end;


Var
	Head: ^TNode;

procedure Create_LL;
procedure Insert_LL(value :Integer);
procedure Delete_LL(value :Integer);
function Search_LL(value :Integer):Boolean;

implementation
procedure Create_LL;
begin
	Head := Nil;
end;

procedure Insert_LL(value: Integer);
var
	new_node: ^TNode;
begin
	New(new_node);
	new_node^.value := value;
	new_node^.next := Head;
	Head := new_node;
end;

procedure Delete_LL(value: Integer);
var
	curr, pre: ^TNode;
	Del: Boolean;
begin
	curr := Head;
	pre := Head;

	if Head <> Nil then
	begin
		if Head^.value = value then
		begin
			Head := Head^.next;
			Dispose(curr);
		end
		else
		begin
			Del := False;
			curr := Head^.next;
			while (curr <> Nil) and (not Del) do
			begin
				if curr^.value = value then
				begin
					pre^.next := curr^.next;  // Fix: Update 'pre^.next' instead of 'pre := curr^.next'
					Dispose(curr);
					Del := True;
				end
				else
				begin
					pre := curr;
					curr := curr^.next;
				end;
			end;
		end;
	end;
end;

function Search_LL(value: Integer): Boolean;
var
	curr: ^TNode;
	exist: Boolean;
begin
	exist := False;
	curr := Head;
	while (curr <> Nil) and (not exist) do
	begin
		if curr^.value = value then
		begin
			exist := True;
		end;
		curr := curr^.next;
	end;
	Search_LL := exist;
end;

{$IFDEF llmain}
begin
    write('Main: The meaning of life is: ');
{$ENDIF}
end.
