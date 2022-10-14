table 50005 LibrarySetupTable
{
    DataClassification = ToBeClassified;
    Caption = 'Library User Setup Table';
    DrillDownPageId = LibrarySetupPage;
    LookupPageId = LibrarySetupPage;
    ReplicateData = true;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(2; "Doc. No."; Code[20])
        {
            Caption = 'Doc. No.';
            TableRelation = "No. Series";
        }
        field(3; "Book No."; Code[20])
        {
            Caption = 'Book No.';
            TableRelation = "No. Series";
        }
        field(4; "Consumer No."; Code[20])
        {
            Caption = 'Consumer No.';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}