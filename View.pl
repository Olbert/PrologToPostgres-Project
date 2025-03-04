:- use_module(library(pce)).
:- include('C:/Users/iampi/Documents/Prolog/PrologPostgres Project/File.pl').
:- include('C:/Users/iampi/Documents/Prolog/PrologPostgres Project/LocalBase.pl').
:- include('C:/Users/iampi/Documents/Prolog/PrologPostgres Project/DatabaseConnect.pl').

forma :-
   new(Dialog, dialog('���� Postgres')),
	send_list(Dialog,append,
		  [
		   button(����_����������,and(message(@prolog,write_form),
			  message(Dialog, destroy))),
                  button(����_������_�_��,and(message(@prolog,db_form),
			  message(Dialog, destroy))),
			      button(����_���������,and(message(@prolog,edit_form),
			  message(Dialog, destroy))),
                  button(����_��������,and(message(@prolog,delete_form),
			  message(Dialog, destroy))),
		  button(�����, message(Dialog, destroy))]),
	send(Dialog,default_button,�����),
	send(Dialog, open).


write_form :-
	new(Dialog, dialog('���������� �������')),
	send_list(Dialog,append,
		  [new(Id, int_item(id)),
		   new(N1, text_item(���)),
		   new(N2, text_item(�������)),
		   new(N3, text_item(���������)),

		   button(�����,and(message(@prolog,forma),
			  message(Dialog, destroy))),

		   button(���������, and(message(@prolog,
						 write_in,
						 Id?selection,
						 N1?selection,
						 N2?selection,
						 N3?selection),
					 message(@prolog,forma_in))),
		  button(�����, message(Dialog, destroy))]),

	send(Dialog,default_button,���������),
	send(Dialog, open).

edit_form:-
	new(Dialog,dialog('�������������� �������')),
	    send_list(Dialog, append,[
				 [new(Id, int_item(id)),
				  new(N1, text_item(���)),
				  new(N2, text_item(�������)),
				  new(N3, text_item(���������))],
				  button(�����,and(message(@prolog,forma),
						   message(Dialog, destroy))),
				  button(�����, and(message(@prolog,
							    poisk,
							    Id?selection,N1,N2,N3))),
                                  button(���������, and(message(@prolog,
						 edit,
						 Id?selection,
						 N1?selection,
						 N2?selection,
						 N3?selection),
					 message(@prolog,edit_form))),
				  button(�����, message(Dialog, destroy))]),
	    send(Dialog,default_button,���������),
	    send(Dialog, open).


delete_form:-
	new(Dialog,dialog('�������� �������')),
	    send_list(Dialog, append,
		      [
				 [new(Id, int_item(id)),
				  new(N1, text_item(���)),
				  new(N2, text_item(�������)),
				  new(N3, text_item(���������))],
				  button(�����,and(message(@prolog,forma),
						   message(Dialog, destroy))),
				  button(�����, and(message(@prolog,
							    poisk,
							    Id?selection,
							    N1,N2,N3),
						    message(Dialog,destroy))),
				  button(�������, and(message(@prolog,
							      delete_id,
							      Id?selection),
						      message(@prolog,delete_form))),
				  button(�����, message(Dialog, destroy))]),

	    send(Dialog,default_button,�������),
	    send(Dialog, open).






db_form :-
   new(Dialog, dialog('���� Postgres')),
	send_list(Dialog,append,
		  [
                   button(����_����������,and(message(@prolog,db_get_form),
			  message(Dialog, destroy))),
                   button(����_����������_c_id,and(message(@prolog, db_get_form_id),
                                                        message(Dialog, destroy))),
                   button(����_���������,and(message(@prolog,db_edit_form),
			  message(Dialog, destroy))),
                  button(����_��������,and(message(@prolog,db_delete_form),
			  message(Dialog, destroy))),
		  button(�����, message(Dialog, destroy))]),
	send(Dialog,default_button,�����),
	send(Dialog, open).




db_get_form:-
    new(Dialog,dialog('������ � ��')),
	    send_list(Dialog, append,
		      [
				 [new(Table, text_item(��������_�������))],
				  button(�����,and(message(@prolog,forma),
						   message(Dialog, destroy))),
				  button(�������, and(message(@prolog,
							    getDbList,
							    Table?selection))),
				  button(�����, message(Dialog, destroy))]),

	    send(Dialog,default_button,�������),
	    send(Dialog, open).

db_get_form_id:-
    new(Dialog,dialog('������ � ��')),
	    send_list(Dialog, append,
		      [
				 [new(Table, text_item(��������_�������)),
                                  new(Id, int_item(id))],
				  button(�����,and(message(@prolog,forma),
						   message(Dialog, destroy))),
				  button(�������, and(message(@prolog,
							    getDbList_id,
							    Table?selection,
                                                            Id?selection))),
				  button(�����, message(Dialog, destroy))]),

	    send(Dialog,default_button,�������),
	    send(Dialog, open).


db_edit_form:-
    new(Dialog,dialog('������ � ��')),
	    send_list(Dialog, append,
		      [
				 [new(Table, text_item(��������_�������)),
				 new(Id, text_item(id)),
				 new(Name, text_item(���_���������)),
				 new(Value, text_item(��������_���������))],
				  button(�����,and(message(@prolog,forma),
						   message(Dialog, destroy))),
				  button(�������, and(message(@prolog,
							    editDbList,
							    Table?selection,
                                                             Id?selection,
                                                             Name?selection,
                                                             Value?selection))),
				  button(�����, message(Dialog, destroy))]),

	    send(Dialog,default_button,�������),
	    send(Dialog, open).





db_delete_form:-
    new(Dialog,dialog('������ � ��')),
	    send_list(Dialog, append,
		      [
                                   [new(Table, text_item(��������_�������)),
                                    new(Name, text_item(���_���������)),
				 new(Value, text_item(��������_���������))],
				  button(�����,and(message(@prolog,forma),
						   message(Dialog, destroy))),
				  button(�������, and(message(@prolog,
							    deleteDbList,
							    Table?selection,
                                                              Name?selection,
                                                             Value?selection))),
				  button(�����, message(Dialog, destroy))]),

	    send(Dialog,default_button,�������),
	    send(Dialog, open).





getDbList(Table):-
    getList(Table).

getDbList_id(Table,Id):-
    getList(Table,Id).

setDbList(Table,Id,Name,Value):-
    updateList(Table,Id,Name,Value).

deleteDbList(Table,Name,Value):-
    deleteList(Table,Name,Value).


deleteDbList(Table,Id):-
    deleteList(Table,Id).





run:-
   forma.
:-run.
