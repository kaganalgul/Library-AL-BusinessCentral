report 50001 LibraryBook
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Book Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layout/LibraryBook.rdl';

    dataset
    {
        dataitem(LibraryBook; LibraryBook)
        {
            column(No_; "No.")
            {

            }
            column(BookName; BookName)
            {

            }
            column(BookLendingTo; BookLendingTo)
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}