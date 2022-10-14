table 50003 LibraryTableHeader
{
    DataClassification = ToBeClassified;
    Caption = 'Library Table Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    LibrarySetup.Get();
                    NoSeriesMgt.TestManual(LibrarySetup."Doc. No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; ConsumerName; Text[50])
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(LibraryConsumer.Name where("No." = field(ConsumerNo)));
            Caption = 'Name';
        }
        field(3; ConsumerSurname; Text[50])
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(LibraryConsumer.Surname where("No." = field(ConsumerNo)));
            Caption = 'Surname';
        }
        field(4; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(5; Status; Enum LibraryDocEnum)
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
            Editable = false;
        }
        field(6; IsArchived; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Archive Status';
        }
        field(7; ConsumerNo; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = LibraryConsumer;
            trigger OnValidate()
            begin
                CalcFields(ConsumerName, ConsumerSurname);
            end;
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
        LibraryConsumer: Record LibraryConsumer;
        LibraryTableLine: Record LibraryTableLine;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            LibrarySetup.Get();
            LibrarySetup.TestField("Doc. No.");
            NoSeriesMgt.InitSeries(LibrarySetup."Doc. No.", xRec."No. Series", 0D, "No.", "No. Series"); //0D -> Boş Tarih
        end;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        LibraryTableLine.Reset();
        LibraryTableLine.SetRange(DocumentNo, Rec."No.");
        LibraryTableLine.FindSet();
        if LibraryTableLine.BookNo <> '' then begin
            repeat begin
                LibraryTableLine.Delete();
            end until LibraryTableLine.Next() = 0;
        end;


    end;

    trigger OnRename()
    begin

    end;

    procedure AssistEdit() Result: Boolean
    begin
        LibrarySetup.Get();
        LibrarySetup.TestField("Doc. No.");
        if NoSeriesMgt.SelectSeries(LibrarySetup."Doc. No.", xRec."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;
    end;
}