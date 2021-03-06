program task_2_22;
type
    checklistArray = array [char] of boolean;
procedure GetLongestParam(param: string; paramNumber: integer;
    var longestParamNumber: integer; var longestParamLength: integer);
begin
    if Length(param) > longestParamLength then begin
        longestParamNumber := paramNumber;
        longestParamLength := Length(param)
    end
end;
procedure PrintParamWithoutRepeatedLetters(word: string);
var
    alphabet: array['a'..'z'] of boolean;
    i: integer;
    c: char;
begin
    for i := 97 to (Length(alphabet) + 96) do
        alphabet[chr(i)] := false;
    for i := 1 to Length(word) do begin
        c := word[i];
        if (c >= 'A') and (c <= 'Z') then
            c := chr(ord(word[i]) + 32);
        if not alphabet[c] then
            alphabet[c] := true
        else
            exit
    end;
    write(word, ' ')
end;
procedure CreateChecklist(firstParam: string; var checklist: checklistArray);
var
    i: integer;
begin
    for i := 1 to Length(firstParam) do
        checklist[firstParam[i]] := false;
    for i := 1 to Length(firstParam) do
        checklist[firstParam[i]] := true
end;
procedure PrintParamWithAtLeastOneSymbolWithFirst(param: string;
    checklist: checklistArray);
var
    i: integer;
begin
    for i := 1 to Length(param) do begin
        if checklist[param[i]] then begin
            write(param, ' ');
            break
        end;
    end
end;
var
    i, longestParamNumber, longestParamLength: integer;
    checklist: checklistArray;
begin
    {$I-}
    if ParamCount < 1 then begin
        writeln(ErrOutput, 'No parameters entered. Pleas enter at least one');
        halt(1)
    end;
    longestParamNumber := 1;
    longestParamLength := 0;
    for i := 1 to ParamCount do begin
        GetLongestParam(ParamStr(i), i, longestParamNumber, longestParamLength)
    end;
    writeln('a) Longest parameter: ', ParamStr(longestParamNumber),
        ' - ', longestParamLength, ' character(s)');
    write('b) Parameter(s) without repeated letters: ');
    for i := 1 to ParamCount do begin
        PrintParamWithoutRepeatedLetters(ParamStr(i))
    end;
    writeln;
    CreateChecklist(ParamStr(1), checklist);
    if ParamCount < 2 then
        writeln('g) For this task need at least two parameters')
    else begin
        write('g) Parameter(s) with at least one same symbol with first: ');
        for i := 2 to ParamCount do
            PrintParamWithAtLeastOneSymbolWithFirst(ParamStr(i), checklist);
        writeln
    end
end.