using MyService as service from '../../srv/service';
using from '../../db/schema';

annotate service.ConfigProducts with @(
    UI.SelectionFields : [
        Type,
        Category,
        Priority,
        createdAt     
    ],
     UI.FieldGroup #GeneralInfo : {
        Data : [
            { $Type : 'UI.DataField', Value : Name,        Label : '{i18n>Name}', Placeholder : 'Enter Name' },
            { $Type : 'UI.DataField', Value : Description, Label : '{i18n>Description}' },
            { $Type : 'UI.DataField', Value : Type,        Label : '{i18n>Type}' },
            { $Type : 'UI.DataField', Value : Category,    Label : '{i18n>Category}' },
            { $Type : 'UI.DataField', Value : Priority,    Label : '{i18n>Criticality}' },
        ]
    },

    UI.FieldGroup #EvalConditions : {
        Data : [
            { $Type : 'UI.DataField', Value : EvalConditions, Label : '{i18n>EvalConditions}' }
        ]
    },
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Type',
                Value : Type,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : Description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Category',
                Value : Category,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Critical/Priority',
                Value : Priority,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>CreatedOnAt}',
                Value : createdAt,
            },
        ],
    },
    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneralInfo'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>EvaluationConditions}',
            Target : '@UI.FieldGroup#EvalConditions'
        }
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Type',
            Value : Type,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : Description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Category',
            Value : Category,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Critical/Priority',
            Value : Priority,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Created On / At',
            Value : createdAt,
        },
    ],
    );


annotate service.ConfigProducts with {
    EvalConditions @UI.MultiLineText : true
};

annotate MyService.ConfigProducts with {
  Name @UI.Placeholder: '{i18n>Enter a name}'  @(Common.FieldControl: #Mandatory);
  Type @UI.Placeholder: '{i18n>Select}' @(Common.FieldControl: #Mandatory);
  Priority @UI.Placeholder: '{i18n>Select}';
  Description @UI.Placeholder: '{i18n>Enter a Description}'  @(Common.FieldControl: #Mandatory);
  Category @UI.Placeholder: '{i18n>Select}'@(Common.FieldControl: #Mandatory);
  EvalConditions @UI.MultiLineText @UI.Placeholder: '{i18n>Enter Evaluation Conditions}';
  createdAt @UI.Placeholder: '{i18n>CreatedAtPlaceholder}';
};

annotate ConfigProduct with {
    Name      @UI.Field : [{ mandatory : true }];
    Type      @UI.Field : [{ mandatory : true }];
    Category  @UI.Field : [{ mandatory : true }];
    Critical  @UI.Field : [{ mandatory : true }];
};


annotate MyService.ConfigProducts with {

  @Common.ValueListWithFixedValues : true
  @Common.ValueList : {
    $Type          : 'Common.ValueListType',
    Label          : 'Type',
    CollectionPath : 'TypeValues', 
    Parameters     : [
      {
        $Type              : 'Common.ValueListParameterInOut',
        LocalDataProperty  : Type,
        ValueListProperty  : 'ID'     
      },
      {
        $Type              : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty  : 'Name'   
      }
    ]
  }
  Type;

  @Common.ValueListWithFixedValues : true
  @Common.ValueList : {
    $Type          : 'Common.ValueListType',
    Label          : 'Priority',
    CollectionPath : 'PriorityValues',
    Parameters     : [
      {
        $Type              : 'Common.ValueListParameterInOut',
        LocalDataProperty  : Priority,
        ValueListProperty  : 'ID'
      },
      {
        $Type              : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty  : 'Name'
      }
    ]
  }
  Priority;

  @Common.ValueListWithFixedValues : true
  @Common.ValueList : {
    $Type          : 'Common.ValueListType',
    Label          : 'Category',
    CollectionPath : 'CategoryValues',
    Parameters     : [
      {
        $Type              : 'Common.ValueListParameterInOut',
        LocalDataProperty  : Category,
        ValueListProperty  : 'ID'
      },
      {
        $Type              : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty  : 'Name'
      }
    ]
  }
  Category;
};
