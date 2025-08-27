sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        PasteButtonEnabled: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        },
        ClearTextAction: function() {
            MessageToast.show("Custom handler invoked.");
        },
    };
});
