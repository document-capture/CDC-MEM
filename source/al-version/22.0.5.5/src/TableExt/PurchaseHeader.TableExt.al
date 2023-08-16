/// <summary>
/// TableExtension PH - DC MEM Dimensions (ID 50001) extends Record Purchase Header.
/// </summary>
tableextension 50001 "PH - DC MEM Dimensions" extends "Purchase Header"
{
    fields
    {
        field(50000; "CDC Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}