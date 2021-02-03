unit UTools;

interface

USES
  System.SysUtils, System.Variants, System.Classes, STRUTILS;

  function extractMessage(message: String): string;
implementation

function UTools.extractMessage(message: String): string;
var
I: integer;
BEGIN
  if pos('login=',message) > 0 then
  BEGIN
    Result := 'user login';
  END
  ELSE
  if pos('msgpr=',message) > 0 then
  BEGIN
    Result := 'Private Message';
  END
  ELSE
  if pos('msgpb=',message) > 0 then
  BEGIN
    Result := 'public Message';
  END
  ELSE
  if pos('getusrs=',message) > 0 then
  BEGIN
    Result := 'connected users list';
  END;
END;

end.
