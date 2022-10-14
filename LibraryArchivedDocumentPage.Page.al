page 50008 LibraryArchivedDocumentPage
{
    PageType = Document;
    UsageCategory = None;
    SourceTable = LibraryTableHeader;
    Caption = 'Library Document Page';

    Editable = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit() then
                            CurrPage.Update();
                    end;
                }
                field(ConsumerName; Rec.ConsumerName)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }
                field(ConsumerSurname; Rec.ConsumerSurname)
                {
                    ApplicationArea = All;
                    Caption = 'Surname';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }
                field(IsArchived; Rec.IsArchived)
                {
                    ApplicationArea = All;
                    Caption = 'Archive Status';
                }
            }
            part(LibrarySubPage; LibrarySubPage)
            {
                SubPageLink = DocumentNo = field("No.");
                ApplicationArea = All;
            }
        }
    }
}