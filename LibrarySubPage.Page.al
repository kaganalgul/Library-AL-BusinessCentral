page 50004 LibrarySubPage
{
    PageType = ListPart;
    UsageCategory = None;
    SourceTable = LibraryTableLine;
    Caption = 'Library Sub Page';
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(RepeaterGroup)
            {
                field(BookNo; Rec.BookNo)
                {
                    ApplicationArea = All;
                }
                field(BookName; Rec.BookName)
                {
                    ApplicationArea = All;
                }
                field(BookTakenDate; Rec.BookTakenDate)
                {
                    ApplicationArea = All;
                }
                field(BookGivenDate; Rec.BookGivenDate)
                {
                    ApplicationArea = All;
                }
                field(IsBookRetrieve; Rec.IsBookRetrieve)
                {
                    ApplicationArea = All;
                }
            }
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
    // trigger OnInit()
    // var
    //     LibraryTableLine: Record LibraryTableLine;
    // begin
    //     LibraryTableLine.Reset();
    //     LibraryTableLine.SetFilter(IsBookRetrieve, 'false');
    //     LibraryTableLine.SetRecFilter();
    // end;
}