program queuell;
uses queuedsa;
begin

	CreateQueue();
	Enqueue(2003);
	Enqueue(8);
	Enqueue(3);
	WriteLn(GetHead());
	Dequeue();
	WriteLn(GetHead());
	Dequeue();
	WriteLn(GetHead());
	Dequeue();
end.
