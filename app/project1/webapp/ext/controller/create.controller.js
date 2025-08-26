sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/m/Dialog",
  "sap/m/Button",
  "sap/m/Input"
], function (Controller, Dialog, Button, Input) {
  "use strict";

  return Controller.extend("project1.ext.controller.create", {
    
    // Example: attach your dialog logic here
    onCreateCategoryPress: function () {
      var oDialog = new Dialog({
        title: "New Category",
        content: [
          new Input("newCategoryInput", {
            placeholder: "Enter category name"
          })
        ],
        beginButton: new Button({
          text: "Create",
          press: function () {
            var val = sap.ui.getCore().byId("newCategoryInput").getValue();
            sap.m.MessageToast.show("Created: " + val);
            oDialog.close();
          }
        }),
        endButton: new Button({
          text: "Cancel",
          press: function () {
            oDialog.close();
          }
        }),
        afterClose: function () {
          oDialog.destroy();
        }
      });
      oDialog.open();
    }

  });
});
