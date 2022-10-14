page 50007 LibrarySetupPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    DeleteAllowed = false;
    InsertAllowed = false;
    SourceTable = LibrarySetupTable;
    Caption = 'Library Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Doc. No."; Rec."Doc. No.")
                {
                    ApplicationArea = All;
                }
                field("Book No."; Rec."Book No.")
                {
                    ApplicationArea = All;
                }
                field("Consumer No."; Rec."Consumer No.")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

    end;
}