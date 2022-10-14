table 50002 LibraryConsumer
{
    DataClassification = ToBeClassified;
    Caption = 'Consumers';

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
                    NoSeriesMgt.TestManual(LibrarySetup."Consumer No.");
                    "No. Series" := '';
                end;
                CreatedAt := System.Today();
            end;
        }
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
        }
        field(3; Surname; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Surname';
        }
        field(4; CreatedAt; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Created At';
        }
        field(5; "No. Series"; Code[20])
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
        NoSeriesMgt: Codeunit NoSeriesManagement;
        LibrarySetup: Record LibrarySetupTable;
        today: Date;


    trigger OnInsert()
    begin
        if "No." = '' then begin
            LibrarySetup.Get();
            LibrarySetup.TestField("Consumer No.");
            NoSeriesMgt.InitSeries(LibrarySetup."Consumer No.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure AssistEdit() Result: Boolean
    begin
        LibrarySetup.Get();
        LibrarySetup.TestField("Consumer No.");
        if NoSeriesMgt.SelectSeries(LibrarySetup."Consumer No.", xRec."No.", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;
    end;

}