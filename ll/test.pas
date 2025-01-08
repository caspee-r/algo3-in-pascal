
program LinkedListTest;
uses ll;

var
	found: Boolean;

begin
	Create_LL();
	Insert_LL(2003);
	Insert_LL(8);
	Insert_LL(3);
	Delete_LL(8);
	found := Search_LL(8);
	writeln(found);
end.
