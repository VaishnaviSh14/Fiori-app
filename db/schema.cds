namespace sap.cap.session;

using { cuid, managed } from '@sap/cds/common';

entity ConfigProduct : cuid, managed {
    Name        : String(100) @title : 'Name';
    Type        : String(50)  @title : 'Type';
    Description : String(255) @title : 'Description';
    Category    : String(50)  @title : 'Category';
    Priority    : String(20)  @title : 'Priority';
    createdAt   : DateTime   @title : 'Created On';
    GeneralInfo : DateTime   @title : 'Details';
    EvaluationConditions : String(255) ;
}

entity FieldTypes {
    code : String(50);
    name : String(100);
}

entity TypeValues {
    ID   : String(50);
    Name : String(100);
}

entity PriorityValues {
    ID   : String(20);
    Name : String(100);
}

entity CategoryValues {
    ID   : String(50);
    Name : String(100);
}


