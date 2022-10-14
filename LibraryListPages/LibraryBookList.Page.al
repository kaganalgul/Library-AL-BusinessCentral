page 50000 LibraryBookList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = LibraryBook;
    CardPageId = LibraryBookCard;
    Editable = false;
    Caption = 'Library Book List';

    layout
    {
        area(Content)
        {
            repeater(RepeaterGroup)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(BookName; Rec.BookName)
                {
                    ApplicationArea = All;
                }
                field(BookGenre; Rec.BookGenre)
                {
                    ApplicationArea = All;
                }
                field(BookLendingTo; Rec.BookLendingTo)
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
            action(Report)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Report';
                Image = Report;
                RunObject = report LibraryBook;
                trigger OnAction();
                begin

                end;
            }
        }
    }
}