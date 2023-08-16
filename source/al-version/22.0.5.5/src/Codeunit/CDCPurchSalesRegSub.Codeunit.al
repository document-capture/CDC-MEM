/// <summary>
/// Codeunit CDC Purch./Sales - Reg. Sub. (ID 50000).
/// </summary>
codeunit 50000 "CDC Purch./Sales - Reg. Sub."
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDC Purch. - Register", 'OnBeforePurchHeaderInsert', '', true, true)]
    local procedure PopDimensionsOnBeforePurchHeaderInsertC6085706(Document: Record "CDC Document"; var PurchHeader: Record "Purchase Header")
    var
        GLSetup: Record "General Ledger Setup";
        CDCTemplateField: Record "CDC Template Field";
        DimMgt: Codeunit DimensionManagement;
        CDCCaptureMgt: Codeunit "CDC Capture Management";
        DimValueCode: Code[20];
    begin
        GLSetup.Get();

        CDCTemplateField.SetRange("Template No.", Document."Template No.");
        CDCTemplateField.SetRange(Type, CDCTemplateField.Type::Header);
        CDCTemplateField.SetRange("Data Type", CDCTemplateField."Data Type"::Lookup);
        CDCTemplateField.SetRange("Source Table No.", Database::"Dimension Value");
        //if CDCTemplateField.FindSet(false, false) then begin
        if CDCTemplateField.FindSet(false) then begin
            PurchHeader."CDC Document No." := Document."No.";
            repeat
                Clear(DimMgt);
                DimValueCode := CDCCaptureMgt.GetValueAsText(Document."No.", 0, CDCTemplateField);
                if (DimValueCode <> '') or (CDCTemplateField."Transfer Blank Values") then begin
                    case true of
                        CDCTemplateField.Code = GLSetup."Global Dimension 1 Code":
                            begin
                                PurchHeader."Shortcut Dimension 1 Code" := DimValueCode;
                                DimMgt.ValidateShortcutDimValues(1, DimValueCode, PurchHeader."Dimension Set ID");
                            end;

                        CDCTemplateField.Code = GLSetup."Global Dimension 2 Code":
                            begin
                                PurchHeader."Shortcut Dimension 2 Code" := DimValueCode;
                                DimMgt.ValidateShortcutDimValues(2, DimValueCode, PurchHeader."Dimension Set ID");
                            end;

                        CDCTemplateField.Code = GLSetup."Shortcut Dimension 3 Code":
                            DimMgt.ValidateShortcutDimValues(3, DimValueCode, PurchHeader."Dimension Set ID");

                        CDCTemplateField.Code = GLSetup."Shortcut Dimension 4 Code":
                            DimMgt.ValidateShortcutDimValues(4, DimValueCode, PurchHeader."Dimension Set ID");

                        CDCTemplateField.Code = GLSetup."Shortcut Dimension 5 Code":
                            DimMgt.ValidateShortcutDimValues(5, DimValueCode, PurchHeader."Dimension Set ID");

                        CDCTemplateField.Code = GLSetup."Shortcut Dimension 6 Code":
                            DimMgt.ValidateShortcutDimValues(6, DimValueCode, PurchHeader."Dimension Set ID");

                        CDCTemplateField.Code = GLSetup."Shortcut Dimension 7 Code":
                            DimMgt.ValidateShortcutDimValues(7, DimValueCode, PurchHeader."Dimension Set ID");

                        CDCTemplateField.Code = GLSetup."Shortcut Dimension 8 Code":
                            DimMgt.ValidateShortcutDimValues(8, DimValueCode, PurchHeader."Dimension Set ID");
                    end;
                end;
            until CDCTemplateField.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDC Sales - Register", 'OnBeforeCreateSalesHeaderInsert', '', true, true)]
    local procedure PopDimensionsOnBeforeCreateSalesHeaderInsertC6085776(Document: Record "CDC Document"; var SalesHeader: Record "Sales Header")
    var
        GLSetup: Record "General Ledger Setup";
        CDCTemplateField: Record "CDC Template Field";
        DimMgt: Codeunit DimensionManagement;
        CDCCaptureMgt: Codeunit "CDC Capture Management";
        DimValueCode: Code[20];
    begin
        GLSetup.Get();

        CDCTemplateField.SetRange("Template No.", Document."Template No.");
        CDCTemplateField.SetRange(Type, CDCTemplateField.Type::Header);
        CDCTemplateField.SetRange("Data Type", CDCTemplateField."Data Type"::Lookup);
        CDCTemplateField.SetRange("Source Table No.", Database::"Dimension Value");
        //if CDCTemplateField.FindSet(false, false) then begin
        if CDCTemplateField.FindSet(false) then begin
            SalesHeader."CDC Document No." := Document."No.";
            repeat
                Clear(DimMgt);
                DimValueCode := CDCCaptureMgt.GetValueAsText(Document."No.", 0, CDCTemplateField);
                if (DimValueCode <> '') or (CDCTemplateField."Transfer Blank Values") then begin
                    case true of
                        CDCTemplateField.Code = GLSetup."Global Dimension 1 Code":
                            begin
                                SalesHeader."Shortcut Dimension 1 Code" := DimValueCode;
                                DimMgt.ValidateShortcutDimValues(1, DimValueCode, SalesHeader."Dimension Set ID");
                            end;

                        CDCTemplateField.Code = GLSetup."Global Dimension 2 Code":
                            begin
                                SalesHeader."Shortcut Dimension 2 Code" := DimValueCode;
                                DimMgt.ValidateShortcutDimValues(2, DimValueCode, SalesHeader."Dimension Set ID");
                            end;

                        CDCTemplateField.Code = GLSetup."Shortcut Dimension 3 Code":
                            DimMgt.ValidateShortcutDimValues(3, DimValueCode, SalesHeader."Dimension Set ID");

                        CDCTemplateField.Code = GLSetup."Shortcut Dimension 4 Code":
                            DimMgt.ValidateShortcutDimValues(4, DimValueCode, SalesHeader."Dimension Set ID");

                        CDCTemplateField.Code = GLSetup."Shortcut Dimension 5 Code":
                            DimMgt.ValidateShortcutDimValues(5, DimValueCode, SalesHeader."Dimension Set ID");

                        CDCTemplateField.Code = GLSetup."Shortcut Dimension 6 Code":
                            DimMgt.ValidateShortcutDimValues(6, DimValueCode, SalesHeader."Dimension Set ID");

                        CDCTemplateField.Code = GLSetup."Shortcut Dimension 7 Code":
                            DimMgt.ValidateShortcutDimValues(7, DimValueCode, SalesHeader."Dimension Set ID");

                        CDCTemplateField.Code = GLSetup."Shortcut Dimension 8 Code":
                            DimMgt.ValidateShortcutDimValues(8, DimValueCode, SalesHeader."Dimension Set ID");
                    end;
                end;
            until CDCTemplateField.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeInsertEvent', '', true, true)]
    local procedure PopDimensionsOnBeforeInsertEventT39(var Rec: Record "Purchase Line"; RunTrigger: Boolean)
    var
        PurchaseHeader: Record "Purchase Header";
        CDCDocument: record "CDC Document";
    begin
        if Rec.IsTemporary then
            exit;

        if PurchaseHeader.get(Rec."Document Type", Rec."Document No.") then
            if PurchaseHeader."CDC Document No." <> '' then
                if CDCDocument.get(PurchaseHeader."CDC Document No.") then begin
                    if Rec."Shortcut Dimension 1 Code" = '' then
                        Rec."Shortcut Dimension 1 Code" := PurchaseHeader."Shortcut Dimension 1 Code";
                    if Rec."Shortcut Dimension 2 Code" = '' then
                        Rec."Shortcut Dimension 2 Code" := PurchaseHeader."Shortcut Dimension 2 Code";
                    //Rec."Dimension Set ID" := PurchaseHeader."Dimension Set ID";
                end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeInsertEvent', '', true, true)]
    local procedure PopDimensionsOnBeforeInsertEventT37(var Rec: Record "Sales Line"; RunTrigger: Boolean)
    var
        SalesHeader: Record "Sales Header";
        CDCDocument: record "CDC Document";
    begin
        if Rec.IsTemporary then
            exit;

        if SalesHeader.get(Rec."Document Type", Rec."Document No.") then
            if SalesHeader."CDC Document No." <> '' then
                if CDCDocument.get(SalesHeader."CDC Document No.") then begin
                    if Rec."Shortcut Dimension 1 Code" = '' then
                        Rec."Shortcut Dimension 1 Code" := SalesHeader."Shortcut Dimension 1 Code";
                    if Rec."Shortcut Dimension 2 Code" = '' then
                        Rec."Shortcut Dimension 2 Code" := SalesHeader."Shortcut Dimension 2 Code";
                    //Rec."Dimension Set ID" := SalesHeader."Dimension Set ID";
                end;
    end;
}