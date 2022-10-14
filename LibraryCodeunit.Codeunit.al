codeunit 50000 LibraryCodeunit
{
    procedure CheckBookRetrieve(var Book: Record LibraryTableLine)
    begin
        if (Book.IsBookRetrieve) AND (Book.BookGivenDate = 0D) then begin
            Error('Kitap Teslim Tarihi dolu olmalı ya da Teslim Alma seçeneği işaretlenmemiş olmalıdır.');
        end;
    end;
}