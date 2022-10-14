report 50000 LibraryDocument
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = None;
    DefaultLayout = RDLC;
    Caption = 'Library Document Report';
    RDLCLayout = './Layout/LibraryDocument.rdl';

    dataset
    {
        dataitem(LibraryTableHeader; LibraryTableHeader)
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            {

            }
            column(ConsumerNo; ConsumerNo)
            {

            }
            column(ConsumerName; ConsumerName)
            {

            }
            column(ConsumerSurname; ConsumerSurname)
            {

            }
            dataitem(LibraryTableLine; LibraryTableLine)
            {
                DataItemLink = DocumentNo = field("No.");
                column(BookNo; BookNo)
                {

                }
                column(BookName; BookName)
                {

                }
                column(BookGivenDate; BookGivenDate)
                {

                }
                column(BookTakenDate; BookTakenDate)
                {

                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                // group(GroupName)
                // {
                //     field(Name; SourceExpression)
                //     {
                //         ApplicationArea = All;

                //     }
                // }
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