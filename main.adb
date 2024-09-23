with Ada.Text_IO;
with Array_List;

procedure Main is 
    type Rec is record 
        X : Integer;
        Y : Integer;
    end record;

    package Rec_List is new Array_List (T => Rec);
    AR : Rec_List.Array_List := Rec_List.New_List;



    package Int_List is new Array_List (T => Integer);
    A1 : Int_List.Array_List := Int_List.New_List;
    A0 : Int_List.Array_List := Int_List.New_List;

    package Char_List is new Array_List (T => Character);
    A2 : Char_List.Array_List := Char_List.New_List;

    package Float_List is new Array_List (T => Float);
    A4 : Float_List.Array_List := Float_List.New_List;
    F1 : Float;
begin 
    Int_List.Push_Back(A1, 1);
    Ada.Text_IO.Put_Line("size: " & Integer'Image(Int_List.Size(A1)));
    Ada.Text_IO.Put_Line("index 0: " & Integer'Image(Int_List.At_Index(A1, 0)));

    --  Char_List.Push_Back(A2, 'a');
    for char in Character'Val(65)..Character'Val(122) loop 
        Char_List.Push_Back(A2, char);
        Ada.Text_IO.Put_Line("size: " & Integer'Image(Char_List.Size(A2)));
    end loop;
    Ada.Text_IO.Put_Line("size: " & Integer'Image(Char_List.Size(A2)));
    Ada.Text_IO.Put_Line("index 0: " & Char_List.At_Index(A2, 0));
    for i in 0..Char_List.Size(A2)-1 loop 
        Ada.Text_IO.Put(Char_List.At_Index(A2, i) & ", ");
    end loop;

    Ada.Text_IO.New_Line;
    for i in 19..38 loop
        Char_List.Erase(A2, 19);
    end loop;
    for i in 0..Char_List.Size(A2)-1 loop 
        Ada.Text_IO.Put(Char_List.At_Index(A2, i) & ", ");
    end loop;

    Ada.Text_IO.New_Line;

    Int_List.Push_Back(A0, 1);
    Ada.Text_IO.Put_Line(Boolean'Image(Int_List."="(A0, A1)));
    Ada.Text_IO.Put_Line(Boolean'Image(Int_List."/="(A0, A1)));

    F1 := Float_List.Front(A4);
    Ada.Text_IO.Put_Line(Float'Image(F1));
    exception
        when Constraint_Error =>
            Ada.Text_IO.Put_Line("Front out of range");
    Float_List.Push_Back(A4, 0.0);
    Ada.Text_IO.Put_Line(Float'Image(Float_List.Front(A4)));

    Ada.Text_IO.Put_Line("Back: " & Char_List.Back(A2));
    Char_List.Pop_Back(A2);
    Ada.Text_IO.Put_Line("Back: " & Char_List.Back(A2));

    Char_List.Clear(A2);
    Ada.Text_IO.Put_Line("size: " & Integer'Image(Char_List.Size(A2)));

    for i in Character range 'a'..'f' loop 
        Char_List.Push_Back(A2, i);
    end loop;

    Ada.Text_IO.Put_Line("size: " & Integer'Image(Char_List.Size(A2)));
    for i in 0..Char_List.Size(A2)-1 loop 
        Ada.Text_IO.Put(Char_List.At_Index(A2, i) & ", ");
    end loop;
    Ada.Text_IO.New_Line;
    Char_List.Erase(A2, 2);
    Ada.Text_IO.Put_Line("size: " & Integer'Image(Char_List.Size(A2)));
    for i in 0..Char_List.Size(A2)-1 loop 
        Ada.Text_IO.Put(Char_List.At_Index(A2, i) & ", ");
    end loop;

    Ada.Text_IO.New_Line;

    Char_List.Insert(A2, 3, 'x');
    Ada.Text_IO.Put_Line("size: " & Integer'Image(Char_List.Size(A2)));
    for i in 0..Char_List.Size(A2)-1 loop 
        Ada.Text_IO.Put(Char_List.At_Index(A2, i) & ", ");
    end loop;

    Ada.Text_IO.New_Line;
    Rec_List.Push_Back(AR, (2,3));
    Ada.Text_IO.Put_Line("record list size: " & Integer'Image(Rec_List.Size(AR)));

    Ada.Text_IO.Put_Line(Integer'Image(Rec_List.At_Index(AR, 0).X));

    --  Rec_List.Free_List(AR);
    --  Int_List.Free_List(A0);
    --  Int_List.Free_List(A1);
    --  Char_List.Free_List(A2);
    --  Float_List.Free_List(A4);

end Main;
