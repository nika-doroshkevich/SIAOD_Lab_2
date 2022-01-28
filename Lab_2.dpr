program Lab_2;

{$APPTYPE CONSOLE}

uses
  SysUtils, Windows;

type
  pNode = ^node;

  node = record
    fio: String;
    number: Integer;
    next: pNode;
  end;

procedure add(var root: pNode; fio:String; number:integer);
var
  temp, addX: pNode;
begin
  New(addX);
  addX.fio := fio;
  addX.number := number;
  addX.next := nil;

  if root = nil then
    root := addX
  else
  begin
    temp := root;
    if (CompareStr(root.fio, addX.fio) < 0) then
    begin
      while (temp.next <> nil) and (CompareStr(temp.next.fio, addX.fio) < 0) do
        temp := temp.next;
      addX.next := temp.next;
      temp.next := addX;
    end
    else
    begin
      addX.next := root;
      root := addX;
    end;
  end;
end;

procedure printList(root: pNode);
var
  temp: pNode;
begin
  temp := root;
  while temp <> nil do
  begin
    writeln(temp.fio, ' ', temp.number);
    temp := temp.next;
  end;
end;

procedure printListByFIO(root: pNode; fio: String);
var
  temp: pNode;
begin
  temp := root;
  while temp <> nil do
  begin
    if CompareStr(temp.fio, fio) = 0 then
      writeln(temp.fio, ' ', temp.number);
    temp := temp.next;
  end;
end;

procedure printListByNumber(root: pNode; number:Integer);
var
  temp: pNode;
begin
  temp := root;
  while temp <> nil do
  begin
    if temp.number = number then
      writeln(temp.fio, ' ', temp.number);
    temp := temp.next;
  end;
end;

var
  list: pNode;
  fioEnt: String;
  numberEnt, choiceEnt: Integer;

begin
  SetConsoleCP(1251);
  SetConsoleOutPutCP(1251);

  list := nil;

  writeln('0 - �����');
  writeln('1 - �������� ��������');
  writeln('2 - ������� ���� ������');
  writeln('3 - ����� �� �������');
  writeln('4 - ����� �� ������ ��������');

  writeln('�������� �����:');
  readln(choiceEnt);

  while choiceEnt <> 0 do
    case choiceEnt of
      1:
        begin
          writeln('������� ������� � ����� �������� ��������:');
          readln(fioEnt);
          readln(numberEnt);
          add(list, fioEnt, numberEnt);
          readln(choiceEnt);
        end;
      2:
        begin
          writeln('���� ������:');
          printList(list);
          readln(choiceEnt);
        end;
      3:
        begin
          writeln('������� ������� ��� ������:');
          readln(fioEnt);
          writeln;
          writeln('������:');
          printListByFIO(list, fioEnt);
          readln(choiceEnt);
        end;
      4:
        begin
          writeln('������� ����� �������� ��� ������:');
          readln(numberEnt);
          writeln;
          writeln('������:');
          printListByNumber(list, numberEnt);
          readln(choiceEnt);
        end;
    end;
  readln
end.
