page 50009 LibraryArchPageList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = LibraryTableHeader;
    CardPageId = LibraryArchivedDocumentPage;
    Editable = false;
    SourceTableView = where(IsArchived = const(true));
    Caption = 'Library Archived Page List';

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