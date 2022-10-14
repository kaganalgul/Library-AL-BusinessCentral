table 50004 LibraryTableLine
{
    DataClassification = ToBeClassified;
    Caption = 'Library Table Line';

    fields
    {
        field(1; DocumentNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No';
        }
        field(2; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No';
        }
        field(3; BookNo; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = LibraryBook;
            Caption = 'Book No';
            trigger OnValidate()
            begin
                CalcFields(BookName);
                Book.Get(Rec.BookNo);
                if Book.BookLendingTo <> '' then begin
                    Error('Bu kitap başka bir kişide kayıtlıdır.');
                end;
                Rec.BookTakenDate := System.Today();
            end;
        }
        field(4; BookName; Text[250])
        {
            Editable = false;
            Caption = 'Book Name';
            FieldClass = FlowField;
            CalcFormula = lookup(LibraryBook.BookName where("No." = field(BookNo)));
        }
        field(5; BookTakenDate; Date) // Kitabın kütüphaneden alınma tarihi
        {
            DataClassification = ToBeClassified;
            Caption = 'Book Taken Date';
        }
        field(6; BookGivenDate; Date) // Kitabın geri verilme tarihi.
        {
            DataClassification = ToBeClassified;
            Caption = 'Book Receive Date';
            trigger OnValidate()
            begin
                DateDiff := Rec.BookGivenDate - Rec.BookTakenDate;
                if DateDiff < 0 then begin
                    Error('Kitap teslim tarihi, kitap alınma tarihinden önceki günler olamaz!');
                    Message(System.Format(DateDiff));
                end;
            end;
        }
        field(7; IsBookRetrieve; Boolean) // Kitap teslim edilme boolean.
        {
            DataClassification = ToBeClassified;
            Caption = 'Receive';
            trigger OnValidate()
            begin
                LibraryTableLine.Reset();
                LibraryTableLine.SetFilter(DocumentNo, Rec.DocumentNo);
                LibraryTableLine.FindSet();
                Book.Reset();
                Book.Get(Rec.BookNo);
                if Rec.IsBookRetrieve then begin
                    Book.BookLendingTo := '';
                    LibraryTableLine.BookGivenDate := System.Today();
                    Book.Modify();
                end;
            end;
        }
    }

    keys
    {
        key(Key1; DocumentNo, LineNo)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        LineNo: Integer;
        Book: Record LibraryBook;
        LibraryCodeunit: Codeunit LibraryCodeunit;
        DateDiff: Integer;
        LibraryTableLine: Record LibraryTableLine;

    trigger OnInsert()
    begin
        LibraryCodeunit.CheckBookRetrieve(Rec);
    end;

    trigger OnModify()
    begin
        LibraryCodeunit.CheckBookRetrieve(Rec);
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}