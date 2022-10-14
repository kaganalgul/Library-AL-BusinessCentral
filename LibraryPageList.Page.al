page 50006 LibraryPageList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = LibraryTableHeader;
    CardPageId = LibraryDocumentPage;
    SourceTableView = where(IsArchived = const(false));
    Editable = false;
    Caption = 'Library Page List';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field(ConsumerName; Rec.ConsumerName)
                {
                    ApplicationArea = All;

                }
                field(ConsumerSurname; Rec.ConsumerSurname)
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
}