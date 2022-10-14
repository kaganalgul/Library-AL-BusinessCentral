table 50001 LibraryBook
{
    DataClassification = ToBeClassified;
    Caption = 'Books';

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    LibrarySetup.Get();
                    NoSeriesMgt.TestManual(LibrarySetup."Book No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; BookName; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Book Name';
        }
        field(3; BookTakenDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Book Taken Date';
        }
        field(4; BookGivenDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Book Given Date';
        }
        field(5; BookGenre; Enum LibraryBookCategoryEnum)
        {
            DataClassification = ToBeClassified;
            Caption = 'Book Category';
        }
        field(6; BookLendingTo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Book Lending To';
            TableRelation = LibraryConsumer;
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;
        LibrarySetup: Record LibrarySetupTable;
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            LibrarySetup.Get();
            LibrarySetup.TestField("Book No.");
            NoSeriesMgt.InitSeries(LibrarySetup."Book No.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        if Rec.BookLendingTo <> '' then begin
            Error('Bu kitap bir kişinin üstüne kayıtlıdır.');
        end;
    end;

    trigger OnRename()
    begin

    end;

    procedure AssistEdit() Result: Boolean
    begin
        LibrarySetup.Get();
        LibrarySetup.TestField("Book No.");
        if NoSeriesMgt.SelectSeries(LibrarySetup."Book No.", xRec."No.", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;
    end;

}