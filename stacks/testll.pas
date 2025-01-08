program test;
uses stackdsa;

Begin
	CreateStack();
	Push(2003);
	Push(8);
	Push(3);
	WriteLn(GetTop());
	Pop();
	WriteLn(GetTop());
	Pop();
	WriteLn(GetTop());
End.


