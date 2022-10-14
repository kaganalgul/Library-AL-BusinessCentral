page 50002 LibraryBookCard
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = LibraryBook;
    Caption = 'Library Book Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit() then
                            CurrPage.Update();
                    end;
                }
                field(BookName; Rec.BookName)
                {
                    ApplicationArea = All;
                }
                field(BookGenre; Rec.BookGenre)
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

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}