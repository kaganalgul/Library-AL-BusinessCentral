page 50005 LibraryDocumentPage
{
    PageType = Document;
    UsageCategory = None;
    SourceTable = LibraryTableHeader;
    Caption = 'Library Document Page';

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
                field(ConsumerNo; Rec.ConsumerNo)
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(IsArchived; Rec.IsArchived)
                {
                    ApplicationArea = All;
                }
            }
            part(LibrarySubPage; LibrarySubPage)
            {
                SubPageLink = DocumentNo = field("No.");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Release)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Release Document';
                Image = Agreement;
                trigger OnAction()
                begin
                    if (Rec.ConsumerName <> '') AND (Rec.ConsumerSurname <> '') AND (Rec."No." <> '') then begin
                        Line.Reset();
                        Line.SetRange(DocumentNo, Rec."No."); // DocumentNo'su ??imdiki No. olan belgeyi se??er.
                        Line.FindSet();
                        repeat
                        begin
                            Book.Get(Line.BookNo);
                            Book.BookLendingTo := Rec.ConsumerNo + ' ' + '(' + Rec.ConsumerName + ')';
                            if Line.IsBookRetrieve then begin
                                Book.BookLendingTo := '';
                            end;
                            Book.Modify();
                        end until Line.Next() = 0;
                        Rec.Status := LibraryDocEnum::Released;
                    end
                end;
            }

            action(Archive)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Archive Document';
                Image = Archive;

                trigger OnAction()
                begin
                    Line.Reset();
                    Line.SetRange(DocumentNo, Rec."No."); // DocumentNo'su ??imdiki No. olan belgeyi se??er.
                    Line.FindSet();
                    repeat
                    begin
                        if not Line.IsBookRetrieve then begin
                            Error('Teslim al??nmam???? kitaplar oldu??u i??in belge ar??ivlenemez.');
                        end;
                        if Rec.Status = LibraryDocEnum::Open then begin
                            Error('Dosya ar??ivlenmeden ??nce Release edilmelidir.');
                        end;
                        Line.IsBookRetrieve := false;

                    end until Line.Next() = 0;
                    Rec.IsArchived := true;
                end;
            }

            action(Report)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Report';
                Image = Report;

                trigger OnAction()
                var
                    LibraryTableHeader: Record LibraryTableHeader;
                begin
                    LibraryTableHeader.Get(rec."No.");
                    LibraryTableHeader.SetRecFilter();
                    Report.RunModal(Report::LibraryDocument, true, false, LibraryTableHeader);
                end;
            }
        }
    }

    var
        myInt: Integer;
        Line: Record LibraryTableLine;
        Book: Record LibraryBook;
        Header: Record LibraryTableHeader;
        Consumer: Record LibraryConsumer;

    trigger OnInit()
    var
        myInt: Integer;
    begin

    end;
}