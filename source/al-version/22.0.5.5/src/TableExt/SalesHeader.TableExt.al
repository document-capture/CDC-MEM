/// <summary>
/// TableExtension SH - DC MEM Dimensions (ID 50002) extends Record Sales Header.
/// </summary>
tableextension 50002 "SH - DC MEM Dimensions" extends "Sales Header"
{
    fields
    {
        field(50000; "CDC Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}